#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DD_GETMOCOMPGUIDSDATA structure contains the motion compensation GUID information.
 * @see https://learn.microsoft.com/windows/win32/api/ddrawint/ns-ddrawint-dd_getmocompguidsdata
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class DD_GETMOCOMPGUIDSDATA extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Points to a <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_directdraw_local">DD_DIRECTDRAW_LOCAL</a> structure that is relevant to the current Microsoft DirectDraw process only.
     * @type {Pointer<DD_DIRECTDRAW_LOCAL>}
     */
    lpDD {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Indicates the number of motion compensation GUIDs in <b>lpGuids</b>.
     * @type {Integer}
     */
    dwNumGuids {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Points to a list of GUIDs that describe the motion compensation processes being used. If <b>lpGuids</b> is <b>NULL</b>, the driver should set <b>dwNumGuids</b> to the number of GUIDs that it supports. Otherwise, it should fill <b>lpGuids</b> with the GUIDs that it supports and set the number in <b>dwNumGuids</b>.
     * @type {Pointer<Guid>}
     */
    lpGuids {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Specifies the location in which the driver writes the return value of the <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_mocompcb_getguids">DdMoCompGetGuids</a> callback. A return code of DD_OK indicates success. For more information, see <a href="https://docs.microsoft.com/windows-hardware/drivers/display/return-values-for-directdraw">Return Values for DirectDraw</a>.
     * @type {Integer}
     */
    ddRVal {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }
}
