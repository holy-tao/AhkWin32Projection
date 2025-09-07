#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * The CANDIDATELIST structure (immdev.h) contains information about a candidate list.
 * @remarks
 * The candidate strings immediately follow the last offset in the <b>dwOffset</b> array.
 * @see https://learn.microsoft.com/windows/win32/api/immdev/ns-immdev-candidatelist
 * @namespace Windows.Win32.UI.Input.Ime
 * @version v4.0.30319
 */
class CANDIDATELIST extends Win32Struct
{
    static sizeof => 28

    static packingSize => 4

    /**
     * Size, in bytes, of the structure, the offset array, and all candidate strings.
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * 
     * @type {Integer}
     */
    dwStyle {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Number of candidate strings.
     * @type {Integer}
     */
    dwCount {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Index of the selected candidate string.
     * @type {Integer}
     */
    dwSelection {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Index of the first candidate string in the candidate window. This varies as the user presses the PAGE UP and PAGE DOWN keys.
     * @type {Integer}
     */
    dwPageStart {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Number of candidate strings to be shown in one page in the candidate window. The user can move to the next page by pressing IME-defined keys, such as the PAGE UP or PAGE DOWN key. If this number is 0, an application can define a proper value by itself.
     * @type {Integer}
     */
    dwPageSize {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Offset to the start of the first candidate string, relative to the start of this structure. The offsets for subsequent strings immediately follow this member, forming an array of 32-bit offsets.
     * @type {Array<UInt32>}
     */
    dwOffset{
        get {
            if(!this.HasProp("__dwOffsetProxyArray"))
                this.__dwOffsetProxyArray := Win32FixedArray(this.ptr + 24, 4, Primitive, "uint")
            return this.__dwOffsetProxyArray
        }
    }
}
