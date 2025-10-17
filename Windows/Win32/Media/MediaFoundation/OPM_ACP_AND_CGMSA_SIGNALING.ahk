#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\OPM_RANDOM_NUMBER.ahk

/**
 * Contains the result from an OPM_GET_ACP_AND_CGMSA_SIGNALING query.
 * @remarks
 * 
  * The layout of this structure is identical to the <a href="https://docs.microsoft.com/windows/desktop/api/dxva9typ/ns-dxva9typ-dxva_coppstatussignalingcmddata">DXVA_COPPStatusSignalingCmdData</a> structure used in Certified Output Protection Protocol (COPP).
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//opmapi/ns-opmapi-opm_acp_and_cgmsa_signaling
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class OPM_ACP_AND_CGMSA_SIGNALING extends Win32Struct
{
    static sizeof => 88

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
     * A bitwise <b>OR</b> of zero or more <a href="https://docs.microsoft.com/windows/desktop/medfound/tv-protection-standard-flags">TV Protection Standard Flags</a>. The driver will return flags for all of the protection standards and resolutions that it supports, regardless of which are now active.
     * @type {Integer}
     */
    ulAvailableTVProtectionStandards {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * One value from the <a href="https://docs.microsoft.com/windows/desktop/medfound/tv-protection-standard-flags">TV Protection Standard Flags</a>, indicating the protection standard that is currently active.
     * @type {Integer}
     */
    ulActiveTVProtectionStandard {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Reserved for future use. Set to zero.
     * @type {Integer}
     */
    ulReserved {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * A bitmask indicating which bits of <b>ulAspectRatioData1</b> are valid.
     * @type {Integer}
     */
    ulAspectRatioValidMask1 {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * The current aspect ratio. For EN 300 294, the value is a member of the <a href="https://docs.microsoft.com/windows/desktop/api/opmapi/ne-opmapi-opm_image_aspect_ratio_en300294">OPM_IMAGE_ASPECT_RATIO_EN300294</a> enumeration.
     * @type {Integer}
     */
    ulAspectRatioData1 {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * A bitmask indicating which bits of <b>ulAspectRatioData2</b> are valid.
     * @type {Integer}
     */
    ulAspectRatioValidMask2 {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * An additional data element related to aspect ratio for the current protection standard. The presence and meaning of this data depends on the protection standard. This field can be used to convey End and Q0 bits for EIA-608-B, or the active format description for CEA-805-A.
     * @type {Integer}
     */
    ulAspectRatioData2 {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * A bitmask indicating which bits of <b>ulAspectRatioData3</b> are valid.
     * @type {Integer}
     */
    ulAspectRatioValidMask3 {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * An additional data element related to aspect ratio for the current protection standard. The presence and meaning of this data depends on the protection standard.
     * @type {Integer}
     */
    ulAspectRatioData3 {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * Reserved for future use. Fill this array with zeros.
     * @type {Array<UInt32>}
     */
    ulReserved2{
        get {
            if(!this.HasProp("__ulReserved2ProxyArray"))
                this.__ulReserved2ProxyArray := Win32FixedArray(this.ptr + 56, 4, Primitive, "uint")
            return this.__ulReserved2ProxyArray
        }
    }

    /**
     * Reserved for future use.Fill this array with zeros.
     * @type {Array<UInt32>}
     */
    ulReserved3{
        get {
            if(!this.HasProp("__ulReserved3ProxyArray"))
                this.__ulReserved3ProxyArray := Win32FixedArray(this.ptr + 72, 4, Primitive, "uint")
            return this.__ulReserved3ProxyArray
        }
    }
}
