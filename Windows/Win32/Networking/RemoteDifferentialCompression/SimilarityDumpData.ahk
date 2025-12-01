#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\SimilarityData.ahk

/**
 * Contains the similarity information that was returned for a file by the ISimilarityTableDumpState::GetNextData method.
 * @see https://learn.microsoft.com/windows/win32/api/msrdc/ns-msrdc-similaritydumpdata
 * @namespace Windows.Win32.Networking.RemoteDifferentialCompression
 * @version v4.0.30319
 */
class SimilarityDumpData extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * The index of the <a href="https://docs.microsoft.com/windows/win32/api/msrdc/ns-msrdc-similaritydata">SimilarityData</a> structure in the similarity traits table.
     * @type {Integer}
     */
    m_FileIndex {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/win32/api/msrdc/ns-msrdc-similaritydata">SimilarityData</a> structure that contains the similarity data for the file.
     * @type {SimilarityData}
     */
    m_Data{
        get {
            if(!this.HasProp("__m_Data"))
                this.__m_Data := SimilarityData(8, this)
            return this.__m_Data
        }
    }
}
