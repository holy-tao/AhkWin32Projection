#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\LUID.ahk
#Include ..\..\..\Foundation\HANDLE.ahk
#Include .\SECPKG_BYTE_VECTOR.ahk

/**
 * Specifies the credentials.
 * @see https://docs.microsoft.com/windows/win32/api//ntsecpkg/ns-ntsecpkg-secpkg_credential
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class SECPKG_CREDENTIAL extends Win32Struct
{
    static sizeof => 88

    static packingSize => 8

    /**
     * The version.
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The length of the header.
     * @type {Integer}
     */
    cbHeaderLength {
        get => NumGet(this, 8, "ushort")
        set => NumPut("ushort", value, this, 8)
    }

    /**
     * The length of the structure, including the header, so that all of the content is in a contiguous buffer.
     * @type {Integer}
     */
    cbStructureLength {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * The identity of the client process.
     * @type {Integer}
     */
    ClientProcess {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The identity of the client thread.
     * @type {Integer}
     */
    ClientThread {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * The logon identity of the caller.
     * @type {LUID}
     */
    LogonId{
        get {
            if(!this.HasProp("__LogonId"))
                this.__LogonId := LUID(24, this)
            return this.__LogonId
        }
    }

    /**
     * The client token of the caller.
     * @type {HANDLE}
     */
    ClientToken{
        get {
            if(!this.HasProp("__ClientToken"))
                this.__ClientToken := HANDLE(32, this)
            return this.__ClientToken
        }
    }

    /**
     * The session identity of the caller.
     * @type {Integer}
     */
    SessionId {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * The modified identity of the caller.
     * @type {LUID}
     */
    ModifiedId{
        get {
            if(!this.HasProp("__ModifiedId"))
                this.__ModifiedId := LUID(48, this)
            return this.__ModifiedId
        }
    }

    /**
     * The credentials that are passed in or returned.
     * @type {Integer}
     */
    fCredentials {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * The credential flags.
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 60, "uint")
        set => NumPut("uint", value, this, 60)
    }

    /**
     * Not currently used.
     * @type {SECPKG_BYTE_VECTOR}
     */
    PrincipalName{
        get {
            if(!this.HasProp("__PrincipalName"))
                this.__PrincipalName := SECPKG_BYTE_VECTOR(64, this)
            return this.__PrincipalName
        }
    }

    /**
     * The list of packages. This member is only relevant to SPNego.
     * @type {SECPKG_BYTE_VECTOR}
     */
    PackageList{
        get {
            if(!this.HasProp("__PackageList"))
                this.__PackageList := SECPKG_BYTE_VECTOR(72, this)
            return this.__PackageList
        }
    }

    /**
     * The supplied credentials that are marshaled. This member contains a <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/ns-ntsecpkg-secpkg_supplied_credential">SECPKG_SUPPLIED_CREDENTIAL</a> 	structure.
     * @type {SECPKG_BYTE_VECTOR}
     */
    MarshaledSuppliedCreds{
        get {
            if(!this.HasProp("__MarshaledSuppliedCreds"))
                this.__MarshaledSuppliedCreds := SECPKG_BYTE_VECTOR(80, this)
            return this.__MarshaledSuppliedCreds
        }
    }
}
