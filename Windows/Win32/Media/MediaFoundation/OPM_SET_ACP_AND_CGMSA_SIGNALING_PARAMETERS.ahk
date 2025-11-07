#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information for the OPM_SET_ACP_AND_CGMSA_SIGNALING command in Output Protection Manager (OPM).
 * @remarks
 * 
 * The layout of this structure is identical to the <a href="https://docs.microsoft.com/windows/desktop/api/dxva9typ/ns-dxva9typ-dxva_coppsetsignalingcmddata">DXVA_COPPSetSignalingCmdData</a> structure used in Certified Output Protection Manager (COPP).
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//opmapi/ns-opmapi-opm_set_acp_and_cgmsa_signaling_parameters
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class OPM_SET_ACP_AND_CGMSA_SIGNALING_PARAMETERS extends Win32Struct
{
    static sizeof => 64

    static packingSize => 4

    /**
     * Specifies the protection standard and format that is currently active. The value is a bitwise <b>OR</b> of <a href="https://docs.microsoft.com/windows/desktop/medfound/tv-protection-standard-flags">TV Protection Standard Flags</a>.
     * @type {Integer}
     */
    ulNewTVProtectionStandard {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A bitmask indicating which bits from <b>ulAspectRatioData1</b> to set in the signal.
     * @type {Integer}
     */
    ulAspectRatioChangeMask1 {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Specifies the aspect ratio value to be set for the current protection standard. For EN 300 294, use the <a href="https://docs.microsoft.com/windows/desktop/api/opmapi/ne-opmapi-opm_image_aspect_ratio_en300294">OPM_IMAGE_ASPECT_RATIO_EN300294</a> enumeration.
     * @type {Integer}
     */
    ulAspectRatioData1 {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * A bitmask indicating which bits from <b>ulAspectRatioData2</b> to set in the signal.
     * @type {Integer}
     */
    ulAspectRatioChangeMask2 {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * An additional data element related to aspect ratio. The presence and meaning of this data depends on the protection standard. This field can be used to convey End and Q0 bits for EIA-608-B, or the active format description for CEA-805-A.
     * @type {Integer}
     */
    ulAspectRatioData2 {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * A bitmask indicating which bits from <b>ulAspectRatioData3</b> to set in the signal.
     * @type {Integer}
     */
    ulAspectRatioChangeMask3 {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * An additional data element related to aspect ratio for the current protection standard. The presence and meaning of this data depends on the protection standard.
     * @type {Integer}
     */
    ulAspectRatioData3 {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Reserved for future use. Set the entire array to zero.
     * @type {Array<UInt32>}
     */
    ulReserved{
        get {
            if(!this.HasProp("__ulReservedProxyArray"))
                this.__ulReservedProxyArray := Win32FixedArray(this.ptr + 28, 4, Primitive, "uint")
            return this.__ulReservedProxyArray
        }
    }

    /**
     * Reserved for future use. Set the entire array to zero.
     * @type {Array<UInt32>}
     */
    ulReserved2{
        get {
            if(!this.HasProp("__ulReserved2ProxyArray"))
                this.__ulReserved2ProxyArray := Win32FixedArray(this.ptr + 44, 4, Primitive, "uint")
            return this.__ulReserved2ProxyArray
        }
    }

    /**
     * Reserved for future use. Set to zero.
     * @type {Integer}
     */
    ulReserved3 {
        get => NumGet(this, 60, "uint")
        set => NumPut("uint", value, this, 60)
    }
}
