#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The **NAMED_PROFILE_INFO** structure is used to store information about a named color profile.
 * @remarks
 * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//icm/ns-icm-named_profile_info
 * @namespace Windows.Win32.UI.ColorSystem
 * @version v4.0.30319
 */
class NAMED_PROFILE_INFO extends Win32Struct
{
    static sizeof => 76

    static packingSize => 4

    /**
     * Not currently used by the default CMM.
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Total number of named colors in the profile.
     * @type {Integer}
     */
    dwCount {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Total number of device coordinates for each named color.
     * @type {Integer}
     */
    dwCountDevCoordinates {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Pointer to a string containing the prefix for each color name.
     * @type {Array<SByte>}
     */
    szPrefix{
        get {
            if(!this.HasProp("__szPrefixProxyArray"))
                this.__szPrefixProxyArray := Win32FixedArray(this.ptr + 12, 32, Primitive, "char")
            return this.__szPrefixProxyArray
        }
    }

    /**
     * Pointer to a string containing the suffix for each color name.
     * @type {Array<SByte>}
     */
    szSuffix{
        get {
            if(!this.HasProp("__szSuffixProxyArray"))
                this.__szSuffixProxyArray := Win32FixedArray(this.ptr + 44, 32, Primitive, "char")
            return this.__szSuffixProxyArray
        }
    }
}
