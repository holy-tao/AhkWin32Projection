#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * MOUSE_UNIT_ID_PARAMETER specifies a unit ID that Mouclass assigns to a mouse.
 * @remarks
 * 
 * Although this structure is used with an <a href="https://docs.microsoft.com/windows/desktop/api/ntddmou/ni-ntddmou-ioctl_mouse_query_attributes">IOCTL_MOUSE_QUERY_ATTRIBUTES</a> request, Mouclass does not use the <b>UnitId</b> value.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//ntddmou/ns-ntddmou-mouse_unit_id_parameter
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 * @version v4.0.30319
 */
class MOUSE_UNIT_ID_PARAMETER extends Win32Struct
{
    static sizeof => 2

    static packingSize => 2

    /**
     * Specifies the unit number of the mouse device. A mouse <a href="https://docs.microsoft.com/windows-hardware/drivers/kernel/nt-device-names">device name</a> has the format \Device\PointerPort<i>N</i>, where the suffix <i>N </i>is the unit number of the device. For example, a device, whose name is \Device\PointerPort0, has a unit number of zero, and a device, whose name is \Device\PointerPort1, has a unit number of one.
     * @type {Integer}
     */
    UnitId {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }
}
