#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Returns information about the credential used for the security context.
 * @see https://learn.microsoft.com/windows/win32/api/sspi/ns-sspi-secpkgcontext_targetinformation
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SecPkgContext_TargetInformation {
    #StructPack 8

    /**
     * Size, in bytes, of <b>MarshalledTargetInfo</b>.
     */
    MarshalledTargetInfoLength : UInt32

    /**
     * Array of bytes that represent the credential, if a credential is provided by a credential manager.
     */
    MarshalledTargetInfo : IntPtr

}
