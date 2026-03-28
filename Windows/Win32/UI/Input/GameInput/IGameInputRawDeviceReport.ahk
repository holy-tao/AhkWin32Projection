#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.UI.Input.GameInput
 * @version v4.0.30319
 */
class IGameInputRawDeviceReport extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGameInputRawDeviceReport
     * @type {Guid}
     */
    static IID => Guid("{61f08cf1-1ffc-40ca-a2b8-e1ab8bc5b6dc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDevice", "GetReportInfo", "GetRawDataSize", "GetRawData", "SetRawData", "GetItemValue", "SetItemValue", "ResetItemValue", "ResetAllItems"]

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
     * @param {Pointer<IGameInputDevice>} device 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/wingdi/nf-wingdi-getdevicecaps
     */
    GetDevice(device) {
        ComCall(3, this, "ptr*", device)
    }

    /**
     * 
     * @returns {Pointer<GameInputRawDeviceReportInfo>} 
     */
    GetReportInfo() {
        result := ComCall(4, this, "ptr")
        return result
    }

    /**
     * 
     * @returns {Pointer} 
     */
    GetRawDataSize() {
        result := ComCall(5, this, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer} bufferSize 
     * @param {Pointer<Void>} _buffer 
     * @returns {Pointer} 
     */
    GetRawData(bufferSize, _buffer) {
        _bufferMarshal := _buffer is VarRef ? "ptr" : "ptr"

        result := ComCall(6, this, "ptr", bufferSize, _bufferMarshal, _buffer, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer} bufferSize 
     * @param {Pointer<Void>} _buffer 
     * @returns {Boolean} 
     */
    SetRawData(bufferSize, _buffer) {
        _bufferMarshal := _buffer is VarRef ? "ptr" : "ptr"

        result := ComCall(7, this, "ptr", bufferSize, _bufferMarshal, _buffer, "int")
        return result
    }

    /**
     * 
     * @param {Integer} itemIndex 
     * @param {Pointer<Integer>} value 
     * @returns {Boolean} 
     */
    GetItemValue(itemIndex, value) {
        valueMarshal := value is VarRef ? "int64*" : "ptr"

        result := ComCall(8, this, "uint", itemIndex, valueMarshal, value, "int")
        return result
    }

    /**
     * 
     * @param {Integer} itemIndex 
     * @param {Integer} value 
     * @returns {Boolean} 
     */
    SetItemValue(itemIndex, value) {
        result := ComCall(9, this, "uint", itemIndex, "int64", value, "int")
        return result
    }

    /**
     * 
     * @param {Integer} itemIndex 
     * @returns {Boolean} 
     */
    ResetItemValue(itemIndex) {
        result := ComCall(10, this, "uint", itemIndex, "int")
        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    ResetAllItems() {
        result := ComCall(11, this, "int")
        return result
    }
}
