#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains a Message Authentication Code (MAC) for an Output Protection Manager (OPM) message.
 * @see https://docs.microsoft.com/windows/win32/api//opmapi/ns-opmapi-opm_omac
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class OPM_OMAC extends Win32Struct
{
    static sizeof => 16

    static packingSize => 1

    /**
     * A buffer that contains the cryptographic MAC value of the message.
     * @type {Array<Byte>}
     */
    abOMAC{
        get {
            if(!this.HasProp("__abOMACProxyArray"))
                this.__abOMACProxyArray := Win32FixedArray(this.ptr + 0, 16, Primitive, "char")
            return this.__abOMACProxyArray
        }
    }
}
