#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D12_VIDEO_ENCODER_AV1_RESTORATION_TYPE.ahk
#Include .\D3D12_VIDEO_ENCODER_AV1_RESTORATION_TILESIZE.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class D3D12_VIDEO_ENCODER_AV1_RESTORATION_CONFIG extends Win32Struct {
    static sizeof => 24

    static packingSize => 4

    /**
     * @type {Array<D3D12_VIDEO_ENCODER_AV1_RESTORATION_TYPE>}
     */
    FrameRestorationType {
        get {
            if(!this.HasProp("__FrameRestorationTypeProxyArray"))
                this.__FrameRestorationTypeProxyArray := Win32FixedArray(this.ptr + 0, 3, Primitive, "int")
            return this.__FrameRestorationTypeProxyArray
        }
    }

    /**
     * @type {Array<D3D12_VIDEO_ENCODER_AV1_RESTORATION_TILESIZE>}
     */
    LoopRestorationPixelSize {
        get {
            if(!this.HasProp("__LoopRestorationPixelSizeProxyArray"))
                this.__LoopRestorationPixelSizeProxyArray := Win32FixedArray(this.ptr + 12, 3, Primitive, "int")
            return this.__LoopRestorationPixelSizeProxyArray
        }
    }
}
