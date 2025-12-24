#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Win32\Foundation\HWND.ahk
#Include ..\..\..\Win32\Foundation\RECT.ahk
#Include ..\..\..\Win32\Foundation\HANDLE.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class D3DKMT_PRESENT extends Win32Struct
{
    static sizeof => 432

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
    hWindow{
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
     * @type {RECT}
     */
    DstRect{
        get {
            if(!this.HasProp("__DstRect"))
                this.__DstRect := RECT(32, this)
            return this.__DstRect
        }
    }

    /**
     * @type {RECT}
     */
    SrcRect{
        get {
            if(!this.HasProp("__SrcRect"))
                this.__SrcRect := RECT(48, this)
            return this.__SrcRect
        }
    }

    /**
     * @type {Integer}
     */
    SubRectCnt {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * @type {Pointer<RECT>}
     */
    pSrcSubRects {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * @type {Integer}
     */
    PresentCount {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * @type {Integer}
     */
    FlipInterval {
        get => NumGet(this, 84, "int")
        set => NumPut("int", value, this, 84)
    }

    /**
     * @type {Pointer<D3DKMT_PRESENTFLAGS>}
     */
    Flags {
        get => NumGet(this, 88, "ptr")
        set => NumPut("ptr", value, this, 88)
    }

    /**
     * @type {Integer}
     */
    BroadcastContextCount {
        get => NumGet(this, 96, "uint")
        set => NumPut("uint", value, this, 96)
    }

    /**
     * @type {Array<UInt32>}
     */
    BroadcastContext{
        get {
            if(!this.HasProp("__BroadcastContextProxyArray"))
                this.__BroadcastContextProxyArray := Win32FixedArray(this.ptr + 100, 64, Primitive, "uint")
            return this.__BroadcastContextProxyArray
        }
    }

    /**
     * @type {HANDLE}
     */
    PresentLimitSemaphore{
        get {
            if(!this.HasProp("__PresentLimitSemaphore"))
                this.__PresentLimitSemaphore := HANDLE(360, this)
            return this.__PresentLimitSemaphore
        }
    }

    /**
     * @type {Pointer<D3DKMT_PRESENTHISTORYTOKEN>}
     */
    PresentHistoryToken {
        get => NumGet(this, 368, "ptr")
        set => NumPut("ptr", value, this, 368)
    }

    /**
     * @type {Pointer<D3DKMT_PRESENT_RGNS>}
     */
    pPresentRegions {
        get => NumGet(this, 376, "ptr")
        set => NumPut("ptr", value, this, 376)
    }

    /**
     * @type {Integer}
     */
    hAdapter {
        get => NumGet(this, 384, "uint")
        set => NumPut("uint", value, this, 384)
    }

    /**
     * @type {Integer}
     */
    hIndirectContext {
        get => NumGet(this, 384, "uint")
        set => NumPut("uint", value, this, 384)
    }

    /**
     * @type {Integer}
     */
    Duration {
        get => NumGet(this, 388, "uint")
        set => NumPut("uint", value, this, 388)
    }

    /**
     * @type {Pointer<Integer>}
     */
    BroadcastSrcAllocation {
        get => NumGet(this, 392, "ptr")
        set => NumPut("ptr", value, this, 392)
    }

    /**
     * @type {Pointer<Integer>}
     */
    BroadcastDstAllocation {
        get => NumGet(this, 400, "ptr")
        set => NumPut("ptr", value, this, 400)
    }

    /**
     * @type {Integer}
     */
    PrivateDriverDataSize {
        get => NumGet(this, 408, "uint")
        set => NumPut("uint", value, this, 408)
    }

    /**
     * @type {Pointer<Void>}
     */
    pPrivateDriverData {
        get => NumGet(this, 416, "ptr")
        set => NumPut("ptr", value, this, 416)
    }

    /**
     * @type {BOOLEAN}
     */
    bOptimizeForComposition {
        get => NumGet(this, 424, "char")
        set => NumPut("char", value, this, 424)
    }
}
