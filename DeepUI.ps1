# Set hacker-themed ANSI colors (works in modern terminals)
Write-Host "$([char]27)[38;2;40;255;40m" # Neon green
$host.UI.RawUI.BackgroundColor = "Black"
Clear-Host

# ASCII Art with gradient effect
Write-Host @"

$([char]27)[38;2;0;255;0m██████╗ ███████╗███████╗██████╗ ██╗   ██╗██╗
$([char]27)[38;2;40;255;40m██╔══██╗██╔════╝██╔════╝██╔══██╗██║   ██║██║
$([char]27)[38;2;80;255;80m██║  ██║█████╗  █████╗  ██████╔╝██║   ██║██║
$([char]27)[38;2;120;255;120m██║  ██║██╔══╝  ██╔══╝  ██╔═══╝ ╚██╗ ██╔╝██║
$([char]27)[38;2;160;255;160m██████╔╝███████╗███████╗██║      ╚████╔╝ ██║
$([char]27)[38;2;200;255;200m╚═════╝ ╚══════╝╚══════╝╚═╝       ╚═══╝  ╚═╝

$([char]27)[38;2;0;255;255m          Open Source AI made easy.
$([char]27)[38;2;40;200;255m            » [DeepUI] :: Next-gen AI toolkit
"@

# Style configuration
$ACCENT = "$([char]27)[38;2;0;255;255m"   # Cyan
$TEXT = "$([char]27)[38;2;80;255;80m"     # Matrix green
$PROMPT = "$([char]27)[38;2;160;255;160m" # Bright green
$DIM = "$([char]27)[38;2;80;80;80m"       # Gray

function Show-Menu {
    Write-Host "`n${ACCENT}:: AI Model Hub ::${TEXT}"
    Write-Host "${DIM}----------------------------------------------------"

    @(
        "1  DeepSeek-R1  ${DIM}[14B]  ${TEXT}→  High-perf reasoning engine",
        "2  DeepSeek-R1  ${DIM}[7B]   ${TEXT}→  Balanced speed/accuracy",
        "3  CodeLlama     ${DIM}[7B]   ${TEXT}→  Code generation specialist",
        "4  Llama3       ${DIM}[3B]   ${TEXT}→  Lightweight generalist",
        "5  Llama3       ${DIM}[8B]   ${TEXT}→  Enhanced capabilities",
        "6  Mistral      ${DIM}[7B]   ${TEXT}→  French-English hybrid",
        "7  Qwen         ${DIM}[4B]   ${TEXT}→  Chinese-optimized",
        "8  Gemma        ${DIM}[2B]   ${TEXT}→  Google's compact model"
    ) | ForEach-Object {
        Write-Host " ${ACCENT}[${PROMPT}$($_.Substring(0,2).Trim())${ACCENT}]${TEXT} $($_.Substring(3))"
    }

    Write-Host "${DIM}----------------------------------------------------"
    Write-Host " ${ACCENT}[${PROMPT}Q${ACCENT}]${TEXT} Exit console"
    Write-Host ""
}

# Main interface
while ($true) {
    Show-Menu
    $choice = (Read-Host "${PROMPT}» Selection").ToUpper()

    $model = switch ($choice) {
        '1' { 'deepseek-r1:14b'; break }
        '2' { 'deepseek-r1:7b'; break }
        '3' { 'codellama:7b'; break }
        '4' { 'llama3.2'; break }
        '5' { 'llama3.1'; break }
        '6' { 'mistral'; break }
        '7' { 'qwen:4b'; break }
        '8' { 'gemma'; break }
        'Q' { 
            Write-Host "`n${ACCENT}» Terminating session. Stay covert.${DIM} [Connection closed]`n" 
            exit 
        }
        default {
            Write-Host "${DIM}⚠ Invalid input - use numeric selection"
            $null
        }
    }

    if ($model) {
        Write-Host "`n${DIM}Initializing ${ACCENT}$($model.Split(':')[0])${DIM} subsystem..."
        Write-Host "${DIM}----------------------------------------------------`n"
        ollama run $model
    }

    Read-Host "`n${DIM}Press Enter to return to hub"
    Clear-Host
}