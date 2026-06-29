#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * The DD_GETDRIVERINFODATA structure is used to pass data to and from the DdGetDriverInfo callback routine.
 * @remarks
 * The data structure passed to the driver for a <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_getdriverinfo">DdGetDriverInfo</a> call has minor differences between Windows 98/Me and Windows 2000 and later. On Windows 2000 and later the data structure is called DD_GETDRIVERINFODATA and on Windows 98/Me the data structure is called DDHAL_GETDRIVERINFODATA. Both data structures include a field for driver specific context information. On Windows 2000 and later, DD_GETDRIVERINFODATA includes a field <b>dhpdev</b> that stores the DHPDEV of the driver being called. Only on Windows 98/Me, DDHAL_GETDRIVERINFODATA includes a field <b>dwContext</b> that is copied for the driver reserved <b>dwReserved3</b> field of the DirectDraw global object.
 * @see https://learn.microsoft.com/windows/win32/api/ddrawint/ns-ddrawint-dd_getdriverinfodata
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DD_GETDRIVERINFODATA {
    #StructPack 8

    /**
     * Handle to the driver's <a href="https://docs.microsoft.com/windows-hardware/drivers/display/pdev-negotiation">PDEV</a>. Microsoft Windows 2000 and later only.
     */
    dhpdev : IntPtr

    /**
     * Specifies the size in bytes of this DD_GETDRIVERINFODATA structure.
     */
    dwSize : UInt32

    /**
     * Currently unused and is set to zero.
     */
    dwFlags : UInt32

    guidInfo : Guid

    /**
     * Specifies the number of bytes of data that DirectDraw expects the driver to pass back in the buffer to which <b>lpvData</b> points.
     */
    dwExpectedSize : UInt32

    /**
     * Points to a DirectDraw-allocated buffer into which the driver copies the requested data. This buffer is typically <b>dwExpectedSize</b> bytes in size. The driver must not write more than <b>dwExpectedSize</b> bytes of data in it. The driver specifies the number of bytes that it writes to this buffer in the <b>dwActualSize</b> member.
     */
    lpvData : IntPtr

    /**
     * Specifies the location in which the driver returns the number of bytes of data it writes in <b>lpvData</b>.
     */
    dwActualSize : UInt32

    /**
     * Specifies the location in which the driver writes the return value of the <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_getdriverinfo">DdGetDriverInfo</a> callback. A return code of DD_OK indicates success. For more information, see <a href="https://docs.microsoft.com/windows-hardware/drivers/display/return-values-for-directdraw">Return Values for DirectDraw</a>.
     */
    ddRVal : HRESULT

}
