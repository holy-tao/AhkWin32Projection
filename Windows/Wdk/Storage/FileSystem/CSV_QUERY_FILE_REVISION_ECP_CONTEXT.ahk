#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 * @version v4.0.30319
 */
class CSV_QUERY_FILE_REVISION_ECP_CONTEXT extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {Integer}
     */
    FileId {
        get => NumGet(this, 0, "int64")
        set => NumPut("int64", value, this, 0)
    }

    /**
     * @type {Array<Int64>}
     */
    FileRevision{
        get {
            if(!this.HasProp("__FileRevisionProxyArray"))
                this.__FileRevisionProxyArray := Win32FixedArray(this.ptr + 8, 3, Primitive, "int64")
            return this.__FileRevisionProxyArray
        }
    }
}
