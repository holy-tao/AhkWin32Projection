#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct WHEA_PSHED_PLUGIN_UNLOAD_EVENT {
    #StructPack 8

    WheaEventLogEntry : IntPtr

    PluginName : WCHAR[32]

}
