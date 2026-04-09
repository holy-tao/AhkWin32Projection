#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Win32\Foundation\HWND.ahk
#Include ..\..\..\Win32\Foundation\RECT.ahk
#Include .\D3DDDI_FLIPINTERVAL_TYPE.ahk
#Include ..\..\..\Win32\Foundation\HANDLE.ahk
#Include .\D3DKMT_PRESENT_RGNS.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class D3DKMT_PRESENT extends Win32Struct {
    static sizeof => 416

    static packingSize => 8

    /**
     * @type {Integer}
     */
    hDevice {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    hContext {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {HWND}
     */
    hWindow {
        get {
            if(!this.HasProp("__hWindow"))
                this.__hWindow := HWND(8, this)
            return this.__hWindow
        }
    }

    /**
     * @type {Integer}
     */
    VidPnSourceId {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    hSource {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {Integer}
     */
    hDestination {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    Color {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * @type {Pointer}
     */
    DstRect {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Pointer}
     */
    SrcRect {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    SubRectCnt {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * @type {Pointer<RECT>}
     */
    pSrcSubRects {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * @type {Integer}
     */
    PresentCount {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * @type {D3DDDI_FLIPINTERVAL_TYPE}
     */
    FlipInterval {
        get => NumGet(this, 68, "int")
        set => NumPut("int", value, this, 68)
    }

    /**
     * @type {Pointer}
     */
    Flags {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * @type {Integer}
     */
    BroadcastContextCount {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * @type {Array<Integer>}
     */
    BroadcastContext {
        get {
            if(!this.HasProp("__BroadcastContextProxyArray"))
                this.__BroadcastContextProxyArray := Win32FixedArray(this.ptr + 84, 64, Primitive, "uint")
            return this.__BroadcastContextProxyArray
        }
    }

    /**
     * @type {HANDLE}
     */
    PresentLimitSemaphore {
        get {
            if(!this.HasProp("__PresentLimitSemaphore"))
                this.__PresentLimitSemaphore := HANDLE(344, this)
            return this.__PresentLimitSemaphore
        }
    }

    /**
     * @type {Pointer}
     */
    PresentHistoryToken {
        get => NumGet(this, 352, "ptr")
        set => NumPut("ptr", value, this, 352)
    }

    /**
     * @type {Pointer<D3DKMT_PRESENT_RGNS>}
     */
    pPresentRegions {
        get => NumGet(this, 360, "ptr")
        set => NumPut("ptr", value, this, 360)
    }

    /**
     * @type {Integer}
     */
    hAdapter {
        get => NumGet(this, 368, "uint")
        set => NumPut("uint", value, this, 368)
    }

    /**
     * @type {Integer}
     */
    hIndirectContext {
        get => NumGet(this, 368, "uint")
        set => NumPut("uint", value, this, 368)
    }

    /**
     * @type {Integer}
     */
    Duration {
        get => NumGet(this, 372, "uint")
        set => NumPut("uint", value, this, 372)
    }

    /**
     * @type {Pointer<Integer>}
     */
    BroadcastSrcAllocation {
        get => NumGet(this, 376, "ptr")
        set => NumPut("ptr", value, this, 376)
    }

    /**
     * @type {Pointer<Integer>}
     */
    BroadcastDstAllocation {
        get => NumGet(this, 384, "ptr")
        set => NumPut("ptr", value, this, 384)
    }

    /**
     * @type {Integer}
     */
    PrivateDriverDataSize {
        get => NumGet(this, 392, "uint")
        set => NumPut("uint", value, this, 392)
    }

    /**
     * @type {Pointer<Void>}
     */
    pPrivateDriverData {
        get => NumGet(this, 400, "ptr")
        set => NumPut("ptr", value, this, 400)
    }

    /**
     * @type {BOOLEAN}
     */
    bOptimizeForComposition {
        get => NumGet(this, 408, "char")
        set => NumPut("char", value, this, 408)
    }
}
