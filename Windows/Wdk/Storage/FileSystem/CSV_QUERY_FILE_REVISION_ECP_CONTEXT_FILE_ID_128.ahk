#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Win32\Storage\FileSystem\FILE_ID_128.ahk

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 * @version v4.0.30319
 */
class CSV_QUERY_FILE_REVISION_ECP_CONTEXT_FILE_ID_128 extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * @type {FILE_ID_128}
     */
    FileId{
        get {
            if(!this.HasProp("__FileId"))
                this.__FileId := FILE_ID_128(0, this)
            return this.__FileId
        }
    }

    /**
     * @type {Array<Int64>}
     */
    FileRevision{
        get {
            if(!this.HasProp("__FileRevisionProxyArray"))
                this.__FileRevisionProxyArray := Win32FixedArray(this.ptr + 16, 3, Primitive, "int64")
            return this.__FileRevisionProxyArray
        }
    }
}
