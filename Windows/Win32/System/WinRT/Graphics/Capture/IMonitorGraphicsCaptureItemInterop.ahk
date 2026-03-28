#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.WinRT.Graphics.Capture
 * @version v4.0.30319
 */
class IMonitorGraphicsCaptureItemInterop extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMonitorGraphicsCaptureItemInterop
     * @type {Guid}
     */
    static IID => Guid("{33274d14-a076-4048-8416-747e9b04db7b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetMonitor"]

    /**
     * Retrieves a monitor's minimum, maximum, and current brightness settings.
     * @remarks
     * If this function is supported, the <a href="https://docs.microsoft.com/windows/desktop/api/highlevelmonitorconfigurationapi/nf-highlevelmonitorconfigurationapi-getmonitorcapabilities">GetMonitorCapabilities</a> function returns the MC_CAPS_BRIGHTNESS flag.
     *       
     * 
     * This function takes about 40 milliseconds to return.
     *       
     * 
     * The brightness setting is a continuous monitor setting. For more information, see <a href="https://docs.microsoft.com/windows/desktop/Monitor/using-the-high-level-monitor-configuration-functions">Using the High-Level Monitor Configuration Functions</a>.
     * @param {Pointer<HMONITOR>} _monitor 
     * @returns {HRESULT} If the function succeeds, the return value is <b>TRUE</b>. If the function fails, the return value is <b>FALSE</b>. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/highlevelmonitorconfigurationapi/nf-highlevelmonitorconfigurationapi-getmonitorbrightness
     */
    GetMonitor(_monitor) {
        result := ComCall(3, this, "ptr", _monitor, "HRESULT")
        return result
    }
}
