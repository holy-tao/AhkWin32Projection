#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Contains trust information.
 * @see https://learn.microsoft.com/windows/win32/api/capi/ns-capi-java_trust
 * @namespace Windows.Win32.System.WindowsProgramming
 */
export default struct JAVA_TRUST {
    #StructPack 8

    /**
     * The size of this structure, in bytes.
     */
    cbSize : UInt32 := this.Size

    /**
     * Reserved.
     */
    flag : UInt32

    /**
     * Indicates whether all ActiveX permissions were requested.
     */
    fAllActiveXPermissions : BOOL

    /**
     * Indicates whether all Java permissions were requested.
     */
    fAllPermissions : BOOL

    /**
     * The encoding type. This member can be <b>X509_ASN_ENCODING</b> or <b>PKCS_7_ASN_ENCODING</b>.
     */
    dwEncodingType : UInt32

    /**
     * The encoded permission blob.
     */
    pbJavaPermissions : IntPtr

    /**
     * The size of the <b>pbJavaPermissions</b> buffer, in bytes.
     */
    cbJavaPermissions : UInt32

    /**
     * The encoded signer.
     */
    pbSigner : IntPtr

    /**
     * The size of the <b>pbSigner</b> buffer, in bytes.
     */
    cbSigner : UInt32

    /**
     * The zone index.
     */
    pwszZone : PWSTR

    /**
     * Reserved.
     */
    guidZone : Guid

    /**
     * The authenticode policy return code.
     */
    hVerify : HRESULT

}
