#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DDPIXELFORMAT.ahk

/**
 * The DD_CREATEMOCOMPDATA structure contains the data required to begin using motion compensation.
 * @see https://learn.microsoft.com/windows/win32/api/ddrawint/ns-ddrawint-dd_createmocompdata
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class DD_CREATEMOCOMPDATA extends Win32Struct
{
    static sizeof => 80

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
     * Points to a <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_motioncomp_local">DD_MOTIONCOMP_LOCAL</a> structure that contains a description of the motion compensation object.
     * @type {Pointer<DD_MOTIONCOMP_LOCAL>}
     */
    lpMoComp {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Points to a GUID that describes the motion compensation process being used.
     * @type {Pointer<Guid>}
     */
    lpGuid {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Specifies the width in pixels of the uncompressed output frame.
     * @type {Integer}
     */
    dwUncompWidth {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Specifies the height in pixels of the uncompressed output frame.
     * @type {Integer}
     */
    dwUncompHeight {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * Points to a <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/ksmedia/ns-ksmedia-_ddpixelformat">DDPIXELFORMAT</a> structure that contains the format of the uncompressed output frame.
     * @type {DDPIXELFORMAT}
     */
    ddUncompPixelFormat{
        get {
            if(!this.HasProp("__ddUncompPixelFormat"))
                this.__ddUncompPixelFormat := DDPIXELFORMAT(this.ptr + 32)
            return this.__ddUncompPixelFormat
        }
    }

    /**
     * Points to an optional data buffer that contains any optional information required by the GUID given in <b>lpGuid</b>. This buffer cannot contain any embedded pointers.
     * @type {Pointer<Void>}
     */
    lpData {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * Indicates the size in bytes of the data buffer contained in <b>lpData</b>.
     * @type {Integer}
     */
    dwDataSize {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * Specifies the location in which the driver writes the return value of the <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_mocompcb_create">DdMoCompCreate</a> callback. A return code of DD_OK indicates success. For more information, see <a href="https://docs.microsoft.com/windows-hardware/drivers/display/return-values-for-directdraw">Return Values for DirectDraw</a>.
     * @type {Integer}
     */
    ddRVal {
        get => NumGet(this, 76, "int")
        set => NumPut("int", value, this, 76)
    }
}
