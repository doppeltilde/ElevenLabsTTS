#include "include/elevenlabs/elevenlabs_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "elevenlabs_plugin.h"

void ElevenlabsPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  elevenlabs::ElevenlabsPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
