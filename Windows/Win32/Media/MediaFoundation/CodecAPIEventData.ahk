#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * The CodecAPIEventData structure (strmif.h) contains event data for the EC_CODECAPI_EVENT event. This event is sent by codecs that support the ICodecAPI interface.
 * @remarks
 * This structure may be followed by addition data, depending on the codec event. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-icodecapi-registerforevent">ICodecAPI::RegisterForEvent</a>.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/ns-strmif-codecapieventdata
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class CodecAPIEventData extends Win32Struct {
    static sizeof => 32

    static packingSize => 4

    /**
     * A GUID that identifies the codec event.
     * @type {Guid}
     */
    guid {
        get {
            if(!this.HasProp("__guid"))
                this.__guid := Guid(0, this)
            return this.__guid
        }
    }

    /**
     * The length of the additional data that follows this structure, in bytes.
     *           The value can be zero.
     * @type {Integer}
     */
    dataLength {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Reserved; do not use.
     * @type {Array<Integer>}
     */
    reserved {
        get {
            if(!this.HasProp("__reservedProxyArray"))
                this.__reservedProxyArray := Win32FixedArray(this.ptr + 20, 3, Primitive, "uint")
            return this.__reservedProxyArray
        }
    }
}
