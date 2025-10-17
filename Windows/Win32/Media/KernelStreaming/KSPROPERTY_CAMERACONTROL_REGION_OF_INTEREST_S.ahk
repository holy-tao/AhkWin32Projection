#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\RECT.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KSPROPERTY_CAMERACONTROL_REGION_OF_INTEREST_S extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {RECT}
     */
    FocusRect{
        get {
            if(!this.HasProp("__FocusRect"))
                this.__FocusRect := RECT(0, this)
            return this.__FocusRect
        }
    }

    /**
     * @type {BOOL}
     */
    AutoFocusLock {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * @type {BOOL}
     */
    AutoExposureLock {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }

    /**
     * @type {BOOL}
     */
    AutoWhitebalanceLock {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    Capabilities {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * @type {Integer}
     */
    Configuration {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }
}
