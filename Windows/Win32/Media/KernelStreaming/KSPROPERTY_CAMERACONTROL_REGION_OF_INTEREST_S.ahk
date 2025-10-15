#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\RECT.ahk
#Include ..\..\Foundation\BOOL.ahk

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
                this.__FocusRect := RECT(this.ptr + 0)
            return this.__FocusRect
        }
    }

    /**
     * @type {BOOL}
     */
    AutoFocusLock{
        get {
            if(!this.HasProp("__AutoFocusLock"))
                this.__AutoFocusLock := BOOL(this.ptr + 16)
            return this.__AutoFocusLock
        }
    }

    /**
     * @type {BOOL}
     */
    AutoExposureLock{
        get {
            if(!this.HasProp("__AutoExposureLock"))
                this.__AutoExposureLock := BOOL(this.ptr + 20)
            return this.__AutoExposureLock
        }
    }

    /**
     * @type {BOOL}
     */
    AutoWhitebalanceLock{
        get {
            if(!this.HasProp("__AutoWhitebalanceLock"))
                this.__AutoWhitebalanceLock := BOOL(this.ptr + 24)
            return this.__AutoWhitebalanceLock
        }
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
