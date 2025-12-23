#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains the result from a Signaling query in Certified Output Protection Protocol (COPP).
 * @see https://learn.microsoft.com/windows/win32/api/dxva9typ/ns-dxva9typ-dxva_coppstatussignalingcmddata
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class DXVA_COPPStatusSignalingCmdData extends Win32Struct
{
    static sizeof => 80

    static packingSize => 8

    /**
     * A 128-bit random number that was passed by the application in the <b>AMCOPPStatusInput</b> structure.
     * @type {Pointer<Guid>}
     */
    rApp {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Status flag. See <a href="https://docs.microsoft.com/windows/desktop/api/dxva9typ/ne-dxva9typ-copp_statusflags">COPP_StatusFlags</a>.
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Bitwise <b>OR</b> of flags from the <a href="https://docs.microsoft.com/windows/desktop/api/dxva9typ/ne-dxva9typ-copp_tvprotectionstandard">COPP_TVProtectionStandard</a> enumeration. The driver should return flags for all of the protection standards and resolutions that it supports.
     * @type {Integer}
     */
    AvailableTVProtectionStandards {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Member of the <a href="https://docs.microsoft.com/windows/desktop/api/dxva9typ/ne-dxva9typ-copp_tvprotectionstandard">COPP_TVProtectionStandard</a> enumeration, indicating the protection standard that is currently active.
     * @type {Integer}
     */
    ActiveTVProtectionStandard {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Reserved.
     * @type {Integer}
     */
    TVType {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Bit mask indicating which bits of <b>AspectRatioData1</b> are valid.
     * @type {Integer}
     */
    AspectRatioValidMask1 {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Specifies the current aspect ratio value. For EN 300 294, the value is a member of the <a href="https://docs.microsoft.com/windows/desktop/api/dxva9typ/ne-dxva9typ-copp_imageaspectratio_en300294">COPP_ImageAspectRatio_EN300294</a> enumeration.
     * @type {Integer}
     */
    AspectRatioData1 {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * Bit mask indicating which bits of <b>AspectRatioData2</b> are valid.
     * @type {Integer}
     */
    AspectRatioValidMask2 {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Additional data element related to aspect ratio for the current protection standard. The presence and meaning of this data depends on the protection standard. This field may be used to convey End and Q0 bits for EIA-608-B, or the active format description for CEA-805-A.
     * @type {Integer}
     */
    AspectRatioData2 {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * Bit mask indicating which bits of <b>AspectRatioData3</b> are valid.
     * @type {Integer}
     */
    AspectRatioValidMask3 {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * Additional data element related to aspect ratio for the current protection standard. The presence and meaning of this data depends on the protection standard.
     * @type {Integer}
     */
    AspectRatioData3 {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * Array of bit masks indicating which bits in <b>ExtendedInfoData</b> are valid.
     * @type {Array<UInt32>}
     */
    ExtendedInfoValidMask{
        get {
            if(!this.HasProp("__ExtendedInfoValidMaskProxyArray"))
                this.__ExtendedInfoValidMaskProxyArray := Win32FixedArray(this.ptr + 48, 4, Primitive, "uint")
            return this.__ExtendedInfoValidMaskProxyArray
        }
    }

    /**
     * Additional signaling elements. This array is currently not used.
     * @type {Array<UInt32>}
     */
    ExtendedInfoData{
        get {
            if(!this.HasProp("__ExtendedInfoDataProxyArray"))
                this.__ExtendedInfoDataProxyArray := Win32FixedArray(this.ptr + 64, 4, Primitive, "uint")
            return this.__ExtendedInfoDataProxyArray
        }
    }
}
