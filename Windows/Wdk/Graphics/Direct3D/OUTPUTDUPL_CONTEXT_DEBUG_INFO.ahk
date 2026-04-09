#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\OUTPUTDUPL_CONTEXT_DEBUG_STATUS.ahk
#Include ..\..\..\Win32\Foundation\HANDLE.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class OUTPUTDUPL_CONTEXT_DEBUG_INFO extends Win32Struct {
    static sizeof => 56

    static packingSize => 8

    /**
     * @type {OUTPUTDUPL_CONTEXT_DEBUG_STATUS}
     */
    Status {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {HANDLE}
     */
    ProcessID {
        get {
            if(!this.HasProp("__ProcessID"))
                this.__ProcessID := HANDLE(8, this)
            return this.__ProcessID
        }
    }

    /**
     * @type {Integer}
     */
    AccumulatedPresents {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    LastPresentTime {
        get => NumGet(this, 24, "int64")
        set => NumPut("int64", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    LastMouseTime {
        get => NumGet(this, 32, "int64")
        set => NumPut("int64", value, this, 32)
    }

    /**
     * @type {String}
     */
    ProcessName {
        get => StrGet(this.ptr + 40, 15, "UTF-8")
        set => StrPut(value, this.ptr + 40, 15, "UTF-8")
    }
}
