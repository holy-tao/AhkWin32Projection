#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
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
    fSecure {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * @type {SecPkgContext_ConnectionInfo}
     */
    connectionInfo{
        get {
            if(!this.HasProp("__connectionInfo"))
                this.__connectionInfo := SecPkgContext_ConnectionInfo(8, this)
            return this.__connectionInfo
        }
    }

    /**
     * @type {SecPkgContext_CipherInfo}
     */
    cipherInfo{
        get {
            if(!this.HasProp("__cipherInfo"))
                this.__cipherInfo := SecPkgContext_CipherInfo(40, this)
            return this.__cipherInfo
        }
    }
}
