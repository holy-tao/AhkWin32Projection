#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The WAVEFILTER structure defines a filter for waveform-audio data.
 * @see https://docs.microsoft.com/windows/win32/api//mmreg/ns-mmreg-wavefilter
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class WAVEFILTER extends Win32Struct
{
    static sizeof => 32

    static packingSize => 4

    /**
     * Size, in bytes, of the <b>WAVEFILTER</b> structure. The size specified in this member must be large enough to contain the base <b>WAVEFILTER</b> structure.
     * @type {Integer}
     */
    cbStruct {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Waveform-audio filter type. Filter tags are registered with Microsoft Corporation for various filter algorithms.
     * @type {Integer}
     */
    dwFilterTag {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Flags for the <b>dwFilterTag</b> member. The flags defined for this member are universal to all filters. Currently, no flags are defined.
     * @type {Integer}
     */
    fdwFilter {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Reserved for system use; should not be examined or modified by an application.
     * @type {Array<UInt32>}
     */
    dwReserved{
        get {
            if(!this.HasProp("__dwReservedProxyArray"))
                this.__dwReservedProxyArray := Win32FixedArray(this.ptr + 12, 5, Primitive, "uint")
            return this.__dwReservedProxyArray
        }
    }
}
