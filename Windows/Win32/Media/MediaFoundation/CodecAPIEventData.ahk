#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * The CodecAPIEventData structure (strmif.h) contains event data for the EC_CODECAPI_EVENT event. This event is sent by codecs that support the ICodecAPI interface.
 * @remarks
 * This structure may be followed by addition data, depending on the codec event. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-icodecapi-registerforevent">ICodecAPI::RegisterForEvent</a>.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/ns-strmif-codecapieventdata
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct CodecAPIEventData {
    #StructPack 4

    /**
     * A GUID that identifies the codec event.
     */
    guid : Guid

    /**
     * The length of the additional data that follows this structure, in bytes.
     *           The value can be zero.
     */
    dataLength : UInt32

    /**
     * Reserved; do not use.
     */
    reserved : UInt32[3]

}
