#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Devices\Geolocation\Geopoint.ahk
#Include ..\..\Foundation\IAsyncAction.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Storage.FileProperties
 * @version WindowsRuntime 1.4
 */
class IGeotagHelperStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGeotagHelperStatics
     * @type {Guid}
     */
    static IID => Guid("{41493244-2524-4655-86a6-ed16f5fc716b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetGeotagAsync", "SetGeotagFromGeolocatorAsync", "SetGeotagAsync"]

    /**
     * 
     * @param {IStorageFile} file_ 
     * @returns {IAsyncOperation<Geopoint>} 
     */
    GetGeotagAsync(file_) {
        result := ComCall(6, this, "ptr", file_, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(Geopoint, operation)
    }

    /**
     * 
     * @param {IStorageFile} file_ 
     * @param {Geolocator} geolocator_ 
     * @returns {IAsyncAction} 
     */
    SetGeotagFromGeolocatorAsync(file_, geolocator_) {
        result := ComCall(7, this, "ptr", file_, "ptr", geolocator_, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(operation)
    }

    /**
     * 
     * @param {IStorageFile} file_ 
     * @param {Geopoint} geopoint_ 
     * @returns {IAsyncAction} 
     */
    SetGeotagAsync(file_, geopoint_) {
        result := ComCall(8, this, "ptr", file_, "ptr", geopoint_, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(operation)
    }
}
