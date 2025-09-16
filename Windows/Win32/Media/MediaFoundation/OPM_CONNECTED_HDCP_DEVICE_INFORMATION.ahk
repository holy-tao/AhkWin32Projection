#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\OPM_RANDOM_NUMBER.ahk
#Include .\OPM_HDCP_KEY_SELECTION_VECTOR.ahk

/**
 * Contains the result from an OPM_GET_CONNECTED_HDCP_DEVICE_INFORMATION query.
 * @remarks
 * The layout of this structure is identical to the <a href="https://docs.microsoft.com/windows/desktop/api/dxva9typ/ns-dxva9typ-dxva_coppstatushdcpkeydata">DXVA_COPPStatusHDCPKeyData</a> structure used in Certified Output Protection Protocol (COPP).
 * @see https://learn.microsoft.com/windows/win32/api/opmapi/ns-opmapi-opm_connected_hdcp_device_information
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class OPM_CONNECTED_HDCP_DEVICE_INFORMATION extends Win32Struct
{
    static sizeof => 80

    static packingSize => 8

    /**
     * An <a href="https://docs.microsoft.com/windows/desktop/api/ksopmapi/ns-ksopmapi-opm_random_number">OPM_RANDOM_NUMBER</a> structure. This structure contains the same 128-bit random number that the application sent to the driver in the <a href="https://docs.microsoft.com/windows/desktop/api/ksopmapi/ns-ksopmapi-opm_get_info_parameters">OPM_GET_INFO_PARAMETERS</a> or <a href="https://docs.microsoft.com/windows/desktop/api/opmapi/nf-opmapi-iopmvideooutput-coppcompatiblegetinformation">OPM_COPP_COMPATIBLE_GET_INFO_PARAMETERS</a> structure.
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
     * A bitwise <b>OR</b> of <a href="https://docs.microsoft.com/windows/desktop/medfound/opm-status-flags">OPM Status Flags</a>.
     * @type {Integer}
     */
    ulStatusFlags {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * A value that indicates whether the connected device is an HDCP repeater.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="OPM_HDCP_FLAG_NONE"></a><a id="opm_hdcp_flag_none"></a><dl>
     * <dt><b>OPM_HDCP_FLAG_NONE</b></dt>
     * <dt>0x00</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The device is not an HDCP repeater.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="OPM_HDCP_FLAG_REPEATER"></a><a id="opm_hdcp_flag_repeater"></a><dl>
     * <dt><b>OPM_HDCP_FLAG_REPEATER</b></dt>
     * <dt>0x01</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The device is an HDCP repeater.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    ulHDCPFlags {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * An <a href="https://docs.microsoft.com/windows/desktop/api/opmapi/ns-opmapi-opm_hdcp_key_selection_vector">OPM_HDCP_KEY_SELECTION_VECTOR</a> structure that contains the device's key selection vector (KSV). This is the value named <i>Bksv</i> in the HDCP specification.
     * @type {OPM_HDCP_KEY_SELECTION_VECTOR}
     */
    ksvB{
        get {
            if(!this.HasProp("__ksvB"))
                this.__ksvB := OPM_HDCP_KEY_SELECTION_VECTOR(this.ptr + 25)
            return this.__ksvB
        }
    }

    /**
     * Reserved for future use. Fill this array with zeros.
     * @type {Array<Byte>}
     */
    Reserved{
        get {
            if(!this.HasProp("__ReservedProxyArray"))
                this.__ReservedProxyArray := Win32FixedArray(this.ptr + 30, 11, Primitive, "char")
            return this.__ReservedProxyArray
        }
    }

    /**
     * Reserved for future use. Fill this array with zeros.
     * @type {Array<Byte>}
     */
    Reserved2{
        get {
            if(!this.HasProp("__Reserved2ProxyArray"))
                this.__Reserved2ProxyArray := Win32FixedArray(this.ptr + 41, 16, Primitive, "char")
            return this.__Reserved2ProxyArray
        }
    }

    /**
     * Reserved for future use. Fill this array with zeros.
     * @type {Array<Byte>}
     */
    Reserved3{
        get {
            if(!this.HasProp("__Reserved3ProxyArray"))
                this.__Reserved3ProxyArray := Win32FixedArray(this.ptr + 57, 16, Primitive, "char")
            return this.__Reserved3ProxyArray
        }
    }
}
