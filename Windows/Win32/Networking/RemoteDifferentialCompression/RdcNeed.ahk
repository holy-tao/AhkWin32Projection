#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\RdcNeedType.ahk" { RdcNeedType }

/**
 * Contains information about a chunk that is required to synchronize two sets of data.
 * @see https://learn.microsoft.com/windows/win32/api/msrdc/ns-msrdc-rdcneed
 * @namespace Windows.Win32.Networking.RemoteDifferentialCompression
 */
export default struct RdcNeed {
    #StructPack 8

    /**
     * Describes the type of data needed—source data or seed data.
     */
    m_BlockType : RdcNeedType

    /**
     * Offset, in bytes, from the start of the data where the chunk should be copied from.
     */
    m_FileOffset : Int64

    /**
     * Length, in bytes, of the chunk of data that is to be copied to the target data.
     */
    m_BlockLength : Int64

}
