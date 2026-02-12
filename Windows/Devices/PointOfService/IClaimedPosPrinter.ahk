#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\ClaimedReceiptPrinter.ahk
#Include .\ClaimedSlipPrinter.ahk
#Include .\ClaimedJournalPrinter.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.PointOfService
 * @version WindowsRuntime 1.4
 */
class IClaimedPosPrinter extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IClaimedPosPrinter
     * @type {Guid}
     */
    static IID => Guid("{6d64ce0c-e03e-4b14-a38e-c28c34b86353}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DeviceId", "get_IsEnabled", "put_CharacterSet", "get_CharacterSet", "get_IsCoverOpen", "put_IsCharacterSetMappingEnabled", "get_IsCharacterSetMappingEnabled", "put_MapMode", "get_MapMode", "get_Receipt", "get_Slip", "get_Journal", "EnableAsync", "DisableAsync", "RetainDeviceAsync", "ResetStatisticsAsync", "UpdateStatisticsAsync", "add_ReleaseDeviceRequested", "remove_ReleaseDeviceRequested"]

    /**
     * @type {HSTRING} 
     */
    DeviceId {
        get => this.get_DeviceId()
    }

    /**
     * @type {Boolean} 
     */
    IsEnabled {
        get => this.get_IsEnabled()
    }

    /**
     * @type {Integer} 
     */
    CharacterSet {
        get => this.get_CharacterSet()
        set => this.put_CharacterSet(value)
    }

    /**
     * @type {Boolean} 
     */
    IsCoverOpen {
        get => this.get_IsCoverOpen()
    }

    /**
     * @type {Boolean} 
     */
    IsCharacterSetMappingEnabled {
        get => this.get_IsCharacterSetMappingEnabled()
        set => this.put_IsCharacterSetMappingEnabled(value)
    }

    /**
     * @type {Integer} 
     */
    MapMode {
        get => this.get_MapMode()
        set => this.put_MapMode(value)
    }

    /**
     * @type {ClaimedReceiptPrinter} 
     */
    Receipt {
        get => this.get_Receipt()
    }

    /**
     * @type {ClaimedSlipPrinter} 
     */
    Slip {
        get => this.get_Slip()
    }

    /**
     * @type {ClaimedJournalPrinter} 
     */
    Journal {
        get => this.get_Journal()
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
     * @returns {Boolean} 
     */
    get_IsEnabled() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_CharacterSet(value) {
        result := ComCall(8, this, "uint", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CharacterSet() {
        result := ComCall(9, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsCoverOpen() {
        result := ComCall(10, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsCharacterSetMappingEnabled(value) {
        result := ComCall(11, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsCharacterSetMappingEnabled() {
        result := ComCall(12, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_MapMode(value) {
        result := ComCall(13, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MapMode() {
        result := ComCall(14, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {ClaimedReceiptPrinter} 
     */
    get_Receipt() {
        result := ComCall(15, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ClaimedReceiptPrinter(value)
    }

    /**
     * 
     * @returns {ClaimedSlipPrinter} 
     */
    get_Slip() {
        result := ComCall(16, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ClaimedSlipPrinter(value)
    }

    /**
     * 
     * @returns {ClaimedJournalPrinter} 
     */
    get_Journal() {
        result := ComCall(17, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ClaimedJournalPrinter(value)
    }

    /**
     * 
     * @returns {IAsyncOperation<Boolean>} 
     */
    EnableAsync() {
        result := ComCall(18, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), result_)
    }

    /**
     * 
     * @returns {IAsyncOperation<Boolean>} 
     */
    DisableAsync() {
        result := ComCall(19, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), result_)
    }

    /**
     * 
     * @returns {IAsyncOperation<Boolean>} 
     */
    RetainDeviceAsync() {
        result := ComCall(20, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), result_)
    }

    /**
     * 
     * @param {IIterable<HSTRING>} statisticsCategories 
     * @returns {IAsyncOperation<Boolean>} 
     */
    ResetStatisticsAsync(statisticsCategories) {
        result := ComCall(21, this, "ptr", statisticsCategories, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), result_)
    }

    /**
     * 
     * @param {IIterable<IKeyValuePair<HSTRING, HSTRING>>} statistics 
     * @returns {IAsyncOperation<Boolean>} 
     */
    UpdateStatisticsAsync(statistics) {
        result := ComCall(22, this, "ptr", statistics, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), result_)
    }

    /**
     * 
     * @param {TypedEventHandler<ClaimedPosPrinter, PosPrinterReleaseDeviceRequestedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ReleaseDeviceRequested(handler) {
        token := EventRegistrationToken()
        result := ComCall(23, this, "ptr", handler, "ptr", token, "int")
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
    remove_ReleaseDeviceRequested(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(24, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
