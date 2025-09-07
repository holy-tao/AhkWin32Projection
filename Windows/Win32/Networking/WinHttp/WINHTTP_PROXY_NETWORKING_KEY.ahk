#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Networking.WinHttp
 * @version v4.0.30319
 */
class WINHTTP_PROXY_NETWORKING_KEY extends Win32Struct
{
    static sizeof => 128

    static packingSize => 1

    /**
     * @type {Array<Byte>}
     */
    pbBuffer{
        get {
            if(!this.HasProp("__pbBufferProxyArray"))
                this.__pbBufferProxyArray := Win32FixedArray(this.ptr + 0, 1, Primitive, "char")
            return this.__pbBufferProxyArray
        }
    }
}
