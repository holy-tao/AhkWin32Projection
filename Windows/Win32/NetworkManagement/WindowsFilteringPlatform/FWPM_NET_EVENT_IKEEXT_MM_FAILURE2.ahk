#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class FWPM_NET_EVENT_IKEEXT_MM_FAILURE2 extends Win32Struct
{
    static sizeof => 120

    static packingSize => 8

    /**
     * @type {Integer}
     */
    failureErrorCode {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    failurePoint {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    flags {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    keyingModuleType {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    mmState {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    saRole {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }

    /**
     * @type {Integer}
     */
    mmAuthMethod {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * @type {Array<Byte>}
     */
    endCertHash{
        get {
            if(!this.HasProp("__endCertHashProxyArray"))
                this.__endCertHashProxyArray := Win32FixedArray(this.ptr + 28, 20, Primitive, "char")
            return this.__endCertHashProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    mmId {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * @type {Integer}
     */
    mmFilterId {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * @type {PWSTR}
     */
    localPrincipalNameForAuth{
        get {
            if(!this.HasProp("__localPrincipalNameForAuth"))
                this.__localPrincipalNameForAuth := PWSTR(this.ptr + 64)
            return this.__localPrincipalNameForAuth
        }
    }

    /**
     * @type {PWSTR}
     */
    remotePrincipalNameForAuth{
        get {
            if(!this.HasProp("__remotePrincipalNameForAuth"))
                this.__remotePrincipalNameForAuth := PWSTR(this.ptr + 72)
            return this.__remotePrincipalNameForAuth
        }
    }

    /**
     * @type {Integer}
     */
    numLocalPrincipalGroupSids {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * @type {Pointer<PWSTR>}
     */
    localPrincipalGroupSids {
        get => NumGet(this, 88, "ptr")
        set => NumPut("ptr", value, this, 88)
    }

    /**
     * @type {Integer}
     */
    numRemotePrincipalGroupSids {
        get => NumGet(this, 96, "uint")
        set => NumPut("uint", value, this, 96)
    }

    /**
     * @type {Pointer<PWSTR>}
     */
    remotePrincipalGroupSids {
        get => NumGet(this, 104, "ptr")
        set => NumPut("ptr", value, this, 104)
    }

    /**
     * @type {Pointer<Guid>}
     */
    providerContextKey {
        get => NumGet(this, 112, "ptr")
        set => NumPut("ptr", value, this, 112)
    }
}
