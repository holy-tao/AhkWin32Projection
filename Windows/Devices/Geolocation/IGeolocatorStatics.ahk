#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include .\Geoposition.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Geolocation
 * @version WindowsRuntime 1.4
 */
class IGeolocatorStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGeolocatorStatics
     * @type {Guid}
     */
    static IID => Guid("{9a8e7571-2df5-4591-9f87-eb5fd894e9b7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RequestAccessAsync", "GetGeopositionHistoryAsync", "GetGeopositionHistoryWithDurationAsync"]

    /**
     * 
     * @returns {IAsyncOperation<Integer>} 
     */
    RequestAccessAsync() {
        result := ComCall(6, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetInt32(), result_)
    }

    /**
     * 
     * @param {DateTime} startTime 
     * @returns {IAsyncOperation<IVectorView<Geoposition>>} 
     */
    GetGeopositionHistoryAsync(startTime) {
        result := ComCall(7, this, "ptr", startTime, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVectorView.Call.Bind(IVectorView, Geoposition), result_)
    }

    /**
     * 
     * @param {DateTime} startTime 
     * @param {TimeSpan} duration_ 
     * @returns {IAsyncOperation<IVectorView<Geoposition>>} 
     */
    GetGeopositionHistoryWithDurationAsync(startTime, duration_) {
        result := ComCall(8, this, "ptr", startTime, "ptr", duration_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVectorView.Call.Bind(IVectorView, Geoposition), result_)
    }
}
