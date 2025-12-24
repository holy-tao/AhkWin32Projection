#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Security\Authentication\Identity\SecPkgContext_ConnectionInfo.ahk
#Include ..\..\Security\Authentication\Identity\SecPkgContext_CipherInfo.ahk
#Include ..\..\Security\Authentication\Identity\SecPkgContext_Bindings.ahk

/**
 * @namespace Windows.Win32.Networking.WinInet
 * @version v4.0.30319
 */
class INTERNET_SECURITY_INFO extends Win32Struct
{
    static sizeof => 760

    static packingSize => 8

    /**
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Pointer<CERT_CONTEXT>}
     */
    pCertificate {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<CERT_CHAIN_CONTEXT>}
     */
    pcCertChain {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {SecPkgContext_ConnectionInfo}
     */
    connectionInfo{
        get {
            if(!this.HasProp("__connectionInfo"))
                this.__connectionInfo := SecPkgContext_ConnectionInfo(24, this)
            return this.__connectionInfo
        }
    }

    /**
     * @type {SecPkgContext_CipherInfo}
     */
    cipherInfo{
        get {
            if(!this.HasProp("__cipherInfo"))
                this.__cipherInfo := SecPkgContext_CipherInfo(52, this)
            return this.__cipherInfo
        }
    }

    /**
     * @type {Pointer<CERT_CHAIN_CONTEXT>}
     */
    pcUnverifiedCertChain {
        get => NumGet(this, 736, "ptr")
        set => NumPut("ptr", value, this, 736)
    }

    /**
     * @type {SecPkgContext_Bindings}
     */
    channelBindingToken{
        get {
            if(!this.HasProp("__channelBindingToken"))
                this.__channelBindingToken := SecPkgContext_Bindings(744, this)
            return this.__channelBindingToken
        }
    }
}
