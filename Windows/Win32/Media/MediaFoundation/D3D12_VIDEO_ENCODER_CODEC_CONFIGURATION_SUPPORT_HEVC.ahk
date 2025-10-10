#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_SUPPORT_HEVC extends Win32Struct
{
    static sizeof => 24

    static packingSize => 4

    /**
     * @type {Integer}
     */
    SupportFlags {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    MinLumaCodingUnitSize {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    MaxLumaCodingUnitSize {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    MinLumaTransformUnitSize {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    MaxLumaTransformUnitSize {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    max_transform_hierarchy_depth_inter {
        get => NumGet(this, 20, "char")
        set => NumPut("char", value, this, 20)
    }

    /**
     * @type {Integer}
     */
    max_transform_hierarchy_depth_intra {
        get => NumGet(this, 21, "char")
        set => NumPut("char", value, this, 21)
    }
}
