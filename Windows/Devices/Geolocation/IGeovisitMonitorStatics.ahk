#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\Geovisit.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Geolocation
 * @version WindowsRuntime 1.4
 */
class IGeovisitMonitorStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGeovisitMonitorStatics
     * @type {Guid}
     */
    static IID => Guid("{bcf976a7-bbf2-4cdd-95cf-554c82edfb87}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetLastReportAsync"]

    /**
     * 
     * @returns {IAsyncOperation<Geovisit>} 
     */
    GetLastReportAsync() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(Geovisit, value)
    }
}
