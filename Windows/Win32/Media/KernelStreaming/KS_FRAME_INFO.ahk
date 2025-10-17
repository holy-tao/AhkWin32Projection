#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HANDLE.ahk
#Include ..\..\Foundation\RECT.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KS_FRAME_INFO extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * @type {Integer}
     */
    ExtendedHeaderSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    dwFrameFlags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    PictureNumber {
        get => NumGet(this, 8, "int64")
        set => NumPut("int64", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    DropCount {
        get => NumGet(this, 16, "int64")
        set => NumPut("int64", value, this, 16)
    }

    /**
     * @type {HANDLE}
     */
    hDirectDraw{
        get {
            if(!this.HasProp("__hDirectDraw"))
                this.__hDirectDraw := HANDLE(24, this)
            return this.__hDirectDraw
        }
    }

    /**
     * @type {HANDLE}
     */
    hSurfaceHandle{
        get {
            if(!this.HasProp("__hSurfaceHandle"))
                this.__hSurfaceHandle := HANDLE(32, this)
            return this.__hSurfaceHandle
        }
    }

    /**
     * @type {RECT}
     */
    DirectDrawRect{
        get {
            if(!this.HasProp("__DirectDrawRect"))
                this.__DirectDrawRect := RECT(40, this)
            return this.__DirectDrawRect
        }
    }

    /**
     * @type {Integer}
     */
    lSurfacePitch {
        get => NumGet(this, 56, "int")
        set => NumPut("int", value, this, 56)
    }

    /**
     * @type {Integer}
     */
    Reserved1 {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * @type {Integer}
     */
    Reserved2 {
        get => NumGet(this, 60, "uint")
        set => NumPut("uint", value, this, 60)
    }

    /**
     * @type {Integer}
     */
    Reserved3 {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * @type {Integer}
     */
    Reserved4 {
        get => NumGet(this, 68, "uint")
        set => NumPut("uint", value, this, 68)
    }

    /**
     * @type {Integer}
     */
    FrameCompletionNumber {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }
}
