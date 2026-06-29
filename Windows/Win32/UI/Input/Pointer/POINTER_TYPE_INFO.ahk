#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\POINTER_INFO.ahk" { POINTER_INFO }
#Import ".\POINTER_PEN_INFO.ahk" { POINTER_PEN_INFO }
#Import "..\..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\..\Foundation\POINT.ahk" { POINT }
#Import "..\..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\POINTER_FLAGS.ahk" { POINTER_FLAGS }
#Import "..\..\WindowsAndMessaging\POINTER_INPUT_TYPE.ahk" { POINTER_INPUT_TYPE }
#Import ".\POINTER_BUTTON_CHANGE_TYPE.ahk" { POINTER_BUTTON_CHANGE_TYPE }
#Import ".\POINTER_TOUCH_INFO.ahk" { POINTER_TOUCH_INFO }
#Import "..\..\..\Foundation\RECT.ahk" { RECT }

/**
 * Contains information about the pointer input type.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/ns-winuser-pointer_type_info
 * @namespace Windows.Win32.UI.Input.Pointer
 */
export default struct POINTER_TYPE_INFO {
    #StructPack 8

    /**
     * The pointer input device.
     */
    type : POINTER_INPUT_TYPE

    pointerInfo : POINTER_INFO

    static __New() {
        DefineProp(this.Prototype, 'touchInfo', { type: POINTER_TOUCH_INFO, offset: 8 })
        DefineProp(this.Prototype, 'penInfo', { type: POINTER_PEN_INFO, offset: 8 })
        this.DeleteProp("__New")
    }
}
