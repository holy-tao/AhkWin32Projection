#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\OPM_RANDOM_NUMBER.ahk

/**
 * Contains the result from an OPM_GET_CODEC_INFO query.
 * @see https://docs.microsoft.com/windows/win32/api//opmapi/ns-opmapi-opm_get_codec_info_information
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class OPM_GET_CODEC_INFO_INFORMATION extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * An <a href="https://docs.microsoft.com/windows/desktop/api/ksopmapi/ns-ksopmapi-opm_random_number">OPM_RANDOM_NUMBER</a> structure. This structure contains the same 128-bit random number that the application sent to the driver in the <a href="https://docs.microsoft.com/windows/desktop/api/ksopmapi/ns-ksopmapi-opm_get_info_parameters">OPM_GET_INFO_PARAMETERS</a> structure.
     * @type {OPM_RANDOM_NUMBER}
     */
    rnRandomNumber{
        get {
            if(!this.HasProp("__rnRandomNumber"))
                this.__rnRandomNumber := OPM_RANDOM_NUMBER(this.ptr + 0)
            return this.__rnRandomNumber
        }
    }

    /**
     * The merit value of the codec.
     * @type {Integer}
     */
    Merit {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
