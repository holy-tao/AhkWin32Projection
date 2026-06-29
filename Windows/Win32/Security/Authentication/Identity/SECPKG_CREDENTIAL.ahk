#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\..\Foundation\LUID.ahk" { LUID }
#Import ".\SECPKG_BYTE_VECTOR.ahk" { SECPKG_BYTE_VECTOR }

/**
 * Specifies the credentials.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecpkg/ns-ntsecpkg-secpkg_credential
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SECPKG_CREDENTIAL {
    #StructPack 8

    /**
     * The version.
     */
    Version : Int64

    /**
     * The length of the header.
     */
    cbHeaderLength : UInt16

    /**
     * The length of the structure, including the header, so that all of the content is in a contiguous buffer.
     */
    cbStructureLength : UInt32

    /**
     * The identity of the client process.
     */
    ClientProcess : UInt32

    /**
     * The identity of the client thread.
     */
    ClientThread : UInt32

    /**
     * The logon identity of the caller.
     */
    LogonId : LUID

    /**
     * The client token of the caller.
     */
    ClientToken : HANDLE

    /**
     * The session identity of the caller.
     */
    SessionId : UInt32

    /**
     * The modified identity of the caller.
     */
    ModifiedId : LUID

    /**
     * The credentials that are passed in or returned.
     */
    fCredentials : UInt32

    /**
     * The credential flags.
     */
    Flags : UInt32

    /**
     * Not currently used.
     */
    PrincipalName : SECPKG_BYTE_VECTOR

    /**
     * The list of packages. This member is only relevant to SPNego.
     */
    PackageList : SECPKG_BYTE_VECTOR

    /**
     * The supplied credentials that are marshaled. This member contains a <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/ns-ntsecpkg-secpkg_supplied_credential">SECPKG_SUPPLIED_CREDENTIAL</a> 	structure.
     */
    MarshaledSuppliedCreds : SECPKG_BYTE_VECTOR

}
