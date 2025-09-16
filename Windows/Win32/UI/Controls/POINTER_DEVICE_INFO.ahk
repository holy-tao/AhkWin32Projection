#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information about a pointer device. An array of these structures is returned from the GetPointerDevices function. A single structure is returned from a call to the GetPointerDevice function.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/ns-winuser-pointer_device_info
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class POINTER_DEVICE_INFO extends Win32Struct
{
    static sizeof => 1080

    static packingSize => 8

    /**
     * One of the values from <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ne-wingdi-displayconfig_rotation">DISPLAYCONFIG_ROTATION</a>, which identifies the orientation of the input digitizer.
     * 
     * <div class="alert"><b>Note</b>  This value is 0 when the source of input is <a href="https://docs.microsoft.com/previous-versions/windows/desktop/input_touchinjection/touch-injection-portal">Touch Injection</a>.</div>
     * <div> </div>
     * @type {Integer}
     */
    displayOrientation {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The handle to the pointer device.
     * @type {Pointer<HANDLE>}
     */
    device {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The device type.
     * @type {Integer}
     */
    pointerDeviceType {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * The HMONITOR for the display that the device is mapped to. This is not necessarily the monitor that the pointer device is physically connected to.
     * @type {Pointer<HMONITOR>}
     */
    monitor {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * The lowest ID that's assigned to the device.
     * @type {Integer}
     */
    startingCursorId {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * The number of supported simultaneous contacts.
     * @type {Integer}
     */
    maxActiveContacts {
        get => NumGet(this, 36, "ushort")
        set => NumPut("ushort", value, this, 36)
    }

    /**
     * The string that identifies the product.
     * @type {String}
     */
    productString {
        get => StrGet(this.ptr + 38, 519, "UTF-16")
        set => StrPut(value, this.ptr + 38, 519, "UTF-16")
    }
}
