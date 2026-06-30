#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3DDDI_COLOR_SPACE_TYPE.ahk
#Include .\D3DDDI_FLIPINTERVAL_TYPE.ahk
#Include .\D3DDDI_HDR_METADATA_TYPE.ahk
#Include .\D3DDDI_ROTATION.ahk
#Include ..\..\..\Win32\Foundation\HANDLE.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class D3DKMT_FLIPMODEL_PRESENTHISTORYTOKEN extends Win32Struct {
    static sizeof => 240

    static packingSize => 8

    /**
     * @type {Integer}
     */
    FenceValue {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    hLogicalSurface {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Pointer}
     */
    dxgContext {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    VidPnSourceId {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    SwapChainIndex {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * @type {Integer}
     */
    PresentLimitSemaphoreId {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {D3DDDI_FLIPINTERVAL_TYPE}
     */
    FlipInterval {
        get => NumGet(this, 40, "int")
        set => NumPut("int", value, this, 40)
    }

    /**
     * @type {Pointer}
     */
    Flags {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * @type {Integer}
     */
    hCompSurf {
        get => NumGet(this, 56, "int64")
        set => NumPut("int64", value, this, 56)
    }

    /**
     * @type {Pointer}
     */
    compSurfLuid {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * @type {Integer}
     */
    confirmationCookie {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * @type {Integer}
     */
    CompositionSyncKey {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * @type {Integer}
     */
    RemainingTokens {
        get => NumGet(this, 88, "uint")
        set => NumPut("uint", value, this, 88)
    }

    /**
     * @type {Pointer}
     */
    ScrollRect {
        get => NumGet(this, 96, "ptr")
        set => NumPut("ptr", value, this, 96)
    }

    /**
     * @type {Pointer}
     */
    ScrollOffset {
        get => NumGet(this, 104, "ptr")
        set => NumPut("ptr", value, this, 104)
    }

    /**
     * @type {Integer}
     */
    PresentCount {
        get => NumGet(this, 112, "uint")
        set => NumPut("uint", value, this, 112)
    }

    /**
     * @type {Array<Float>}
     */
    RevealColor {
        get {
            if(!this.HasProp("__RevealColorProxyArray"))
                this.__RevealColorProxyArray := Win32FixedArray(this.ptr + 116, 4, Primitive, "float")
            return this.__RevealColorProxyArray
        }
    }

    /**
     * @type {D3DDDI_ROTATION}
     */
    Rotation {
        get => NumGet(this, 132, "int")
        set => NumPut("int", value, this, 132)
    }

    /**
     * @type {Pointer}
     */
    ScatterBlts {
        get => NumGet(this, 136, "ptr")
        set => NumPut("ptr", value, this, 136)
    }

    /**
     * @type {HANDLE}
     */
    hSyncObject {
        get {
            if(!this.HasProp("__hSyncObject"))
                this.__hSyncObject := HANDLE(136, this)
            return this.__hSyncObject
        }
    }

    /**
     * @type {D3DDDI_HDR_METADATA_TYPE}
     */
    HDRMetaDataType {
        get => NumGet(this, 144, "int")
        set => NumPut("int", value, this, 144)
    }

    /**
     * @type {Pointer}
     */
    HDRMetaDataHDR10 {
        get => NumGet(this, 152, "ptr")
        set => NumPut("ptr", value, this, 152)
    }

    /**
     * @type {Pointer}
     */
    HDRMetaDataHDR10Plus {
        get => NumGet(this, 152, "ptr")
        set => NumPut("ptr", value, this, 152)
    }

    /**
     * @type {Integer}
     */
    InkCookie {
        get => NumGet(this, 160, "uint")
        set => NumPut("uint", value, this, 160)
    }

    /**
     * @type {Pointer}
     */
    SourceRect {
        get => NumGet(this, 168, "ptr")
        set => NumPut("ptr", value, this, 168)
    }

    /**
     * @type {Integer}
     */
    DestWidth {
        get => NumGet(this, 176, "uint")
        set => NumPut("uint", value, this, 176)
    }

    /**
     * @type {Integer}
     */
    DestHeight {
        get => NumGet(this, 180, "uint")
        set => NumPut("uint", value, this, 180)
    }

    /**
     * @type {Pointer}
     */
    TargetRect {
        get => NumGet(this, 184, "ptr")
        set => NumPut("ptr", value, this, 184)
    }

    /**
     * @type {Array<Float>}
     */
    Transform {
        get {
            if(!this.HasProp("__TransformProxyArray"))
                this.__TransformProxyArray := Win32FixedArray(this.ptr + 192, 6, Primitive, "float")
            return this.__TransformProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    CustomDuration {
        get => NumGet(this, 216, "uint")
        set => NumPut("uint", value, this, 216)
    }

    /**
     * @type {D3DDDI_FLIPINTERVAL_TYPE}
     */
    CustomDurationFlipInterval {
        get => NumGet(this, 220, "int")
        set => NumPut("int", value, this, 220)
    }

    /**
     * @type {Integer}
     */
    PlaneIndex {
        get => NumGet(this, 224, "uint")
        set => NumPut("uint", value, this, 224)
    }

    /**
     * @type {D3DDDI_COLOR_SPACE_TYPE}
     */
    ColorSpace {
        get => NumGet(this, 228, "int")
        set => NumPut("int", value, this, 228)
    }

    /**
     * @type {Pointer}
     */
    DirtyRegions {
        get => NumGet(this, 232, "ptr")
        set => NumPut("ptr", value, this, 232)
    }
}
