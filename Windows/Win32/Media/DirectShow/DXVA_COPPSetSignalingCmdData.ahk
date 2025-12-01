#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information for the Set Signal command in Certified Output Protection Protocol (COPP).
 * @see https://learn.microsoft.com/windows/win32/api/dxva9typ/ns-dxva9typ-dxva_coppsetsignalingcmddata
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class DXVA_COPPSetSignalingCmdData extends Win32Struct
{
    static sizeof => 64

    static packingSize => 4

    /**
     * Specifies the protection standard and format that is current active. The value is a member of the <a href="https://docs.microsoft.com/windows/desktop/api/dxva9typ/ne-dxva9typ-copp_tvprotectionstandard">COPP_TVProtectionStandard</a> enumeration.
     * @type {Integer}
     */
    ActiveTVProtectionStandard {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Bit mask indicating which bits from <b>AspectRatioData1</b> to set in the signal.
     * @type {Integer}
     */
    AspectRatioChangeMask1 {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Specifies the aspect ratio value to be set for the current protection standard. For EN 300 294, use the <a href="https://docs.microsoft.com/windows/desktop/api/dxva9typ/ne-dxva9typ-copp_imageaspectratio_en300294">COPP_ImageAspectRatio_EN300294</a> enumeration.
     * @type {Integer}
     */
    AspectRatioData1 {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Bit mask indicating which bits from <b>AspectRatioData2</b> to set in the signal.
     * @type {Integer}
     */
    AspectRatioChangeMask2 {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * An additional data element related to aspect ratio. The presence and meaning of this data depends on the protection standard. This field can be used to convey End and Q0 bits for EIA-608-B, or the active format description for CEA-805-A.
     * @type {Integer}
     */
    AspectRatioData2 {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Bit mask indicating which bits from <b>AspectRatioData3</b> to set in the signal.
     * @type {Integer}
     */
    AspectRatioChangeMask3 {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * An additional data element related to aspect ratio for the current protection standard. The presence and meaning of this data depends on the protection standard.
     * @type {Integer}
     */
    AspectRatioData3 {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Array of bit masks indicating which bits in <b>ExtendedInfoData</b> to change. This array is currently not used. Set each member to zero.
     * @type {Array<UInt32>}
     */
    ExtendedInfoChangeMask{
        get {
            if(!this.HasProp("__ExtendedInfoChangeMaskProxyArray"))
                this.__ExtendedInfoChangeMaskProxyArray := Win32FixedArray(this.ptr + 28, 4, Primitive, "uint")
            return this.__ExtendedInfoChangeMaskProxyArray
        }
    }

    /**
     * Additional signaling elements to be set. This array is currently not used.
     *           Set each member to zero.
     * @type {Array<UInt32>}
     */
    ExtendedInfoData{
        get {
            if(!this.HasProp("__ExtendedInfoDataProxyArray"))
                this.__ExtendedInfoDataProxyArray := Win32FixedArray(this.ptr + 44, 4, Primitive, "uint")
            return this.__ExtendedInfoDataProxyArray
        }
    }

    /**
     * Reserved. Set to zero.
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 60, "uint")
        set => NumPut("uint", value, this, 60)
    }
}
