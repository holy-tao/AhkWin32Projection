#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Contains key data used by the EAP TLS Authentication Protocol.
 * @see https://docs.microsoft.com/windows/win32/api//schannel/ns-schannel-secpkgcontext_eapkeyblock
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class SecPkgContext_EapKeyBlock extends Win32Struct
{
    static sizeof => 192

    static packingSize => 1

    /**
     * An array of 128 bytes that contain key data used by the EAP TLS Authentication Protocol.
     * @type {Array<Byte>}
     */
    rgbKeys{
        get {
            if(!this.HasProp("__rgbKeysProxyArray"))
                this.__rgbKeysProxyArray := Win32FixedArray(this.ptr + 0, 128, Primitive, "char")
            return this.__rgbKeysProxyArray
        }
    }

    /**
     * An array of 64 bytes that contain initialization vector data used by the EAP TLS Authentication Protocol.
     * @type {Array<Byte>}
     */
    rgbIVs{
        get {
            if(!this.HasProp("__rgbIVsProxyArray"))
                this.__rgbIVsProxyArray := Win32FixedArray(this.ptr + 128, 64, Primitive, "char")
            return this.__rgbIVsProxyArray
        }
    }
}
