#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\POINTER_DEVICE_TYPE.ahk" { POINTER_DEVICE_TYPE }
#Import "..\..\..\Graphics\Gdi\HMONITOR.ahk" { HMONITOR }
#Import "..\..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * Contains information about a pointer device. An array of these structures is returned from the GetPointerDevices function. A single structure is returned from a call to the GetPointerDevice function.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/ns-winuser-pointer_device_info
 * @namespace Windows.Win32.UI.Input.Pointer
 */
export default struct POINTER_DEVICE_INFO {
    #StructPack 8

    /**
     * One of the values from <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ne-wingdi-displayconfig_rotation">DISPLAYCONFIG_ROTATION</a>, which identifies the orientation of the input digitizer.
     * 
     * <div class="alert"><b>Note</b>  This value is 0 when the source of input is <a href="https://docs.microsoft.com/previous-versions/windows/desktop/input_touchinjection/touch-injection-portal">Touch Injection</a>.</div>
     * <div> </div>
     */
    displayOrientation : UInt32

    /**
     * The handle to the pointer device.
     */
    device : HANDLE

    /**
     * The device type.
     */
    pointerDeviceType : POINTER_DEVICE_TYPE

    /**
     * The HMONITOR for the display that the device is mapped to. This is not necessarily the monitor that the pointer device is physically connected to.
     */
    monitor : HMONITOR

    /**
     * The lowest ID that's assigned to the device.
     */
    startingCursorId : UInt32

    /**
     * The number of supported simultaneous contacts.
     */
    maxActiveContacts : UInt16

    /**
     * The string that identifies the product.
     */
    productString : WCHAR[520]

}
