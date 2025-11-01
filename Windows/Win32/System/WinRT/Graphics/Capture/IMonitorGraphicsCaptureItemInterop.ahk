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
     * 
     * @param {Pointer<HMONITOR>} monitor 
     * @returns {HRESULT} 
     */
    GetMonitor(monitor) {
        result := ComCall(3, this, "ptr", monitor, "HRESULT")
        return result
    }
}
