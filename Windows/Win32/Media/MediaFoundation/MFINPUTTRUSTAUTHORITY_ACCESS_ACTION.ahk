#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes an action requested by an output trust authority (OTA). The request is sent to an input trust authority (ITA).
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/ns-mfidl-mfinputtrustauthority_access_action
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MFINPUTTRUSTAUTHORITY_ACCESS_ACTION extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Specifies the action as a member of the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/ne-mfidl-mfpolicymanager_action">MFPOLICYMANAGER_ACTION</a> enumeration.
     * @type {Integer}
     */
    Action {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Pointer to a buffer that contains a ticket object, provided by the OTA.
     * @type {Pointer<Integer>}
     */
    pbTicket {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Size of the ticket object, in bytes.
     * @type {Integer}
     */
    cbTicket {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
