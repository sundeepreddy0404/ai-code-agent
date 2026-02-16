#!/bin/bash

# AI Code Agent - GitHub Deployment Script
# This script will initialize git and push to GitHub

echo "🚀 AI Code Agent - GitHub Deployment"
echo "======================================"
echo ""

# Check if git is installed
if ! command -v git &> /dev/null
then
    echo "❌ Git is not installed. Please install Git first:"
    echo "   Visit: https://git-scm.com/"
    exit 1
fi

echo "✅ Git found"
echo ""

# Initialize git repository
echo "📦 Initializing git repository..."
git init

# Add all files
echo "📝 Adding files to git..."
git add .

# Create initial commit
echo "💾 Creating initial commit..."
git commit -m "Initial commit: AI Code Agent - Agentic coding assistant"

echo ""
echo "🎯 Choose your deployment method:"
echo ""
echo "1. GitHub CLI (fastest - creates repo automatically)"
echo "2. HTTPS (manual - you create repo first on GitHub)"
echo "3. SSH (requires SSH keys setup)"
echo ""
read -p "Enter your choice (1/2/3): " choice

case $choice in
    1)
        # GitHub CLI
        if ! command -v gh &> /dev/null
        then
            echo "❌ GitHub CLI not found. Install it from: https://cli.github.com/"
            echo "   Or use option 2 (HTTPS) instead"
            exit 1
        fi
        
        echo "🚀 Creating repository and pushing..."
        gh repo create ai-code-agent --public --source=. --remote=origin --push
        echo ""
        echo "✅ Done! Repository created at:"
        echo "   https://github.com/sundeepreddy0404/ai-code-agent"
        ;;
        
    2)
        # HTTPS
        echo ""
        echo "📋 Manual Setup Steps:"
        echo "1. Go to: https://github.com/new"
        echo "2. Repository name: ai-code-agent"
        echo "3. Set to Public"
        echo "4. DO NOT initialize with README"
        echo "5. Click 'Create repository'"
        echo ""
        read -p "Press Enter after creating the repository on GitHub..."
        
        echo "🔗 Adding remote..."
        git remote add origin https://github.com/sundeepreddy0404/ai-code-agent.git
        
        echo "🌿 Setting branch to main..."
        git branch -M main
        
        echo "⬆️ Pushing to GitHub..."
        git push -u origin main
        
        echo ""
        echo "✅ Done! Check your repository at:"
        echo "   https://github.com/sundeepreddy0404/ai-code-agent"
        ;;
        
    3)
        # SSH
        echo "🔗 Adding remote with SSH..."
        git remote add origin git@github.com:sundeepreddy0404/ai-code-agent.git
        
        echo "🌿 Setting branch to main..."
        git branch -M main
        
        echo "⬆️ Pushing to GitHub..."
        git push -u origin main
        
        echo ""
        echo "✅ Done! Check your repository at:"
        echo "   https://github.com/sundeepreddy0404/ai-code-agent"
        ;;
        
    *)
        echo "❌ Invalid choice. Please run the script again."
        exit 1
        ;;
esac

echo ""
echo "🎉 Success! Your AI Code Agent is now on GitHub!"
echo ""
echo "📌 Next Steps:"
echo "   • Star your repo: https://github.com/sundeepreddy0404/ai-code-agent"
echo "   • Add topics: ai, code-assistant, agentic-ai, claude, react"
echo "   • Deploy on GitHub Pages (optional)"
echo ""
