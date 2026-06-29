#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * The DD_STEREOMODE structure is used by the runtime with GUID_DDStereoMode in a DdGetDriverInfo call to query whether the driver supports stereo for a given video display mode.
 * @remarks
 * To check each display mode to see if the driver supports stereo with that mode, the runtime calls the driver's <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_getdriverinfo">DdGetDriverInfo</a> function. In this call, the runtime specifies GUID_DDStereoMode in the <b>guidInfo</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_getdriverinfodata">DD_GETDRIVERINFODATA</a> structure to which the <i>lpGetDriverInfo</i> parameter points. The runtime also provides a pointer to a DD_STEREOMODE structure in the <b>lpvData</b> member of DD_GETDRIVERINFODATA. The driver returns DD_OK if it supports GUID_DDStereoMode and sets the <b>bSupported</b> member of DD_STEREOMODE to <b>TRUE</b> if it supports stereo with the specified display mode.
 * 
 * GUID_DDStereoMode provides a way to turn OFF stereo per-mode, since it is expected that a driver that can do stereo can do stereo in any mode.
 * @see https://learn.microsoft.com/windows/win32/api/ddrawint/ns-ddrawint-dd_stereomode
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DD_STEREOMODE {
    #StructPack 4

    /**
     * Specifies the size in bytes of the DD_STEREOMODE structure.
     */
    dwSize : UInt32

    /**
     * Specifies the height in scan lines of the display mode. Has the value D3DGDI2_MAGIC if this structure is, in fact, a <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/d3dhal/ns-d3dhal-_dd_getdriverinfo2data">DD_GETDRIVERINFO2DATA</a> call.
     */
    dwHeight : UInt32

    /**
     * Specifies the width in pixels of the display mode.
     */
    dwWidth : UInt32

    /**
     * Specifies the bits per pixel of the display mode.
     */
    dwBpp : UInt32

    /**
     * Specifies the refresh rate in hertz of the display mode.
     */
    dwRefreshRate : UInt32

    /**
     * Driver sets to <b>TRUE</b> if stereo is supported with the specified display mode, or <b>FALSE</b> otherwise.
     */
    bSupported : BOOL

}
