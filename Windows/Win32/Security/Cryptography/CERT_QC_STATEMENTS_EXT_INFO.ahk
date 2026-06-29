#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CERT_QC_STATEMENT.ahk" { CERT_QC_STATEMENT }

/**
 * Contains a sequence of one or more statements that make up the Qualified Certificate (QC) statements extension for a QC.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cert_qc_statements_ext_info
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CERT_QC_STATEMENTS_EXT_INFO {
    #StructPack 8

    /**
     * A value that represents the size, in bytes, of the <b>rgStatement</b> array.
     */
    cStatement : UInt32

    /**
     * An array of <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_qc_statement">CERT_QC_STATEMENT</a> structures that contains the sequence of statements that make up the QC statements extension.
     */
    rgStatement : CERT_QC_STATEMENT.Ptr

}
