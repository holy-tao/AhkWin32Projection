#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Networking.HttpServer
 * @version v4.0.30319
 */
class HTTP_CERT_CONFIG_ENTRY extends Win32Struct
{
    static sizeof => 276

    static packingSize => 2

    /**
     * @type {Array<Byte>}
     */
    CertHash{
        get {
            if(!this.HasProp("__CertHashProxyArray"))
                this.__CertHashProxyArray := Win32FixedArray(this.ptr + 0, 20, Primitive, "char")
            return this.__CertHashProxyArray
        }
    }

    /**
     * @type {String}
     */
    CertStoreName {
        get => StrGet(this.ptr + 20, 127, "UTF-16")
        set => StrPut(value, this.ptr + 20, 127, "UTF-16")
    }
}
