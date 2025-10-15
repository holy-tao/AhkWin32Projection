#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOL.ahk
#Include ..\..\Security\Authentication\Identity\SecPkgContext_ConnectionInfo.ahk
#Include ..\..\Security\Authentication\Identity\SecPkgContext_CipherInfo.ahk

/**
 * @namespace Windows.Win32.Networking.WinInet
 * @version v4.0.30319
 */
class INTERNET_SECURITY_CONNECTION_INFO extends Win32Struct
{
    static sizeof => 720

    static packingSize => 8

    /**
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {BOOL}
     */
    fSecure{
        get {
            if(!this.HasProp("__fSecure"))
                this.__fSecure := BOOL(this.ptr + 4)
            return this.__fSecure
        }
    }

    /**
     * @type {SecPkgContext_ConnectionInfo}
     */
    connectionInfo{
        get {
            if(!this.HasProp("__connectionInfo"))
                this.__connectionInfo := SecPkgContext_ConnectionInfo(this.ptr + 8)
            return this.__connectionInfo
        }
    }

    /**
     * @type {SecPkgContext_CipherInfo}
     */
    cipherInfo{
        get {
            if(!this.HasProp("__cipherInfo"))
                this.__cipherInfo := SecPkgContext_CipherInfo(this.ptr + 40)
            return this.__cipherInfo
        }
    }
}
