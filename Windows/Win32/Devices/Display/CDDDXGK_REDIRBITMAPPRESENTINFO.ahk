#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\RECT.ahk
#Include ..\..\Foundation\HANDLE.ahk

/**
 * @namespace Windows.Win32.Devices.Display
 */
class CDDDXGK_REDIRBITMAPPRESENTINFO extends Win32Struct {
    static sizeof => 552

    static packingSize => 8

    /**
     * @type {Integer}
     */
    NumDirtyRects {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Pointer<RECT>}
     */
    DirtyRect {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    NumContexts {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Array<HANDLE>}
     */
    hContext {
        get {
            if(!this.HasProp("__hContextProxyArray"))
                this.__hContextProxyArray := Win32FixedArray(this.ptr + 24, 65, Primitive, "ptr")
            return this.__hContextProxyArray
        }
    }

    /**
     * @type {BOOLEAN}
     */
    bDoNotSynchronizeWithDxContent {
        get => NumGet(this, 544, "char")
        set => NumPut("char", value, this, 544)
    }
}
