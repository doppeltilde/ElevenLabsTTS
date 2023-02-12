#ifndef FLUTTER_PLUGIN_ELEVENLABS_PLUGIN_H_
#define FLUTTER_PLUGIN_ELEVENLABS_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace elevenlabs {

class ElevenlabsPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  ElevenlabsPlugin();

  virtual ~ElevenlabsPlugin();

  // Disallow copy and assign.
  ElevenlabsPlugin(const ElevenlabsPlugin&) = delete;
  ElevenlabsPlugin& operator=(const ElevenlabsPlugin&) = delete;

  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace elevenlabs

#endif  // FLUTTER_PLUGIN_ELEVENLABS_PLUGIN_H_
