#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\RID_DEVICE_INFO_TYPE.ahk" { RID_DEVICE_INFO_TYPE }
#Import ".\RID_DEVICE_INFO_MOUSE.ahk" { RID_DEVICE_INFO_MOUSE }
#Import ".\RID_DEVICE_INFO_HID.ahk" { RID_DEVICE_INFO_HID }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\RID_DEVICE_INFO_KEYBOARD.ahk" { RID_DEVICE_INFO_KEYBOARD }

/**
 * Defines the raw input data coming from any device.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/ns-winuser-rid_device_info
 * @namespace Windows.Win32.UI.Input
 */
export default struct RID_DEVICE_INFO {
    #StructPack 4

    /**
     * Type: <b>DWORD</b>
     * 
     * The size, in bytes, of the <b>RID_DEVICE_INFO</b> structure.
     */
    cbSize : UInt32 := this.Size

    /**
     * Type: <b>DWORD</b>
     */
    dwType : RID_DEVICE_INFO_TYPE

    mouse : RID_DEVICE_INFO_MOUSE

    static __New() {
        DefineProp(this.Prototype, 'keyboard', { type: RID_DEVICE_INFO_KEYBOARD, offset: 8 })
        DefineProp(this.Prototype, 'hid', { type: RID_DEVICE_INFO_HID, offset: 8 })
        this.DeleteProp("__New")
    }
}
