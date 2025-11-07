#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\OPM_RANDOM_NUMBER.ahk

/**
 * Contains the result from an Output Protection Manager (OPM) status request.
 * @remarks
 * 
 * The layout of this structure is identical to the <a href="https://docs.microsoft.com/windows/desktop/api/dxva9typ/ns-dxva9typ-dxva_coppstatusdata">DXVA_COPPStatusData</a> structure used in Certified Output Protection Protocol (COPP).
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//opmapi/ns-opmapi-opm_standard_information
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class OPM_STANDARD_INFORMATION extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * An <a href="https://docs.microsoft.com/windows/desktop/api/ksopmapi/ns-ksopmapi-opm_random_number">OPM_RANDOM_NUMBER</a> structure. This structure contains the same 128-bit random number that the application sent to the driver in the <a href="https://docs.microsoft.com/windows/desktop/api/ksopmapi/ns-ksopmapi-opm_get_info_parameters">OPM_GET_INFO_PARAMETERS</a> or <a href="https://docs.microsoft.com/windows/desktop/api/opmapi/nf-opmapi-iopmvideooutput-coppcompatiblegetinformation">OPM_COPP_COMPATIBLE_GET_INFO_PARAMETERS</a> structure.
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
     * Response data. The meaning of this value depends on the status request. For more information, see <a href="https://docs.microsoft.com/windows/desktop/medfound/opm-status-requests">OPM Status Requests</a>.
     * @type {Integer}
     */
    ulInformation {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Reserved for future use. Set to zero.
     * @type {Integer}
     */
    ulReserved {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Reserved for future use. Set to zero.
     * @type {Integer}
     */
    ulReserved2 {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }
}
