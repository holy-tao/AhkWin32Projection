#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DD_GETDRIVERINFODATA structure is used to pass data to and from the DdGetDriverInfo callback routine.
 * @remarks
 * The data structure passed to the driver for a <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_getdriverinfo">DdGetDriverInfo</a> call has minor differences between Windows 98/Me and Windows 2000 and later. On Windows 2000 and later the data structure is called DD_GETDRIVERINFODATA and on Windows 98/Me the data structure is called DDHAL_GETDRIVERINFODATA. Both data structures include a field for driver specific context information. On Windows 2000 and later, DD_GETDRIVERINFODATA includes a field <b>dhpdev</b> that stores the DHPDEV of the driver being called. Only on Windows 98/Me, DDHAL_GETDRIVERINFODATA includes a field <b>dwContext</b> that is copied for the driver reserved <b>dwReserved3</b> field of the DirectDraw global object.
 * @see https://learn.microsoft.com/windows/win32/api/ddrawint/ns-ddrawint-dd_getdriverinfodata
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class DD_GETDRIVERINFODATA extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * Handle to the driver's <a href="https://docs.microsoft.com/windows-hardware/drivers/display/pdev-negotiation">PDEV</a>. Microsoft Windows 2000 and later only.
     * @type {Pointer<Void>}
     */
    dhpdev {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Specifies the size in bytes of this DD_GETDRIVERINFODATA structure.
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Currently unused and is set to zero.
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * 
     * @type {Pointer<Guid>}
     */
    guidInfo {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Specifies the number of bytes of data that DirectDraw expects the driver to pass back in the buffer to which <b>lpvData</b> points.
     * @type {Integer}
     */
    dwExpectedSize {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Points to a DirectDraw-allocated buffer into which the driver copies the requested data. This buffer is typically <b>dwExpectedSize</b> bytes in size. The driver must not write more than <b>dwExpectedSize</b> bytes of data in it. The driver specifies the number of bytes that it writes to this buffer in the <b>dwActualSize</b> member.
     * @type {Pointer<Void>}
     */
    lpvData {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Specifies the location in which the driver returns the number of bytes of data it writes in <b>lpvData</b>.
     * @type {Integer}
     */
    dwActualSize {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * Specifies the location in which the driver writes the return value of the <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_getdriverinfo">DdGetDriverInfo</a> callback. A return code of DD_OK indicates success. For more information, see <a href="https://docs.microsoft.com/windows-hardware/drivers/display/return-values-for-directdraw">Return Values for DirectDraw</a>.
     * @type {Integer}
     */
    ddRVal {
        get => NumGet(this, 44, "int")
        set => NumPut("int", value, this, 44)
    }
}
