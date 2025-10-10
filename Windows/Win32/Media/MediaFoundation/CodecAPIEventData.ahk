#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The CodecAPIEventData structure contains event data for the EC_CODECAPI_EVENT event. This event is sent by codecs that support the ICodecAPI interface.
 * @remarks
 * 
  * This structure may be followed by addition data, depending on the codec event. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-icodecapi-registerforevent">ICodecAPI::RegisterForEvent</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//strmif/ns-strmif-codecapieventdata
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class CodecAPIEventData extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * A GUID that identifies the codec event.
     * @type {Pointer<Guid>}
     */
    guid {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The length of the additional data that follows this structure, in bytes.
     *           The value can be zero.
     * @type {Integer}
     */
    dataLength {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Reserved; do not use.
     * @type {Array<UInt32>}
     */
    reserved{
        get {
            if(!this.HasProp("__reservedProxyArray"))
                this.__reservedProxyArray := Win32FixedArray(this.ptr + 12, 3, Primitive, "uint")
            return this.__reservedProxyArray
        }
    }
}
