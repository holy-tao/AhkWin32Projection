#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The DD_NONLOCALVIDMEMCAPS structure contains the capabilities for nonlocal display memory.
 * @remarks
 * On Microsoft Windows 2000 and later versions, the data structure is called DD_NONLOCALVIDMEMCAPS and on Windows 98/Me the data structure is called DDNONLOCALVIDMEMCAPS.
 * 
 * Normally, the <b>dwNLVBCaps</b>, <b>dwNLVBCaps2</b>, <b>dwNFLBCKeyCaps</b>, <b>dwNLVBFXCaps</b>, and <b>dwNLVBRops</b> members contain a subset of the flags used in the <a href="https://docs.microsoft.com/windows/desktop/api/ddrawi/ns-ddrawi-ddcorecaps">DDCORECAPS</a> structure that is relevant to nonlocal-to-local blitting. However, to allow flexibility for device driver writers, any of the flags in DDCORECAPS can be used.
 * @see https://learn.microsoft.com/windows/win32/api/ddrawint/ns-ddrawint-dd_nonlocalvidmemcaps
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DD_NONLOCALVIDMEMCAPS {
    #StructPack 4

    /**
     * Specifies the size in bytes of this DD_NONLOCALVIDMEMCAPS structure.
     */
    dwSize : UInt32

    /**
     * Contains the driver-specific capabilities for nonlocal-to-local display memory blits. See the Remarks section for more information.
     */
    dwNLVBCaps : UInt32

    /**
     * Contains more of the driver-specific capabilities for nonlocal-to-local display memory blits. See the Remarks section for more information.
     */
    dwNLVBCaps2 : UInt32

    /**
     * Contains driver color key capabilities for nonlocal-to-local display memory blits. See the Remarks section for more information.
     */
    dwNLVBCKeyCaps : UInt32

    /**
     * Contains driver FX capabilities for nonlocal-to-local display memory blits. See the Remarks section for more information.
     */
    dwNLVBFXCaps : UInt32

    /**
     * Specifies an array of DD_ROP_SPACE DWORDs containing the raster operations supported for nonlocal-to-local blits. The constant DD_ROP_SPACE is defined in <i>ddraw.h</i>. See the Remarks section for more information.
     */
    dwNLVBRops : UInt32[8]

}
