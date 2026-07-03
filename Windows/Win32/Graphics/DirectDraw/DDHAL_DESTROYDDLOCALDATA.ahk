#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\DDRAWI_DIRECTDRAW_LCL.ahk" { DDRAWI_DIRECTDRAW_LCL }

/**
 * DDHAL_DESTROYDDLOCALDATA contains the information required for the driver to destroy a set of surfaces associated to a given local DirectDraw object.
 * @see https://learn.microsoft.com/windows/win32/api/ddrawi/ns-ddrawi-ddhal_destroyddlocaldata
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DDHAL_DESTROYDDLOCALDATA {
    #StructPack 8

    /**
     * Unused.
     */
    dwFlags : UInt32

    /**
     * Points to the local Direct Draw object that serves as a reference for all Direct3D surfaces that have to be destroyed.
     */
    pDDLcl : DDRAWI_DIRECTDRAW_LCL.Ptr

    /**
     * Specifies the location where the driver writes the return value of <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_destroyddlocal">D3dDestroyDDLocal</a>. A return code of D3D_OK indicates success. For more information, see <a href="https://docs.microsoft.com/windows-hardware/drivers/display/return-codes-for-direct3d-driver-callbacks">Return Codes for Direct3D Driver Callbacks</a>.
     */
    ddRVal : HRESULT

}
