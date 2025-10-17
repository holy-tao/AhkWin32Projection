#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HANDLE.ahk

/**
 * @namespace Windows.Win32.Networking.WinHttp
 * @version v4.0.30319
 */
class WINHTTP_PROXY_RESULT_EX extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {Integer}
     */
    cEntries {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Pointer<WINHTTP_PROXY_RESULT_ENTRY>}
     */
    pEntries {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {HANDLE}
     */
    hProxyDetectionHandle{
        get {
            if(!this.HasProp("__hProxyDetectionHandle"))
                this.__hProxyDetectionHandle := HANDLE(16, this)
            return this.__hProxyDetectionHandle
        }
    }

    /**
     * @type {Integer}
     */
    dwProxyInterfaceAffinity {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }
}
