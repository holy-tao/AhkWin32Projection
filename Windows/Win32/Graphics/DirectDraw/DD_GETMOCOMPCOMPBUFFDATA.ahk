#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DDPIXELFORMAT.ahk

/**
 * The DD_GETMOCOMPCOMPBUFFDATA structure contains the compressed buffer information.
 * @see https://learn.microsoft.com/windows/win32/api/ddrawint/ns-ddrawint-dd_getmocompcompbuffdata
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class DD_GETMOCOMPCOMPBUFFDATA extends Win32Struct
{
    static sizeof => 80

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
     * Points to a GUID for which the compressed buffer information is requested.
     * @type {Pointer<Guid>}
     */
    lpGuid {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Indicates the width in pixels of the uncompressed output frame.
     * @type {Integer}
     */
    dwWidth {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Indicates the height in pixels of the uncompressed output frame.
     * @type {Integer}
     */
    dwHeight {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Points to a <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/ksmedia/ns-ksmedia-_ddpixelformat">DDPIXELFORMAT</a> structure that contains the pixel format of the uncompressed output frame.
     * @type {DDPIXELFORMAT}
     */
    ddPixelFormat{
        get {
            if(!this.HasProp("__ddPixelFormat"))
                this.__ddPixelFormat := DDPIXELFORMAT(this.ptr + 24)
            return this.__ddPixelFormat
        }
    }

    /**
     * Indicates how many different types of surfaces the driver requires to perform motion compensation using the requested GUID.
     * @type {Integer}
     */
    dwNumTypesCompBuffs {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * Points to a <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-ddcompbufferinfo">DDCOMPBUFFERINFO</a> structure that contains the driver-supplied information for each type of required surface.
     * @type {Pointer<DDCOMPBUFFERINFO>}
     */
    lpCompBuffInfo {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * Specifies the location in which the driver writes the return value of the <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_mocompcb_getcompbuffinfo">DdMoCompGetBuffInfo</a> callback. A return code of DD_OK indicates success. For more information, see <a href="https://docs.microsoft.com/windows-hardware/drivers/display/return-values-for-directdraw">Return Values for DirectDraw</a>.
     * @type {Integer}
     */
    ddRVal {
        get => NumGet(this, 72, "int")
        set => NumPut("int", value, this, 72)
    }
}
