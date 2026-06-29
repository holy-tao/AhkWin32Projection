#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Win32\Foundation\BOOLEAN.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class WHEA_PSHED_PLUGIN_PLATFORM_SUPPORT_EVENT extends Win32Struct {
    static sizeof => 80

    static packingSize => 8

    /**
     * @type {Pointer}
     */
    WheaEventLogEntry {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {String}
     */
    PluginName {
        get => StrGet(this.ptr + 8, 31, "UTF-16")
        set => StrPut(value, this.ptr + 8, 31, "UTF-16")
    }

    /**
     * @type {BOOLEAN}
     */
    Supported {
        get => NumGet(this, 72, "char")
        set => NumPut("char", value, this, 72)
    }
}
