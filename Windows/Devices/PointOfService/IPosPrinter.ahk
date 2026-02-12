#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\PosPrinterCapabilities.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include .\PosPrinterStatus.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\ClaimedPosPrinter.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Represents actions common to jobs for all types of stations for a point-of-service printer.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.iposprinterjob
 * @namespace Windows.Devices.PointOfService
 * @version WindowsRuntime 1.4
 */
class IPosPrinter extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPosPrinter
     * @type {Guid}
     */
    static IID => Guid("{2a03c10e-9a19-4a01-994f-12dfad6adcbf}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DeviceId", "get_Capabilities", "get_SupportedCharacterSets", "get_SupportedTypeFaces", "get_Status", "ClaimPrinterAsync", "CheckHealthAsync", "GetStatisticsAsync", "add_StatusUpdated", "remove_StatusUpdated"]

    /**
     * @type {HSTRING} 
     */
    DeviceId {
        get => this.get_DeviceId()
    }

    /**
     * @type {PosPrinterCapabilities} 
     */
    Capabilities {
        get => this.get_Capabilities()
    }

    /**
     * @type {IVectorView<Integer>} 
     */
    SupportedCharacterSets {
        get => this.get_SupportedCharacterSets()
    }

    /**
     * @type {IVectorView<HSTRING>} 
     */
    SupportedTypeFaces {
        get => this.get_SupportedTypeFaces()
    }

    /**
     * @type {PosPrinterStatus} 
     */
    Status {
        get => this.get_Status()
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
     * @returns {PosPrinterCapabilities} 
     */
    get_Capabilities() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PosPrinterCapabilities(value)
    }

    /**
     * 
     * @returns {IVectorView<Integer>} 
     */
    get_SupportedCharacterSets() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView((ptr) => IPropertyValue(ptr).GetUInt32(), value)
    }

    /**
     * 
     * @returns {IVectorView<HSTRING>} 
     */
    get_SupportedTypeFaces() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView((ptr) => HSTRING({ Value: ptr }), value)
    }

    /**
     * 
     * @returns {PosPrinterStatus} 
     */
    get_Status() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PosPrinterStatus(value)
    }

    /**
     * 
     * @returns {IAsyncOperation<ClaimedPosPrinter>} 
     */
    ClaimPrinterAsync() {
        result := ComCall(11, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(ClaimedPosPrinter, operation)
    }

    /**
     * 
     * @param {Integer} level 
     * @returns {IAsyncOperation<HSTRING>} 
     */
    CheckHealthAsync(level) {
        result := ComCall(12, this, "int", level, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => HSTRING({ Value: ptr }), operation)
    }

    /**
     * 
     * @param {IIterable<HSTRING>} statisticsCategories 
     * @returns {IAsyncOperation<HSTRING>} 
     */
    GetStatisticsAsync(statisticsCategories) {
        result := ComCall(13, this, "ptr", statisticsCategories, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => HSTRING({ Value: ptr }), operation)
    }

    /**
     * 
     * @param {TypedEventHandler<PosPrinter, PosPrinterStatusUpdatedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_StatusUpdated(handler) {
        token := EventRegistrationToken()
        result := ComCall(14, this, "ptr", handler, "ptr", token, "int")
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

        result := ComCall(15, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
