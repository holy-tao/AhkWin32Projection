#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The SNodeID2 structure is introduced in MMC 1.2, and replaces the SNodeID structure.
 * @remarks
 * 
  * For details on using the 
  * <b>SNodeID2</b> structure with the CCF_NODEID2 clipboard format, see 
  * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mmc/ccf-nodeid2">CCF_NODEID2</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//mmc/ns-mmc-snodeid2
 * @namespace Windows.Win32.System.Mmc
 * @version v4.0.30319
 */
class SNodeID2 extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * Currently, only the MMC_NODEID_SLOW_RETRIEVAL flag is defined for <b>dwFlags</b>. If this flag is set, MMC will not persist the specified scope item except where absolutely necessary, as for example for console taskpads. Console taskpads always persist the target items and task target items.
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The count of bytes in the <b>id</b> array.
     * @type {Integer}
     */
    cBytes {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The bytes that contains the node ID of the scope item.
     * @type {Array<Byte>}
     */
    id{
        get {
            if(!this.HasProp("__idProxyArray"))
                this.__idProxyArray := Win32FixedArray(this.ptr + 8, 1, Primitive, "char")
            return this.__idProxyArray
        }
    }
}
