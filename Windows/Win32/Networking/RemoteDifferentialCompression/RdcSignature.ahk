#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains a single signature and the length of the chunk used to generate it.
 * @see https://learn.microsoft.com/windows/win32/api/msrdc/ns-msrdc-rdcsignature
 * @namespace Windows.Win32.Networking.RemoteDifferentialCompression
 */
export default struct RdcSignature {
    #StructPack 2

    /**
     * Signature of a chunk of data.
     */
    m_Signature : Int8[16]

    /**
     * Length of the chunk represented by this signature.
     */
    m_BlockLength : UInt16

}
