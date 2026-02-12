#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\CashDrawerCapabilities.ahk
#Include .\CashDrawerStatus.ahk
#Include .\CashDrawerEventSource.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\ClaimedCashDrawer.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Represents the arguments common to cash drawer event sources.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.icashdrawereventsourceeventargs
 * @namespace Windows.Devices.PointOfService
 * @version WindowsRuntime 1.4
 */
class ICashDrawer extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICashDrawer
     * @type {Guid}
     */
    static IID => Guid("{9f88f5c8-de54-4aee-a890-920bcbfe30fc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DeviceId", "get_Capabilities", "get_Status", "get_IsDrawerOpen", "get_DrawerEventSource", "ClaimDrawerAsync", "CheckHealthAsync", "GetStatisticsAsync", "add_StatusUpdated", "remove_StatusUpdated"]

    /**
     * @type {HSTRING} 
     */
    DeviceId {
        get => this.get_DeviceId()
    }

    /**
     * @type {CashDrawerCapabilities} 
     */
    Capabilities {
        get => this.get_Capabilities()
    }

    /**
     * @type {CashDrawerStatus} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * @type {Boolean} 
     */
    IsDrawerOpen {
        get => this.get_IsDrawerOpen()
    }

    /**
     * @type {CashDrawerEventSource} 
     */
    DrawerEventSource {
        get => this.get_DrawerEventSource()
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
     * @returns {CashDrawerCapabilities} 
     */
    get_Capabilities() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CashDrawerCapabilities(value)
    }

    /**
     * 
     * @returns {CashDrawerStatus} 
     */
    get_Status() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CashDrawerStatus(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsDrawerOpen() {
        result := ComCall(9, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {CashDrawerEventSource} 
     */
    get_DrawerEventSource() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CashDrawerEventSource(value)
    }

    /**
     * 
     * @returns {IAsyncOperation<ClaimedCashDrawer>} 
     */
    ClaimDrawerAsync() {
        result := ComCall(11, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(ClaimedCashDrawer, operation)
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
     * @param {TypedEventHandler<CashDrawer, CashDrawerStatusUpdatedEventArgs>} handler 
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
