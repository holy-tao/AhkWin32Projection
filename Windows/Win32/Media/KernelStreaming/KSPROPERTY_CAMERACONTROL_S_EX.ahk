#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\KSIDENTIFIER.ahk
#Include ..\..\Foundation\RECT.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KSPROPERTY_CAMERACONTROL_S_EX extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * @type {KSIDENTIFIER}
     */
    Property{
        get {
            if(!this.HasProp("__Property"))
                this.__Property := KSIDENTIFIER(0, this)
            return this.__Property
        }
    }

    /**
     * @type {Integer}
     */
    Value {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {Integer}
     */
    Capabilities {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {RECT}
     */
    FocusRect{
        get {
            if(!this.HasProp("__FocusRect"))
                this.__FocusRect := RECT(32, this)
            return this.__FocusRect
        }
    }
}
