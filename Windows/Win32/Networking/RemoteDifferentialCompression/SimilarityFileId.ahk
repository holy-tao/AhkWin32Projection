#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains the similarity file ID for a file.
 * @see https://docs.microsoft.com/windows/win32/api//msrdc/ns-msrdc-similarityfileid
 * @namespace Windows.Win32.Networking.RemoteDifferentialCompression
 * @version v4.0.30319
 */
class SimilarityFileId extends Win32Struct
{
    static sizeof => 32

    static packingSize => 1

    /**
     * The similarity file ID for the file.
     * @type {Array<Byte>}
     */
    m_FileId{
        get {
            if(!this.HasProp("__m_FileIdProxyArray"))
                this.__m_FileIdProxyArray := Win32FixedArray(this.ptr + 0, 32, Primitive, "char")
            return this.__m_FileIdProxyArray
        }
    }
}
