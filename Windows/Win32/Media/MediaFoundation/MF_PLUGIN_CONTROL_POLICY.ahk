#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines policy settings for the IMFPluginControl2::SetPolicy method.
 * @see https://learn.microsoft.com/windows/win32/api/mfobjects/ne-mfobjects-mf_plugin_control_policy
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MF_PLUGIN_CONTROL_POLICY extends Win32Enum{

    /**
     * Enumerate all registered sources and transforms.
     * @type {Integer (Int32)}
     */
    static MF_PLUGIN_CONTROL_POLICY_USE_ALL_PLUGINS => 0

    /**
     * Enumerate only approved sources and transforms. Third-party components are excluded unless the component is registered with a valid merit value, or the component was registered locally by the application.
     * @type {Integer (Int32)}
     */
    static MF_PLUGIN_CONTROL_POLICY_USE_APPROVED_PLUGINS => 1

    /**
     * Restrict enumeration to components intended for use in a web browser.
     * @type {Integer (Int32)}
     */
    static MF_PLUGIN_CONTROL_POLICY_USE_WEB_PLUGINS => 2

    /**
     * 
     * @type {Integer (Int32)}
     */
    static MF_PLUGIN_CONTROL_POLICY_USE_WEB_PLUGINS_EDGEMODE => 3
}
