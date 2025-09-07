#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies a subject to sign.
 * @see https://learn.microsoft.com/windows/win32/SecCrypto/signer-subject-info
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class SIGNER_SUBJECT_INFO extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * The size, in bytes, of the structure.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * This member is reserved. It must be set to zero.
     * @type {Pointer<UInt32>}
     */
    pdwIndex {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Specifies whether the subject is a file or a [*BLOB*](../secgloss/b-gly.md). This member can be one or more of the following values.
     * 
     * 
     * 
     * | Value                                                                                                                                                                                                                                         | Meaning                           |
     * |-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-----------------------------------|
     * | <span id="SIGNER_SUBJECT_BLOB"></span><span id="signer_subject_blob"></span><dl> <dt>**SIGNER\_SUBJECT\_BLOB**</dt> <dt>2 (0x2)</dt> </dl> | The subject is a BLOB.<br/> |
     * | <span id="SIGNER_SUBJECT_FILE"></span><span id="signer_subject_file"></span><dl> <dt>**SIGNER\_SUBJECT\_FILE**</dt> <dt>1 (0x1)</dt> </dl> | The subject is a file.<br/> |
     * @type {Integer}
     */
    dwSubjectChoice {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Pointer<SIGNER_FILE_INFO>}
     */
    pSignerFileInfo {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Pointer<SIGNER_BLOB_INFO>}
     */
    pSignerBlobInfo {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Initializes the struct. `cbSize` must always contain the size of the struct.
     * @param {Integer} ptr The location at which to create the struct, or 0 to create a new `Buffer`
     */
    __New(ptr := 0){
        super.__New(ptr)
        this.cbSize := 32
    }
}
