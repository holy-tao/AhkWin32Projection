#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\SIZE.ahk
#Include ..\..\Foundation\POINT.ahk
#Include ..\..\Foundation\HWND.ahk
#Include .\WINDOW_ACTION_MODIFIERS.ahk
#Include .\WINDOW_ACTION_KINDS.ahk
#Include ..\..\Foundation\RECT.ahk
#Include .\WINDOW_PLACEMENT_STATE.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 */
class WINDOW_ACTION extends Win32Struct {
    static sizeof => 96

    static packingSize => 8

    /**
     * @type {WINDOW_ACTION_KINDS}
     */
    kinds {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {WINDOW_ACTION_MODIFIERS}
     */
    modifiers {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * @type {BOOL}
     */
    visible {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * @type {POINT}
     */
    position {
        get {
            if(!this.HasProp("__position"))
                this.__position := POINT(12, this)
            return this.__position
        }
    }

    /**
     * @type {SIZE}
     */
    size {
        get {
            if(!this.HasProp("__size"))
                this.__size := SIZE(20, this)
            return this.__size
        }
    }

    /**
     * @type {HWND}
     */
    insertAfter {
        get {
            if(!this.HasProp("__insertAfter"))
                this.__insertAfter := HWND(32, this)
            return this.__insertAfter
        }
    }

    /**
     * @type {WINDOW_PLACEMENT_STATE}
     */
    placementState {
        get => NumGet(this, 40, "int")
        set => NumPut("int", value, this, 40)
    }

    /**
     * @type {RECT}
     */
    normalRect {
        get {
            if(!this.HasProp("__normalRect"))
                this.__normalRect := RECT(44, this)
            return this.__normalRect
        }
    }

    /**
     * @type {RECT}
     */
    workArea {
        get {
            if(!this.HasProp("__workArea"))
                this.__workArea := RECT(60, this)
            return this.__workArea
        }
    }

    /**
     * @type {Integer}
     */
    dpi {
        get => NumGet(this, 76, "uint")
        set => NumPut("uint", value, this, 76)
    }

    /**
     * @type {POINT}
     */
    pointOnMonitor {
        get {
            if(!this.HasProp("__pointOnMonitor"))
                this.__pointOnMonitor := POINT(80, this)
            return this.__pointOnMonitor
        }
    }

    /**
     * @type {Integer}
     */
    monitorTopologyId {
        get => NumGet(this, 88, "uint")
        set => NumPut("uint", value, this, 88)
    }
}
