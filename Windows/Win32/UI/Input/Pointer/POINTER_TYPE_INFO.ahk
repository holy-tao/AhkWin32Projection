#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\HANDLE.ahk
#Include ..\..\..\Foundation\HWND.ahk
#Include ..\..\..\Foundation\POINT.ahk
#Include .\POINTER_INFO.ahk
#Include ..\..\..\Foundation\RECT.ahk
#Include .\POINTER_TOUCH_INFO.ahk
#Include .\POINTER_PEN_INFO.ahk

/**
 * Contains information about the pointer input type.
 * @see https://docs.microsoft.com/windows/win32/api//winuser/ns-winuser-pointer_type_info
 * @namespace Windows.Win32.UI.Input.Pointer
 * @version v4.0.30319
 */
class POINTER_TYPE_INFO extends Win32Struct
{
    static sizeof => 152

    static packingSize => 8

    /**
     * The pointer input device.
     * @type {Integer}
     */
    type {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {POINTER_INFO}
     */
    pointerInfo{
        get {
            if(!this.HasProp("__pointerInfo"))
                this.__pointerInfo := POINTER_INFO(8, this)
            return this.__pointerInfo
        }
    }

    /**
     * @type {POINTER_TOUCH_INFO}
     */
    touchInfo{
        get {
            if(!this.HasProp("__touchInfo"))
                this.__touchInfo := POINTER_TOUCH_INFO(8, this)
            return this.__touchInfo
        }
    }

    /**
     * @type {POINTER_PEN_INFO}
     */
    penInfo{
        get {
            if(!this.HasProp("__penInfo"))
                this.__penInfo := POINTER_PEN_INFO(8, this)
            return this.__penInfo
        }
    }
}
