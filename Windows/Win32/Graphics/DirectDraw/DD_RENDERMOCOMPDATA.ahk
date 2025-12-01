#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DD_RENDERMOCOMPDATA structure contains the information required to render a frame.
 * @see https://learn.microsoft.com/windows/win32/api/ddrawint/ns-ddrawint-dd_rendermocompdata
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class DD_RENDERMOCOMPDATA extends Win32Struct
{
    static sizeof => 72

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
     * Points to a <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_motioncomp_local">DD_MOTIONCOMP_LOCAL</a> structure that contains a description of the motion compensation being requested.
     * @type {Pointer<DD_MOTIONCOMP_LOCAL>}
     */
    lpMoComp {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Indicates the number of entries in the <b>lpBufferInfo</b> member.
     * @type {Integer}
     */
    dwNumBuffers {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Points to a <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-ddmocompbufferinfo">DDMOCOMPBUFFERINFO</a> structure that contains the surfaces and the locations within the surfaces from which to get the macroblock data to render.
     * @type {Pointer<DDMOCOMPBUFFERINFO>}
     */
    lpBufferInfo {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Indicates a specific operation the decoder would like the driver to perform. The possible values for this member are defined by the GUID used during motion compensation. See <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_createmocompdata">DD_CREATEMOCOMPDATA</a> for more information.
     * @type {Integer}
     */
    dwFunction {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Points to an optional input buffer, the contents of which are defined by the GUID. This buffer cannot contain any embedded pointers.
     * @type {Pointer<Void>}
     */
    lpInputData {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * Specifies the size in bytes of the data pointed to by <b>lpInputData</b>.
     * @type {Integer}
     */
    dwInputDataSize {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * Points to an optional output buffer, the contents of which are defined by the GUID. This buffer cannot contain any embedded pointers.
     * @type {Pointer<Void>}
     */
    lpOutputData {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * Specifies the size in bytes of the data pointed to by <b>lpOutputData</b>.
     * @type {Integer}
     */
    dwOutputDataSize {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * Specifies the location in which the driver writes the return value of the <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_mocompcb_render">DdMoCompRender</a> callback. A return code of DD_OK indicates success. For more information, see <a href="https://docs.microsoft.com/windows-hardware/drivers/display/return-values-for-directdraw">Return Values for DirectDraw</a>.
     * @type {HRESULT}
     */
    ddRVal {
        get => NumGet(this, 68, "int")
        set => NumPut("int", value, this, 68)
    }
}
