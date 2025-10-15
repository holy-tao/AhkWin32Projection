#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\LUID.ahk
#Include .\DISPLAYCONFIG_PATH_SOURCE_INFO.ahk
#Include .\DISPLAYCONFIG_RATIONAL.ahk
#Include ..\..\Foundation\BOOL.ahk
#Include .\DISPLAYCONFIG_PATH_TARGET_INFO.ahk

/**
 * The DISPLAYCONFIG_PATH_INFO structure is used to describe a single path from a target to a source.
 * @see https://docs.microsoft.com/windows/win32/api//wingdi/ns-wingdi-displayconfig_path_info
 * @namespace Windows.Win32.Devices.Display
 * @version v4.0.30319
 */
class DISPLAYCONFIG_PATH_INFO extends Win32Struct
{
    static sizeof => 88

    static packingSize => 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-displayconfig_path_source_info">DISPLAYCONFIG_PATH_SOURCE_INFO</a> structure that contains the source information for the path.
     * @type {DISPLAYCONFIG_PATH_SOURCE_INFO}
     */
    sourceInfo{
        get {
            if(!this.HasProp("__sourceInfo"))
                this.__sourceInfo := DISPLAYCONFIG_PATH_SOURCE_INFO(this.ptr + 0)
            return this.__sourceInfo
        }
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-displayconfig_path_target_info">DISPLAYCONFIG_PATH_TARGET_INFO</a> structure that contains the target information for the path.
     * @type {DISPLAYCONFIG_PATH_TARGET_INFO}
     */
    targetInfo{
        get {
            if(!this.HasProp("__targetInfo"))
                this.__targetInfo := DISPLAYCONFIG_PATH_TARGET_INFO(this.ptr + 24)
            return this.__targetInfo
        }
    }

    /**
     * A bitwise OR of flag values that indicates the state of the path. The following values are supported:
     * @type {Integer}
     */
    flags {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }
}
