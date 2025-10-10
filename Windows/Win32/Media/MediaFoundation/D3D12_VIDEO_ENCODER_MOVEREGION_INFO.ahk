#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D12_VIDEO_ENCODER_FRAME_MOTION_SEARCH_MODE_CONFIG.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_VIDEO_ENCODER_MOVEREGION_INFO extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * @type {Integer}
     */
    NumMoveRegions {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Pointer<D3D12_VIDEO_ENCODER_MOVE_RECT>}
     */
    pMoveRegions {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {D3D12_VIDEO_ENCODER_FRAME_MOTION_SEARCH_MODE_CONFIG}
     */
    MotionSearchModeConfiguration{
        get {
            if(!this.HasProp("__MotionSearchModeConfiguration"))
                this.__MotionSearchModeConfiguration := D3D12_VIDEO_ENCODER_FRAME_MOTION_SEARCH_MODE_CONFIG(this.ptr + 16)
            return this.__MotionSearchModeConfiguration
        }
    }

    /**
     * @type {Integer}
     */
    SourceDPBFrameReference {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    MotionUnitPrecision {
        get => NumGet(this, 28, "int")
        set => NumPut("int", value, this, 28)
    }

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 32, "int")
        set => NumPut("int", value, this, 32)
    }
}
