#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\LINEFORWARD.ahk

/**
 * The LINEFORWARDLIST structure describes a list of forwarding instructions. This structure can contain an array of LINEFORWARD structures. The lineForward and TSPI_lineForward functions use the LINEFORWARDLIST structure.
 * @remarks
 * 
  * This structure may not be extended.
  * 
  * The 
  * <b>LINEFORWARDLIST</b> structure defines the forwarding parameters requested for forwarding calls on an address or on all addresses on a line.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//tapi/ns-tapi-lineforwardlist
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class LINEFORWARDLIST extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Total size of the data structure, in bytes.
     * @type {Integer}
     */
    dwTotalSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Number of entries in the array specified as <b>ForwardList[]</b>.
     * @type {Integer}
     */
    dwNumEntries {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Array of forwarding instruction. The array's entries are of type 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-lineforward">LINEFORWARD</a>.
     * @type {Array<LINEFORWARD>}
     */
    ForwardList{
        get {
            if(!this.HasProp("__ForwardListProxyArray"))
                this.__ForwardListProxyArray := Win32FixedArray(this.ptr + 8, 1, LINEFORWARD, "")
            return this.__ForwardListProxyArray
        }
    }
}
