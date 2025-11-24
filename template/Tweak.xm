#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "ImGui/imgui.h" // يفترض أن مجلد ImGui بجانبه

// --- إعدادات رنيم ---
bool showMenu = true;
bool isVerified = false;
char keyInput[64] = ""; 

// خيارات القائمة الوهمية
bool aimfov = false;
bool aimsilent = false;
bool espbox = false;
bool esplines = false;
bool ninjarun = false;
bool speedhack = false;

// --- دالة الحماية (Anti-Steal) ---
bool CheckIntegrity() {
    return true; // سأعطلك مؤقتاً لتجنب أي أخطاء بناء، سنفعلها لاحقاً
}

// --- تصميم رنيم الوردي (Theme) ---
void SetupStyle() {
    ImGuiStyle& style = ImGui::GetStyle();
    style.WindowRounding = 12.0f;
    style.FrameRounding = 6.0f;
    
    ImVec4 pink = ImVec4(1.00f, 0.40f, 0.70f, 1.00f); 
    ImVec4 darkPink = ImVec4(0.80f, 0.20f, 0.50f, 0.90f); 
    ImVec4 blurBG = ImVec4(0.10f, 0.05f, 0.10f, 0.85f); 

    style.Colors[ImGuiCol_WindowBg] = blurBG;
    style.Colors[ImGuiCol_TitleBg] = darkPink;
    style.Colors[ImGuiCol_TitleBgActive] = pink;
    style.Colors[ImGuiCol_CheckMark] = pink;
    style.Colors[ImGuiCol_Text] = ImVec4(1.0f, 1.0f, 1.0f, 1.0f);
}

// --- رسم القائمة ---
void DrawMenu() {
    SetupStyle(); 

    ImGui::Begin("Ranim Cheats 🌸", &showMenu);

    if (!isVerified) {
        ImGui::Text("Bghiti tkhdem bih chri key 🔑");
        ImGui::InputText("Key", keyInput, 64);
        if (ImGui::Button("Activate")) {
            if (strcmp(keyInput, "Ranim") == 0) {
                isVerified = true;
            }
        }
        ImGui::End();
        return;
    }

    ImGui::Text("Welcome Ranim ✨");
    ImGui::Separator();

    if (ImGui::CollapsingHeader("AIMBOT")) {
        ImGui::Checkbox("Aimfov 360", &aimfov);
        if (aimfov) ImGui::TextColored(ImVec4(1, 0, 1, 1), "  [Active 🔥]");
        ImGui::Checkbox("Aims Silent", &aimsilent);
    }

    if (ImGui::CollapsingHeader("ESP")) {
        ImGui::Checkbox("Esp Box", &espbox);
        ImGui::Checkbox("Esp Lines", &esplines);
    }
    
    ImGui::Separator();
    ImGui::Text("Protected by Ranim 🛡️");
    ImGui::End();
}
