#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\OPM_RANDOM_NUMBER.ahk

/**
 * Contains the result from an OPM_GET_OUTPUT_ID status request.
 * @see https://learn.microsoft.com/windows/win32/api/opmapi/ns-opmapi-opm_output_id_data
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class OPM_OUTPUT_ID_DATA extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * An <a href="https://docs.microsoft.com/windows/win32/api/opmapi/ns-opmapi-opm_copp_compatible_get_info_parameters">OPM_RANDOM_NUMBER</a> structure. This structure contains the same 128-bit random number that the application sent to the driver in the <a href="https://docs.microsoft.com/windows/desktop/api/ksopmapi/ns-ksopmapi-opm_get_info_parameters">OPM_GET_INFO_PARAMETERS</a> or <a href="https://docs.microsoft.com/windows/desktop/api/opmapi/ns-opmapi-opm_copp_compatible_get_info_parameters">OPM_COPP_COMPATIBLE_GET_INFO_PARAMETERS</a> structure.
     * @type {OPM_RANDOM_NUMBER}
     */
    rnRandomNumber{
        get {
            if(!this.HasProp("__rnRandomNumber"))
                this.__rnRandomNumber := OPM_RANDOM_NUMBER(0, this)
            return this.__rnRandomNumber
        }
    }

    /**
     * A bitwise <b>OR</b> of <a href="https://docs.microsoft.com/windows/desktop/medfound/opm-status-flags">OPM Status Flags</a>.
     * @type {Integer}
     */
    ulStatusFlags {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The unique identifier of the monitor associated with this video output.
     * @type {Integer}
     */
    OutputId {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }
}
