#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\SpiDevice.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Gets the SPI device with the specified settings.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.spi.provider.ispicontrollerprovider.getdeviceprovider
 * @namespace Windows.Devices.Spi
 * @version WindowsRuntime 1.4
 */
class ISpiController extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpiController
     * @type {Guid}
     */
    static IID => Guid("{a8d3c829-9895-4159-a934-8741f1ee6d27}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDevice"]

    /**
     * The GetDeviceCaps function retrieves device-specific information for the specified device.
     * @remarks
     * When <i>nIndex</i> is SHADEBLENDCAPS:
     * 
     * <ul>
     * <li>For a printer, <b>GetDeviceCaps</b> returns whatever the printer reports.</li>
     * <li>For a display device, all blending operations are available; besides SB_NONE, the only return values are SB_CONST_ALPHA and SB_PIXEL_ALPHA, which indicate whether these operations are accelerated.</li>
     * </ul>
     * On a multiple monitor system, if <i>hdc</i> is the desktop, <b>GetDeviceCaps</b> returns the capabilities of the primary monitor. If you want info for other monitors, you must use the <a href="https://docs.microsoft.com/windows/desktop/gdi/multiple-display-monitors-reference">multi-monitor APIs</a> or <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-createdca">CreateDC</a> to get a HDC for the device context (DC) of a specific monitor.  
     * 
     * <div class="alert"><b>Note</b>  Display1 is typically the primary monitor, but not always.</div>
     * <div> </div>
     * <b>GetDeviceCaps</b> provides the following six indexes in place of printer escapes.
     * 
     * <table>
     * <tr>
     * <th>Index</th>
     * <th>Printer escape replaced</th>
     * </tr>
     * <tr>
     * <td>PHYSICALWIDTH</td>
     * <td>GETPHYSPAGESIZE</td>
     * </tr>
     * <tr>
     * <td>PHYSICALHEIGHT</td>
     * <td>GETPHYSPAGESIZE</td>
     * </tr>
     * <tr>
     * <td>PHYSICALOFFSETX</td>
     * <td>GETPRINTINGOFFSET</td>
     * </tr>
     * <tr>
     * <td>PHYSICALOFFSETY</td>
     * <td>GETPHYSICALOFFSET</td>
     * </tr>
     * <tr>
     * <td>SCALINGFACTORX</td>
     * <td>GETSCALINGFACTOR</td>
     * </tr>
     * <tr>
     * <td>SCALINGFACTORY</td>
     * <td>GETSCALINGFACTOR</td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  <b>GetDeviceCaps</b> reports info that the display driver provides. If the display driver declines to report any info, <b>GetDeviceCaps</b> calculates the info based on fixed calculations. If the display driver reports invalid info, <b>GetDeviceCaps</b> returns the invalid info. Also, if the display driver declines to report info, <b>GetDeviceCaps</b> might calculate incorrect info because it assumes either fixed DPI (96 DPI) or a fixed size (depending on the info that the display driver did and didn’t provide). Unfortunately, a display driver that is implemented to the Windows Display Driver Model (WDDM) (introduced in Windows Vista) causes GDI to not get the info, so <b>GetDeviceCaps</b> must always calculate the info.</div>
     * <div> </div>
     * @param {SpiConnectionSettings} settings 
     * @returns {SpiDevice} 
     * @see https://learn.microsoft.com/windows/win32/api//content/wingdi/nf-wingdi-getdevicecaps
     */
    GetDevice(settings) {
        result := ComCall(6, this, "ptr", settings, "ptr*", &device := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SpiDevice(device)
    }
}
