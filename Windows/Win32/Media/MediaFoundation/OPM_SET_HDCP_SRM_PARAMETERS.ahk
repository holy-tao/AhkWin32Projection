#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains parameters for the OPM_SET_HDCP_SRM command.
 * @see https://docs.microsoft.com/windows/win32/api//opmapi/ns-opmapi-opm_set_hdcp_srm_parameters
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class OPM_SET_HDCP_SRM_PARAMETERS extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * Contains the SRM version number in little-endian format. This number is contained in the <b>SRM Version</b> field of the SRM. For more information, see the HDCP specification.
     * @type {Integer}
     */
    ulSRMVersion {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
