#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Graphics\Gdi\HMONITOR.ahk
#Include .\SYNTHETIC_DEVICE_CREATION_OPTIONS.ahk
#Include ..\Input\Pointer\POINTER_FEEDBACK_MODE.ahk
#Include ..\WindowsAndMessaging\POINTER_INPUT_TYPE.ahk

/**
 * @namespace Windows.Win32.UI.Controls
 */
class SYNTHETIC_DEVICE_CREATION_PARAMS extends Win32Struct {
    static sizeof => 40

    static packingSize => 8

    /**
     * @type {POINTER_INPUT_TYPE}
     */
    pointerType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    maxCount {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {POINTER_FEEDBACK_MODE}
     */
    feedbackMode {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * @type {HMONITOR}
     */
    hMonitor {
        get {
            if(!this.HasProp("__hMonitor"))
                this.__hMonitor := HMONITOR(16, this)
            return this.__hMonitor
        }
    }

    /**
     * @type {Integer}
     */
    deviceWidth {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    deviceHeight {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * @type {SYNTHETIC_DEVICE_CREATION_OPTIONS}
     */
    options {
        get => NumGet(this, 32, "int")
        set => NumPut("int", value, this, 32)
    }
}
