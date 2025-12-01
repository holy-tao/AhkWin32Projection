#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains a sequence of one or more statements that make up the Qualified Certificate (QC) statements extension for a QC.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cert_qc_statements_ext_info
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CERT_QC_STATEMENTS_EXT_INFO extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * A value that represents the size, in bytes, of the <b>rgStatement</b> array.
     * @type {Integer}
     */
    cStatement {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * An array of <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_qc_statement">CERT_QC_STATEMENT</a> structures that contains the sequence of statements that make up the QC statements extension.
     * @type {Pointer<CERT_QC_STATEMENT>}
     */
    rgStatement {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
