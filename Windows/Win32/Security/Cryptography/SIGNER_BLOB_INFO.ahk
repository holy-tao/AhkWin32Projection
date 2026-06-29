#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Specifies a BLOB to sign.
 * @see https://learn.microsoft.com/windows/win32/SecCrypto/signer-blob-info
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct SIGNER_BLOB_INFO {
    #StructPack 8

    /**
     * The size, in bytes, of the structure.
     */
    cbSize : UInt32 := this.Size

    /**
     * A pointer to a **GUID** that specifies the Subject Interface Package (SIP) to load.
     */
    pGuidSubject : Guid.Ptr

    /**
     * The size, in bytes, of the BLOB to sign.
     */
    cbBlob : UInt32

    /**
     * A pointer to the BLOB to sign.
     */
    pbBlob : IntPtr

    /**
     * The display name of the BLOB. This member can be set to **NULL**.
     */
    pwszDisplayName : PWSTR

}
