#!/bin/bash
source /venv/main/bin/activate
COMFYUI_DIR=${WORKSPACE}/ComfyUI

# Packages are installed after nodes so we can fix them...

APT_PACKAGES=(
    #"package-1"
    #"package-2"
)

PIP_PACKAGES=(
    "--upgrade --force-reinstall https://github.com/JamePeng/llama-cpp-python/releases/download/v0.3.23-cu130-Basic-linux-20260129/llama_cpp_python-0.3.23+cu130.basic-cp312-cp312-linux_x86_64.whl"
)

NODES=(
    "https://github.com/ltdrdata/ComfyUI-Manager"
    "https://github.com/cubiq/ComfyUI_essentials"
    "https://github.com/ltdrdata/ComfyUI-Impact-Pack"
    "https://github.com/MoonGoblinDev/Civicomfy"
    "https://github.com/huchukato/comfy-tagcomplete"
    "https://github.com/Koishi-Star/Euler-Smea-Dyn-Sampler"
    "https://github.com/huchukato/ComfyUI-QwenVL-Mod"
    "https://github.com/ltdrdata/was-node-suite-comfyui"
    "https://github.com/Kosinkadink/ComfyUI-VideoHelperSuite"
    "https://github.com/rgthree/rgthree-comfy"
    "https://github.com/yolain/ComfyUI-Easy-Use"
    "https://github.com/kijai/ComfyUI-KJNodes"
    "https://github.com/Fannovel16/ComfyUI-Frame-Interpolation"
    "https://github.com/Smirnov75/ComfyUI-mxToolkit"
    "https://github.com/princepainter/ComfyUI-PainterI2V"
    "https://github.com/princepainter/ComfyUI-PainterI2Vadvanced"
    "https://github.com/princepainter/ComfyUI-PainterLongVideo"
    "https://github.com/ashtar1984/comfyui-find-perfect-resolution"
    "https://github.com/ComfyAssets/ComfyUI_Selectors"
    "https://github.com/city96/ComfyUI-GGUF"
    "https://github.com/kijai/ComfyUI-MMAudio"
    "https://github.com/GACLove/ComfyUI-VFI"
    "https://github.com/pythongosssss/ComfyUI-Custom-Scripts"
    "https://github.com/yuvraj108c/ComfyUI-Upscaler-Tensorrt"
    "https://github.com/huchukato/ComfyUI-RIFE-TensorRT-Auto"
    "https://github.com/stduhpf/ComfyUI-WanMoeKSampler"
    "https://github.com/melMass/comfy_mtb"
    
    "https://github.com/SeanScripts/ComfyUI-Unload-Model"
    "https://github.com/alexopus/ComfyUI-Image-Saver"
    "https://github.com/lquesada/ComfyUI-Inpaint-CropAndStitch"
    "https://github.com/PozzettiAndrea/ComfyUI-SAM3"
	"https://github.com/ltdrdata/ComfyUI-Impact-Subpack"
	"https://github.com/ssitu/ComfyUI_UltimateSDUpscale"
	
)

WORKFLOWS=(
    "https://github.com/huchukato/ComfyUI-QwenVL-Mod/raw/main/vastai/workflows/SDXL-LoRaStack-Upscale.json"
    "https://github.com/huchukato/ComfyUI-QwenVL-Mod/raw/main/vastai/workflows/WAN2.2-I2V-AutoPrompt-1-4.json"
    "https://github.com/huchukato/ComfyUI-QwenVL-Mod/raw/main/vastai/workflows/WAN2.2-I2V-AutoPrompt-GGUF-1-4.json"
    "https://github.com/huchukato/ComfyUI-QwenVL-Mod/raw/main/vastai/workflows/WAN2.2-T2V-AutoPrompt-1-5.json"
    "https://github.com/huchukato/ComfyUI-QwenVL-Mod/raw/main/vastai/workflows/WAN2.2-T2V-AutoPrompt-GGUF-1-4.json"
    "https://github.com/huchukato/ComfyUI-QwenVL-Mod/raw/main/vastai/workflows/Wan2.2-I2V-SVI-AutoPrompt-1-3.json"
    "https://github.com/huchukato/ComfyUI-QwenVL-Mod/raw/main/vastai/workflows/Wan2.2-I2V-SVI-AutoPrompt-GGUF-1-1.json"
    "https://github.com/huchukato/ComfyUI-QwenVL-Mod/raw/main/vastai/workflows/WAN2.2-I2V-Full-AutoPrompt-MMAudio-v1-8.json"
    "https://github.com/huchukato/ComfyUI-QwenVL-Mod/raw/main/vastai/workflows/WAN2.2-I2V-Full-AutoPrompt-MMAudio-GGUF-v1-5.json"
    "https://github.com/huchukato/ComfyUI-QwenVL-Mod/raw/main/vastai/workflows/WAN2.2-T2V-Full-AutoPrompt-MMAudio-GGUF.json"

    "https://civitai.com/api/download/models/2668801"
)

DIFFUSION_MODELS=(
	### FLUXED
    ### https://civitai.com/models/847101/fluxed-up-flux-nsfw-checkpoint
    "https://civitai.com/api/download/models/2577735?type=Model&format=SafeTensor&size=pruned&fp=fp16"
	### FLUX BASE
	"https://huggingface.co/black-forest-labs/FLUX.1-dev/resolve/main/flux1-dev.safetensors"
	"https://huggingface.co/Comfy-Org/flux1-dev/resolve/main/flux1-dev-fp8.safetensors"

    ### Z-Image
    "https://civitai.com/api/download/models/2625526?type=Model&format=SafeTensor&size=pruned&fp=fp16"
    "https://huggingface.co/Comfy-Org/z_image_turbo/resolve/main/split_files/diffusion_models/z_image_turbo_bf16.safetensors"

    ### WAN 2.2
    ### SMOOTHMIX T2V
    ### Low
    "https://civitai.com/api/download/models/2324440?type=Model&format=SafeTensor&size=pruned&fp=fp8"
    ### HIGH
    "https://civitai.com/api/download/models/2323420?type=Model&format=SafeTensor&size=pruned&fp=fp8"

    ## Enhanced NSFW NoLight SVI CF FP8
    ### High
    "https://civitai.com/api/download/models/2609141?type=Model&format=SafeTensor&size=full&fp=fp16"
    ### Low 
    "https://civitai.com/api/download/models/2609148?type=Model&format=SafeTensor&size=full&fp=fp8"


)
CHECKPOINT_MODELS=(
)

UNET_MODELS=(
   
)

LORA_MODELS=(
    "https://huggingface.co/Kijai/WanVideo_comfy/resolve/main/LoRAs/Stable-Video-Infinity/v2.0/SVI_v2_PRO_Wan2.2-I2V-A14B_HIGH_lora_rank_128_fp16.safetensors"
    "https://huggingface.co/Kijai/WanVideo_comfy/resolve/main/LoRAs/Stable-Video-Infinity/v2.0/SVI_v2_PRO_Wan2.2-I2V-A14B_LOW_lora_rank_128_fp16.safetensors"
    "https://huggingface.co/Kijai/WanVideo_comfy/resolve/main/Lightx2v/lightx2v_I2V_14B_480p_cfg_step_distill_rank256_bf16.safetensors"

)

VAE_MODELS=(
    "https://huggingface.co/Comfy-Org/Wan_2.2_ComfyUI_Repackaged/resolve/main/split_files/vae/wan_2.1_vae.safetensors"
    "https://huggingface.co/Kijai/WanVideo_comfy/resolve/main/Wan2_1_VAE_fp32.safetensors"
    "https://huggingface.co/huchukato/favs/resolve/main/VAE/sdxl.vae.safetensors"
    "https://huggingface.co/Comfy-Org/z_image_turbo/resolve/main/split_files/vae/ae.safetensors"
)

ESRGAN_MODELS=(
    "https://huggingface.co/huchukato/favs/resolve/main/ESRGAN/2xLexicaRRDBNet.pth"
    "https://huggingface.co/huchukato/favs/resolve/main/ESRGAN/2xLexicaRRDBNet_Sharp.pth"
)

TEXT_ENCODERS=(
    "https://huggingface.co/NSFW-API/NSFW-Wan-UMT5-XXL/resolve/main/nsfw_wan_umt5-xxl_fp8_scaled.safetensors"
    ### FLUX BASE
    "https://huggingface.co/comfyanonymous/flux_text_encoders/resolve/main/clip_l.safetensors"
    "https://huggingface.co/comfyanonymous/flux_text_encoders/resolve/main/t5xxl_fp16.safetensors"
    "https://huggingface.co/comfyanonymous/flux_text_encoders/resolve/main/t5xxl_fp8_e4m3fn.safetensors"

    ### Z-Image
    "https://huggingface.co/Comfy-Org/z_image_turbo/resolve/main/split_files/text_encoders/qwen_3_4b.safetensors"

)

CONTROLNET_MODELS=(
)

BBOX_MODELS=(
    "https://huggingface.co/datasets/Gourieff/ReActor/resolve/main/models/detection/bbox/face_yolov8m.pt"
    "https://huggingface.co/xingren23/comfyflow-models/resolve/main/ultralytics/bbox/hand_yolov8s.pt"
    "https://civitai.com/api/download/models/3418466"
)

SAM3_MODELS=( 
    "https://huggingface.co/facebook/sam3/resolve/main/sam3.pt"
)
SEGM_MODELS=(
)

### DO NOT EDIT BELOW HERE UNLESS YOU KNOW WHAT YOU ARE DOING ###

function provisioning_start() {
    provisioning_print_header
    echo "🚀 Starting provisioning process..."
    
    echo "🎯 Downloading Models..."
    provisioning_get_files \
        "${COMFYUI_DIR}/models/diffusion_models" \
        "${DIFFUSION_MODELS[@]}" 

    echo "📦 Installing APT packages..."
    provisioning_get_apt_packages
    
    echo "🔧 Installing custom nodes..."
    provisioning_get_nodes
    
    echo "� Copying wildcards to Impact-Pack..."
    provisioning_copy_wildcards
    
    echo "� Installing PIP packages..."
    provisioning_get_pip_packages
       
    echo "📁 Downloading workflows..."
    provisioning_get_files \
        "${COMFYUI_DIR}/user/default/workflows" \
        "${WORKFLOWS[@]}"
        
    echo "🎯 Downloading checkpoint models..."
    provisioning_get_files \
        "${COMFYUI_DIR}/models/checkpoints" \
        "${CHECKPOINT_MODELS[@]}"
        
    echo "🧠 Downloading U-NET models..."
    provisioning_get_files \
        "${COMFYUI_DIR}/models/unet" \
        "${UNET_MODELS[@]}"
        
    echo "🎨 Downloading LoRA models..."
    provisioning_get_files \
        "${COMFYUI_DIR}/models/lora" \
        "${LORA_MODELS[@]}"
        
    echo "🎮 Downloading ControlNet models..."
    provisioning_get_files \
        "${COMFYUI_DIR}/models/controlnet" \
        "${CONTROLNET_MODELS[@]}"
        
    echo "🔮 Downloading VAE models..."
    provisioning_get_files \
        "${COMFYUI_DIR}/models/vae" \
        "${VAE_MODELS[@]}"
        
    echo "⚡ Downloading upscale models..."
    provisioning_get_files \
        "${COMFYUI_DIR}/models/upscale_models" \
        "${ESRGAN_MODELS[@]}"
        
    echo "📝 Downloading text encoders..."
    provisioning_get_files \
        "${COMFYUI_DIR}/models/text_encoders" \
        "${TEXT_ENCODERS[@]}"        
    
    echo "🎯 Downloading BBOX..."
    provisioning_get_files \
        "${COMFYUI_DIR}/models/ultralytics/bbox" \
        "${BBOX_MODELS[@]}"      
    


    provisioning_print_end
}

function provisioning_get_apt_packages() {
    if [[ -n $APT_PACKAGES ]]; then
            sudo $APT_INSTALL ${APT_PACKAGES[@]}
    fi
}

function provisioning_get_pip_packages() {
    if [[ -n $PIP_PACKAGES ]]; then
           echo "Installing PIP packages..."
           for package in "${PIP_PACKAGES[@]}"; do
               echo "Installing: $package"
               pip install --root-user-action=ignore --no-cache-dir $package
               echo "✓ Completed: $package"
           done
           echo "All PIP packages installed successfully!"
    fi
}

function provisioning_get_nodes() {
    echo "Processing ${#NODES[@]} nodes..."
    local count=0
    for repo in "${NODES[@]}"; do
        ((count++))
        dir="${repo##*/}"
        path="${COMFYUI_DIR}/custom_nodes/${dir}"
        requirements="${path}/requirements.txt"
        
        echo "[$count/${#NODES[@]}] Processing node: $dir"
        
        if [[ -d $path ]]; then
            if [[ ${AUTO_UPDATE,,} != "false" ]]; then
                echo "  → Updating existing node..."
                ( cd "$path" && git pull )
                if [[ -e $requirements ]]; then
                   echo "  → Installing requirements..."
                   pip install --root-user-action=ignore --no-cache-dir -r "$requirements"
                fi
            else
                echo "  → Node exists, skipping (AUTO_UPDATE=false)"
            fi
        else
            echo "  → Downloading new node..."
            git clone "${repo}" "${path}" --recursive
            if [[ -e $requirements ]]; then
                echo "  → Installing requirements..."
                pip install --root-user-action=ignore --no-cache-dir -r "${requirements}"
            fi
        fi
        echo "  ✓ Node $dir completed"
    done
    echo "All nodes processed successfully!"
}

function provisioning_copy_wildcards() {
    echo "Copying wildcards from ComfyUI-QwenVL-Mod to Impact-Pack..."
    
    local source_dir="${COMFYUI_DIR}/custom_nodes/ComfyUI-QwenVL-Mod/vastai/wildcards/mbe"
    local target_dir="${COMFYUI_DIR}/custom_nodes/ComfyUI-Impact-Pack/wildcards"
    
    # Create target directory if it doesn't exist
    mkdir -p "$target_dir"
    
    # Copy the entire mbe directory
    if [[ -d "$source_dir" ]]; then
        echo "  → Copying mbe wildcards..."
        cp -r "$source_dir" "$target_dir/"
        echo "  ✓ Wildcards copied successfully to $target_dir/mbe"
    else
        echo "  ⚠ Source directory not found: $source_dir"
        echo "  → Trying alternative path..."
        # Try alternative path if ComfyUI-QwenVL-Mod is in workspace
        local alt_source_dir="/workspace/ComfyUI-QwenVL-Mod/vastai/wildcards/mbe"
        if [[ -d "$alt_source_dir" ]]; then
            echo "  → Found at alternative path, copying..."
            cp -r "$alt_source_dir" "$target_dir/"
            echo "  ✓ Wildcards copied successfully from alternative path"
        else
            echo "  ⚠ Source directory not found at: $alt_source_dir"
        fi
    fi
}

function provisioning_get_files() {
    if [[ -z $2 ]]; then return 1; fi
    
    dir="$1"
    mkdir -p "$dir"
    shift
    arr=("$@")
    echo "Downloading ${#arr[@]} file(s) to $dir..."
    local count=0
    for url in "${arr[@]}"; do
        ((count++))
        echo "[$count/${#arr[@]}] Downloading: $(basename "$url")"
        echo "[$count/${#arr[@]}] Downloading: $url"
        provisioning_download "${url}" "${dir}"
        echo "  ✓ Download completed"
    done
    echo "All files downloaded successfully!"
}

function provisioning_print_header() {
    printf "\n##############################################\n#                                            #\n#          Provisioning container            #\n#                                            #\n#         This will take some time           #\n#                                            #\n# Your container will be ready on completion #\n#                                            #\n##############################################\n\n"
}

function provisioning_print_end() {
    printf "\nProvisioning complete:  Application will start now\n\n"
}

function provisioning_has_valid_hf_token() {
    [[ -n "$HF_TOKEN" ]] || return 1
    url="https://huggingface.co/api/whoami-v2"

    response=$(curl -o /dev/null -s -w "%{http_code}" -X GET "$url" \
        -H "Authorization: Bearer $HF_TOKEN" \
        -H "Content-Type: application/json")

    # Check if the token is valid
    if [ "$response" -eq 200 ]; then
        return 0
    else
        return 1
    fi
}

function provisioning_has_valid_civitai_token() {
    [[ -n "$CIVITAI_TOKEN" ]] || return 1
    url="https://civitai.com/api/v1/models?hidden=1&limit=1"

    response=$(curl -o /dev/null -s -w "%{http_code}" -X GET "$url" \
        -H "Authorization: Bearer $CIVITAI_TOKEN" \
        -H "Content-Type: application/json")

    # Check if the token is valid
    if [ "$response" -eq 200 ]; then
        return 0
    else
        return 1
    fi
}

# Download from $1 URL to $2 file path
function provisioning_download() {
    if [[ -n $HF_TOKEN && $1 =~ ^https://([a-zA-Z0-9_-]+\.)?huggingface\.co(/|$|\?) ]]; then
        auth_token="$HF_TOKEN"
    elif 
        [[ -n $CIVITAI_TOKEN && $1 =~ ^https://([a-zA-Z0-9_-]+\.)?civitai\.com(/|$|\?) ]]; then
        auth_token="$CIVITAI_TOKEN"
    fi
    echo " HEEEERRRRRRR Download failed ($auth_token): $url"

    if [[ -n $auth_token ]]; then
        
        wget --header="Authorization: Bearer $auth_token" -nc --content-disposition --trust-server-names --show-progress --progress=bar:force --max-redirect=20 -P "$2" "$1"
    else
        wget -nc --content-disposition --trust-server-names --show-progress --progress=bar:force --max-redirect=20 -P "$2" "$1"
    fi
    status=$?

    if [[ $status -ne 0 ]]; then
        echo "  ❌ Download failed ($status): $url"
        return $status
    fi
}

# Allow user to disable provisioning if they started with a script they didn't want
if [[ ! -f /.noprovisioning ]]; then
    provisioning_start
fi
