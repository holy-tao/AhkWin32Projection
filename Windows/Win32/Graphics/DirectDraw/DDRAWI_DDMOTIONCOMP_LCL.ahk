#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\DDPIXELFORMAT.ahk
#Include ..\..\Foundation\HANDLE.ahk
#Include .\DDRAWI_DIRECTDRAW_LCL.ahk

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
class DDRAWI_DDMOTIONCOMP_LCL extends Win32Struct {
    static sizeof => 128

    static packingSize => 8

    /**
     * @type {Pointer<DDRAWI_DIRECTDRAW_LCL>}
     */
    lpDD {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Guid}
     */
    guid {
        get {
            if(!this.HasProp("__guid"))
                this.__guid := Guid(8, this)
            return this.__guid
        }
    }

    /**
     * @type {Integer}
     */
    dwUncompWidth {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    dwUncompHeight {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * @type {DDPIXELFORMAT}
     */
    ddUncompPixelFormat {
        get {
            if(!this.HasProp("__ddUncompPixelFormat"))
                this.__ddUncompPixelFormat := DDPIXELFORMAT(32, this)
            return this.__ddUncompPixelFormat
        }
    }

    /**
     * @type {Integer}
     */
    dwInternalFlags {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * @type {Integer}
     */
    dwRefCnt {
        get => NumGet(this, 68, "uint")
        set => NumPut("uint", value, this, 68)
    }

    /**
     * @type {Integer}
     */
    dwProcessId {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * @type {HANDLE}
     */
    hMoComp {
        get {
            if(!this.HasProp("__hMoComp"))
                this.__hMoComp := HANDLE(80, this)
            return this.__hMoComp
        }
    }

    /**
     * @type {Integer}
     */
    dwDriverReserved1 {
        get => NumGet(this, 88, "uint")
        set => NumPut("uint", value, this, 88)
    }

    /**
     * @type {Integer}
     */
    dwDriverReserved2 {
        get => NumGet(this, 92, "uint")
        set => NumPut("uint", value, this, 92)
    }

    /**
     * @type {Integer}
     */
    dwDriverReserved3 {
        get => NumGet(this, 96, "uint")
        set => NumPut("uint", value, this, 96)
    }

    /**
     * @type {Pointer<Void>}
     */
    lpDriverReserved1 {
        get => NumGet(this, 104, "ptr")
        set => NumPut("ptr", value, this, 104)
    }

    /**
     * @type {Pointer<Void>}
     */
    lpDriverReserved2 {
        get => NumGet(this, 112, "ptr")
        set => NumPut("ptr", value, this, 112)
    }

    /**
     * @type {Pointer<Void>}
     */
    lpDriverReserved3 {
        get => NumGet(this, 120, "ptr")
        set => NumPut("ptr", value, this, 120)
    }
}
