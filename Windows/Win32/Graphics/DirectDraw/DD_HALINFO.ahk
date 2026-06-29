#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\VIDEOMEMORYINFO.ahk" { VIDEOMEMORYINFO }
#Import ".\DDSCAPS.ahk" { DDSCAPS }
#Import ".\DD_D3DBUFCALLBACKS.ahk" { DD_D3DBUFCALLBACKS }
#Import ".\DDPIXELFORMAT.ahk" { DDPIXELFORMAT }
#Import ".\DDNTCORECAPS.ahk" { DDNTCORECAPS }

/**
 * The DD_HALINFO structure describes the capabilities of the hardware and driver.
 * @remarks
 * GDI allocates and zero-initializes the DD_HALINFO structure and passes it to the driver's <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-drvgetdirectdrawinfo">DrvGetDirectDrawInfo</a> routine to be initialized with driver-specific data.
 * @see https://learn.microsoft.com/windows/win32/api/ddrawint/ns-ddrawint-dd_halinfo
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DD_HALINFO {
    #StructPack 8

    /**
     * Specifies the size in bytes of this DD_HALINFO structure.
     */
    dwSize : UInt32

    /**
     * Specifies a <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-videomemoryinfo">VIDEOMEMORYINFO</a> structure that describes the display's memory.
     */
    vmiData : VIDEOMEMORYINFO

    /**
     * Specifies a <b>DDNTCORECAPS</b> structure that contains driver-specific capabilities.
     */
    ddCaps : DDNTCORECAPS

    /**
     * Points to the driver's <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_getdriverinfo">DdGetDriverInfo</a> function. This function is called to get further Microsoft DirectDraw driver information. This member can be <b>NULL</b>.
     */
    GetDriverInfo : IntPtr

    dwFlags : UInt32

    /**
     * Points to a <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/d3dhal/ns-d3dhal-_d3dhal_globaldriverdata">D3DHAL_GLOBALDRIVERDATA</a> structure that describes the 3D capabilities of the driver and its device.
     */
    lpD3DGlobalDriverData : IntPtr

    /**
     * Points to the driver's initialized <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/d3dhal/ns-d3dhal-_d3dhal_callbacks">D3DHAL_CALLBACKS</a> structure.
     */
    lpD3DHALCallbacks : IntPtr

    /**
     * Used only by drivers that want to implement driver level vertex and command buffer allocation. This is usually done for performance reasons. The <b>lpD3DBufCallbacks</b> member is a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_d3dbufcallbacks">DD_D3DBUFCALLBACKS</a> structure that the driver fills out with the callbacks used to support driver managed vertex and command buffers. This member should normally be ignored by the driver.
     */
    lpD3DBufCallbacks : DD_D3DBUFCALLBACKS.Ptr

}
