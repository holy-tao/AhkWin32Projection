#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\RECT.ahk
#Include .\KS_AMVPDIMINFO.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KS_AMVPDATAINFO extends Win32Struct
{
    static sizeof => 80

    static packingSize => 8

    /**
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    dwMicrosecondsPerField {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {KS_AMVPDIMINFO}
     */
    amvpDimInfo{
        get {
            if(!this.HasProp("__amvpDimInfo"))
                this.__amvpDimInfo := KS_AMVPDIMINFO(this.ptr + 8)
            return this.__amvpDimInfo
        }
    }

    /**
     * @type {Integer}
     */
    dwPictAspectRatioX {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    dwPictAspectRatioY {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * @type {BOOL}
     */
    bEnableDoubleClock{
        get {
            if(!this.HasProp("__bEnableDoubleClock"))
                this.__bEnableDoubleClock := BOOL(this.ptr + 48)
            return this.__bEnableDoubleClock
        }
    }

    /**
     * @type {BOOL}
     */
    bEnableVACT{
        get {
            if(!this.HasProp("__bEnableVACT"))
                this.__bEnableVACT := BOOL(this.ptr + 52)
            return this.__bEnableVACT
        }
    }

    /**
     * @type {BOOL}
     */
    bDataIsInterlaced{
        get {
            if(!this.HasProp("__bDataIsInterlaced"))
                this.__bDataIsInterlaced := BOOL(this.ptr + 56)
            return this.__bDataIsInterlaced
        }
    }

    /**
     * @type {Integer}
     */
    lHalfLinesOdd {
        get => NumGet(this, 60, "int")
        set => NumPut("int", value, this, 60)
    }

    /**
     * @type {BOOL}
     */
    bFieldPolarityInverted{
        get {
            if(!this.HasProp("__bFieldPolarityInverted"))
                this.__bFieldPolarityInverted := BOOL(this.ptr + 64)
            return this.__bFieldPolarityInverted
        }
    }

    /**
     * @type {Integer}
     */
    dwNumLinesInVREF {
        get => NumGet(this, 68, "uint")
        set => NumPut("uint", value, this, 68)
    }

    /**
     * @type {Integer}
     */
    lHalfLinesEven {
        get => NumGet(this, 72, "int")
        set => NumPut("int", value, this, 72)
    }

    /**
     * @type {Integer}
     */
    dwReserved1 {
        get => NumGet(this, 76, "uint")
        set => NumPut("uint", value, this, 76)
    }
}
