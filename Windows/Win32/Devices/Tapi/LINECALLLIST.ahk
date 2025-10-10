#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The LINECALLLIST structure describes a list of call handles. A structure of this type is returned by the lineGetNewCalls and lineGetConfRelatedCalls functions.
 * @remarks
 * 
  * This structure may not be extended.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//tapi/ns-tapi-linecalllist
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class LINECALLLIST extends Win32Struct
{
    static sizeof => 24

    static packingSize => 4

    /**
     * Total size allocated to this data structure, in bytes.
     * @type {Integer}
     */
    dwTotalSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Size for this data structure that is needed to hold all the returned information, in bytes.
     * @type {Integer}
     */
    dwNeededSize {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Size of the portion of this data structure that contains useful information, in bytes.
     * @type {Integer}
     */
    dwUsedSize {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Number of handles in the <i>hCalls</i> array.
     * @type {Integer}
     */
    dwCallsNumEntries {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Size of the array of call handles, in bytes.
     * @type {Integer}
     */
    dwCallsSize {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Offset from the beginning of the structure to the variably sized array of <b>HCALL</b> handles. The size of the array is specified by <b>dwCallsSize</b>.
     * @type {Integer}
     */
    dwCallsOffset {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }
}
