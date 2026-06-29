#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\RdcSignature.ahk" { RdcSignature }

/**
 * Describes an array of RdcSignature structures.
 * @see https://learn.microsoft.com/windows/win32/api/msrdc/ns-msrdc-rdcsignaturepointer
 * @namespace Windows.Win32.Networking.RemoteDifferentialCompression
 */
export default struct RdcSignaturePointer {
    #StructPack 8

    /**
     * Contains the number of <a href="https://docs.microsoft.com/windows/win32/api/msrdc/ns-msrdc-rdcsignature">RdcSignature</a> structures in 
     *       array pointed to by <b>m_Data</b>.
     */
    m_Size : UInt32

    /**
     * When the structure is passed to the 
     *       <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msrdc/nf-msrdc-irdcsignaturereader-readsignatures">IRdcSignatureReader::ReadSignatures</a> 
     *       method, this member should be zero. On return this member will contain the number of 
     *       <a href="https://docs.microsoft.com/windows/win32/api/msrdc/ns-msrdc-rdcsignature">RdcSignature</a> structures that were filled.
     */
    m_Used : UInt32

    /**
     * Address of an array of <a href="https://docs.microsoft.com/windows/win32/api/msrdc/ns-msrdc-rdcsignature">RdcSignature</a> structures.
     */
    m_Data : RdcSignature.Ptr

}
