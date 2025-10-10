#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains the similarity data for a file.
 * @see https://docs.microsoft.com/windows/win32/api//msrdc/ns-msrdc-similaritydata
 * @namespace Windows.Win32.Networking.RemoteDifferentialCompression
 * @version v4.0.30319
 */
class SimilarityData extends Win32Struct
{
    static sizeof => 16

    static packingSize => 1

    /**
     * The similarity data for the file.
     * @type {Array<Byte>}
     */
    m_Data{
        get {
            if(!this.HasProp("__m_DataProxyArray"))
                this.__m_DataProxyArray := Win32FixedArray(this.ptr + 0, 16, Primitive, "char")
            return this.__m_DataProxyArray
        }
    }
}
