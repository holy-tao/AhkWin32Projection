#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\BarcodeScannerCapabilities.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\ClaimedBarcodeScanner.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include ..\..\Storage\Streams\IBuffer.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.PointOfService
 * @version WindowsRuntime 1.4
 */
class IBarcodeScanner extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBarcodeScanner
     * @type {Guid}
     */
    static IID => Guid("{bea33e06-b264-4f03-a9c1-45b20f01134f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DeviceId", "get_Capabilities", "ClaimScannerAsync", "CheckHealthAsync", "GetSupportedSymbologiesAsync", "IsSymbologySupportedAsync", "RetrieveStatisticsAsync", "GetSupportedProfiles", "IsProfileSupported", "add_StatusUpdated", "remove_StatusUpdated"]

    /**
     * @type {HSTRING} 
     */
    DeviceId {
        get => this.get_DeviceId()
    }

    /**
     * @type {BarcodeScannerCapabilities} 
     */
    Capabilities {
        get => this.get_Capabilities()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DeviceId() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {BarcodeScannerCapabilities} 
     */
    get_Capabilities() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return BarcodeScannerCapabilities(value)
    }

    /**
     * 
     * @returns {IAsyncOperation<ClaimedBarcodeScanner>} 
     */
    ClaimScannerAsync() {
        result := ComCall(8, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(ClaimedBarcodeScanner, operation)
    }

    /**
     * 
     * @param {Integer} level 
     * @returns {IAsyncOperation<HSTRING>} 
     */
    CheckHealthAsync(level) {
        result := ComCall(9, this, "int", level, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => HSTRING({ Value: ptr }), operation)
    }

    /**
     * 
     * @returns {IAsyncOperation<IVectorView<Integer>>} 
     */
    GetSupportedSymbologiesAsync() {
        result := ComCall(10, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVectorView.Call.Bind(IVectorView, (ptr) => IPropertyValue(ptr).GetUInt32()), operation)
    }

    /**
     * 
     * @param {Integer} barcodeSymbology 
     * @returns {IAsyncOperation<Boolean>} 
     */
    IsSymbologySupportedAsync(barcodeSymbology) {
        result := ComCall(11, this, "uint", barcodeSymbology, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), operation)
    }

    /**
     * 
     * @param {IIterable<HSTRING>} statisticsCategories 
     * @returns {IAsyncOperation<IBuffer>} 
     */
    RetrieveStatisticsAsync(statisticsCategories) {
        result := ComCall(12, this, "ptr", statisticsCategories, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IBuffer, operation)
    }

    /**
     * 
     * @returns {IVectorView<HSTRING>} 
     */
    GetSupportedProfiles() {
        result := ComCall(13, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView((ptr) => HSTRING({ Value: ptr }), value)
    }

    /**
     * 
     * @param {HSTRING} profile_ 
     * @returns {Boolean} 
     */
    IsProfileSupported(profile_) {
        if(profile_ is String) {
            pin := HSTRING.Create(profile_)
            profile_ := pin.Value
        }
        profile_ := profile_ is Win32Handle ? NumGet(profile_, "ptr") : profile_

        result := ComCall(14, this, "ptr", profile_, "int*", &isSupported := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return isSupported
    }

    /**
     * 
     * @param {TypedEventHandler<BarcodeScanner, BarcodeScannerStatusUpdatedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_StatusUpdated(handler) {
        token := EventRegistrationToken()
        result := ComCall(15, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_StatusUpdated(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(16, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
