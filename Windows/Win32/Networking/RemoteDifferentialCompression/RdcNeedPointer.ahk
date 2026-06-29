#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\RdcNeed.ahk" { RdcNeed }

/**
 * Describes an array of RdcNeed structures.
 * @see https://learn.microsoft.com/windows/win32/api/msrdc/ns-msrdc-rdcneedpointer
 * @namespace Windows.Win32.Networking.RemoteDifferentialCompression
 */
export default struct RdcNeedPointer {
    #StructPack 8

    /**
     * Contains the number of <a href="https://docs.microsoft.com/windows/win32/api/msrdc/ns-msrdc-rdcneed">RdcNeed</a> structures in array pointed 
     *       to by <b>m_Data</b>.
     */
    m_Size : UInt32

    /**
     * When the structure is passed to the 
     *       <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msrdc/nf-msrdc-irdccomparator-process">IRdcComparator::Process</a> method, this member 
     *       should be zero. On return this member will contain the number of 
     *       <a href="https://docs.microsoft.com/windows/win32/api/msrdc/ns-msrdc-rdcneed">RdcNeed</a> structures that were filled with data.
     */
    m_Used : UInt32

    /**
     * Address of array of <a href="https://docs.microsoft.com/windows/win32/api/msrdc/ns-msrdc-rdcneed">RdcNeed</a> structures that describe the 
     *       chunks required from the source and seed data.
     */
    m_Data : RdcNeed.Ptr

}
