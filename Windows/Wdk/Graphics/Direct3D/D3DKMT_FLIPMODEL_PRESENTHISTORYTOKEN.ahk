#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Win32\Foundation\LUID.ahk
#Include ..\..\..\Win32\Foundation\RECT.ahk
#Include ..\..\..\Win32\Foundation\POINT.ahk
#Include ..\..\..\Win32\Foundation\HANDLE.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class D3DKMT_FLIPMODEL_PRESENTHISTORYTOKEN extends Win32Struct
{
    static sizeof => 264

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
     * @type {Integer}
     */
    FlipInterval {
        get => NumGet(this, 40, "int")
        set => NumPut("int", value, this, 40)
    }

    /**
     * @type {Pointer<D3DKMT_FLIPMODEL_PRESENTHISTORYTOKENFLAGS>}
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
     * @type {LUID}
     */
    compSurfLuid{
        get {
            if(!this.HasProp("__compSurfLuid"))
                this.__compSurfLuid := LUID(64, this)
            return this.__compSurfLuid
        }
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
     * @type {RECT}
     */
    ScrollRect{
        get {
            if(!this.HasProp("__ScrollRect"))
                this.__ScrollRect := RECT(92, this)
            return this.__ScrollRect
        }
    }

    /**
     * @type {POINT}
     */
    ScrollOffset{
        get {
            if(!this.HasProp("__ScrollOffset"))
                this.__ScrollOffset := POINT(108, this)
            return this.__ScrollOffset
        }
    }

    /**
     * @type {Integer}
     */
    PresentCount {
        get => NumGet(this, 116, "uint")
        set => NumPut("uint", value, this, 116)
    }

    /**
     * @type {Array<Single>}
     */
    RevealColor{
        get {
            if(!this.HasProp("__RevealColorProxyArray"))
                this.__RevealColorProxyArray := Win32FixedArray(this.ptr + 120, 4, Primitive, "float")
            return this.__RevealColorProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    Rotation {
        get => NumGet(this, 136, "int")
        set => NumPut("int", value, this, 136)
    }

    /**
     * @type {Pointer<D3DKMT_SCATTERBLTS>}
     */
    ScatterBlts {
        get => NumGet(this, 144, "ptr")
        set => NumPut("ptr", value, this, 144)
    }

    /**
     * @type {HANDLE}
     */
    hSyncObject{
        get {
            if(!this.HasProp("__hSyncObject"))
                this.__hSyncObject := HANDLE(144, this)
            return this.__hSyncObject
        }
    }

    /**
     * @type {Integer}
     */
    HDRMetaDataType {
        get => NumGet(this, 152, "int")
        set => NumPut("int", value, this, 152)
    }

    /**
     * @type {Pointer<D3DDDI_HDR_METADATA_HDR10>}
     */
    HDRMetaDataHDR10 {
        get => NumGet(this, 160, "ptr")
        set => NumPut("ptr", value, this, 160)
    }

    /**
     * @type {Pointer<D3DDDI_HDR_METADATA_HDR10PLUS>}
     */
    HDRMetaDataHDR10Plus {
        get => NumGet(this, 160, "ptr")
        set => NumPut("ptr", value, this, 160)
    }

    /**
     * @type {Integer}
     */
    InkCookie {
        get => NumGet(this, 168, "uint")
        set => NumPut("uint", value, this, 168)
    }

    /**
     * @type {RECT}
     */
    SourceRect{
        get {
            if(!this.HasProp("__SourceRect"))
                this.__SourceRect := RECT(172, this)
            return this.__SourceRect
        }
    }

    /**
     * @type {Integer}
     */
    DestWidth {
        get => NumGet(this, 188, "uint")
        set => NumPut("uint", value, this, 188)
    }

    /**
     * @type {Integer}
     */
    DestHeight {
        get => NumGet(this, 192, "uint")
        set => NumPut("uint", value, this, 192)
    }

    /**
     * @type {RECT}
     */
    TargetRect{
        get {
            if(!this.HasProp("__TargetRect"))
                this.__TargetRect := RECT(196, this)
            return this.__TargetRect
        }
    }

    /**
     * @type {Array<Single>}
     */
    Transform{
        get {
            if(!this.HasProp("__TransformProxyArray"))
                this.__TransformProxyArray := Win32FixedArray(this.ptr + 212, 6, Primitive, "float")
            return this.__TransformProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    CustomDuration {
        get => NumGet(this, 236, "uint")
        set => NumPut("uint", value, this, 236)
    }

    /**
     * @type {Integer}
     */
    CustomDurationFlipInterval {
        get => NumGet(this, 240, "int")
        set => NumPut("int", value, this, 240)
    }

    /**
     * @type {Integer}
     */
    PlaneIndex {
        get => NumGet(this, 244, "uint")
        set => NumPut("uint", value, this, 244)
    }

    /**
     * @type {Integer}
     */
    ColorSpace {
        get => NumGet(this, 248, "int")
        set => NumPut("int", value, this, 248)
    }

    /**
     * @type {Pointer<D3DKMT_DIRTYREGIONS>}
     */
    DirtyRegions {
        get => NumGet(this, 256, "ptr")
        set => NumPut("ptr", value, this, 256)
    }
}
