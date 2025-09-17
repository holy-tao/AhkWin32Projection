#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DD_GETMOCOMPFORMATSDATA structure contains the uncompressed format information.
 * @see https://learn.microsoft.com/windows/win32/api/ddrawint/ns-ddrawint-dd_getmocompformatsdata
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class DD_GETMOCOMPFORMATSDATA extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * Points to a <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_directdraw_local">DD_DIRECTDRAW_LOCAL</a> structure that is relevant to the current Microsoft DirectDraw process only.
     * @type {Pointer<TypeHandle>}
     */
    lpDD {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Points to a GUID that describes the uncompressed formats being requested.
     * @type {Pointer<Guid>}
     */
    lpGuid {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Indicates the number of uncompressed formats supported for the specified GUID.
     * @type {Integer}
     */
    dwNumFormats {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Points to a <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/ksmedia/ns-ksmedia-_ddpixelformat">DDPIXELFORMAT</a> structure that contains the motion compensation pixel format. If this member is not <b>NULL</b>, the uncompressed formats are copied into the buffer pointed to by this member.
     * @type {Pointer<DDPIXELFORMAT>}
     */
    lpFormats {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Specifies the location in which the driver writes the return value of the <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_mocompcb_getformats">DdMoCompGetFormats</a> callback. A return code of DD_OK indicates success. For more information, see <a href="https://docs.microsoft.com/windows-hardware/drivers/display/return-values-for-directdraw">Return Values for DirectDraw</a>.
     * @type {Integer}
     */
    ddRVal {
        get => NumGet(this, 32, "int")
        set => NumPut("int", value, this, 32)
    }
}
