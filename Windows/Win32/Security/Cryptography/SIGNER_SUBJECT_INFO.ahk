#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SIGNER_SUBJECT_CHOICE.ahk" { SIGNER_SUBJECT_CHOICE }
#Import ".\SIGNER_FILE_INFO.ahk" { SIGNER_FILE_INFO }
#Import ".\SIGNER_BLOB_INFO.ahk" { SIGNER_BLOB_INFO }

/**
 * Specifies a subject to sign.
 * @see https://learn.microsoft.com/windows/win32/SecCrypto/signer-subject-info
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct SIGNER_SUBJECT_INFO {
    #StructPack 8

    /**
     * The size, in bytes, of the structure.
     */
    cbSize : UInt32 := this.Size

    /**
     * This member is reserved. It must be set to zero.
     */
    pdwIndex : IntPtr

    /**
     * Specifies whether the subject is a file or a [*BLOB*](../secgloss/b-gly.md). This member can be one or more of the following values.
     * 
     * 
     * 
     * | Value                                                                                                                                                                                                                                         | Meaning                           |
     * |-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-----------------------------------|
     * | <span id="SIGNER_SUBJECT_BLOB"></span><span id="signer_subject_blob"></span><dl> <dt>**SIGNER\_SUBJECT\_BLOB**</dt> <dt>2 (0x2)</dt> </dl> | The subject is a BLOB.<br/> |
     * | <span id="SIGNER_SUBJECT_FILE"></span><span id="signer_subject_file"></span><dl> <dt>**SIGNER\_SUBJECT\_FILE**</dt> <dt>1 (0x1)</dt> </dl> | The subject is a file.<br/> |
     */
    dwSubjectChoice : SIGNER_SUBJECT_CHOICE

    pSignerFileInfo : SIGNER_FILE_INFO.Ptr

    static __New() {
        DefineProp(this.Prototype, 'pSignerBlobInfo', { type: SIGNER_BLOB_INFO.Ptr, offset: 24 })
        this.DeleteProp("__New")
    }
}
