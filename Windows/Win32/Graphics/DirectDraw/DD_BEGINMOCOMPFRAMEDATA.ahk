#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DDHAL_BEGINMOCOMPFRAMEDATA structure contains the frame information required to start decoding.
 * @see https://learn.microsoft.com/windows/win32/api/ddrawint/ns-ddrawint-dd_beginmocompframedata
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class DD_BEGINMOCOMPFRAMEDATA extends Win32Struct
{
    static sizeof => 64

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
     * Points to a <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_motioncomp_local">DD_MOTIONCOMP_LOCAL</a> structure that contains a description of the motion compensation being requested.
     * @type {Pointer<DD_MOTIONCOMP_LOCAL>}
     */
    lpMoComp {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Points to a <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_surface_local">DD_SURFACE_LOCAL</a> structure representing the destination surface in which to decode this frame.
     * @type {Pointer<DD_SURFACE_LOCAL>}
     */
    lpDestSurface {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Indicates the size in bytes of optional input data in <b>lpInputData</b> that is required to begin this frame.
     * @type {Integer}
     */
    dwInputDataSize {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Points to an optional input buffer, the contents of which are defined by the GUID. This buffer cannot contain any embedded pointers.
     * @type {Pointer<Void>}
     */
    lpInputData {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Indicates the size in bytes of optional output data in <b>lpOutputData</b> that is required to begin this frame.
     * @type {Integer}
     */
    dwOutputDataSize {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * Points to an optional output buffer, the contents of which are defined by the GUID. This buffer cannot contain any embedded pointers.
     * @type {Pointer<Void>}
     */
    lpOutputData {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * Specifies the location in which the driver writes the return value of the <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_mocompcb_beginframe">DdMoCompBeginFrame</a> callback. A return code of DD_OK indicates success. For more information, see <a href="https://docs.microsoft.com/windows-hardware/drivers/display/return-values-for-directdraw">Return Values for DirectDraw</a>.
     * @type {HRESULT}
     */
    ddRVal {
        get => NumGet(this, 56, "int")
        set => NumPut("int", value, this, 56)
    }
}
