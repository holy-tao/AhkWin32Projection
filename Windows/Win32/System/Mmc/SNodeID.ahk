#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The SNodeID structure is introduced in MMC 1.1, and is replaced by the SNodeID2 structure in MMC 1.2.
 * @remarks
 * 
  * Your snap-in should support the <b>CCF_NODEID</b> clipboard format in its <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-idataobject-getdata">IDataObject::GetData</a> method if any of its enumerated items has a volatile display name (such as the current computer name) or if any enumerated items should not be restored when the console file is reopened.
  * 
  * For details on using the 
  * <b>SNodeID</b> structure and <b>CCF_NODEID</b> clipboard format, see 
  * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mmc/ccf-nodeid">CCF_NODEID</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//mmc/ns-mmc-snodeid
 * @namespace Windows.Win32.System.Mmc
 * @version v4.0.30319
 */
class SNodeID extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * The count of bytes in the <b>id</b> array.
     * 
     * The snap-in can also specify that a scope item should not be re-expanded when the console is reopened. To do this, set the <b>cBytes</b> member to 0 (zero) and return <b>S_OK</b> in the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-idataobject-getdata">IDataObject::GetData</a> method. Be aware that this setting not only keeps the selected item from being persisted but also prevents its parent item from automatically expanding when the console file is reopened.
     * @type {Integer}
     */
    cBytes {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The bytes that contains the node ID of the scope item.
     * @type {Array<Byte>}
     */
    id{
        get {
            if(!this.HasProp("__idProxyArray"))
                this.__idProxyArray := Win32FixedArray(this.ptr + 4, 1, Primitive, "char")
            return this.__idProxyArray
        }
    }
}
