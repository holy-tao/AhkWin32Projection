#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Foundation\IReference.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include .\WindowsUpdate.ahk
#Include .\WindowsUpdateItem.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Management.Update
 * @version WindowsRuntime 1.4
 */
class IWindowsUpdateManager extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWindowsUpdateManager
     * @type {Guid}
     */
    static IID => Guid("{5dd966c0-a71a-5602-bbd0-09a70e4573fa}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["add_ScanningStateChanged", "remove_ScanningStateChanged", "add_WorkingStateChanged", "remove_WorkingStateChanged", "add_ProgressChanged", "remove_ProgressChanged", "add_AttentionRequiredReasonChanged", "remove_AttentionRequiredReasonChanged", "add_ActionCompleted", "remove_ActionCompleted", "add_ScanCompleted", "remove_ScanCompleted", "get_IsScanning", "get_IsWorking", "get_LastSuccessfulScanTimestamp", "GetApplicableUpdates", "GetMostRecentCompletedUpdates", "GetMostRecentCompletedUpdatesAsync", "StartScan"]

    /**
     * @type {Boolean} 
     */
    IsScanning {
        get => this.get_IsScanning()
    }

    /**
     * @type {Boolean} 
     */
    IsWorking {
        get => this.get_IsWorking()
    }

    /**
     * @type {IReference<DateTime>} 
     */
    LastSuccessfulScanTimestamp {
        get => this.get_LastSuccessfulScanTimestamp()
    }

    /**
     * 
     * @param {TypedEventHandler<WindowsUpdateManager, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ScanningStateChanged(handler) {
        token := EventRegistrationToken()
        result := ComCall(6, this, "ptr", handler, "ptr", token, "int")
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
    remove_ScanningStateChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(7, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<WindowsUpdateManager, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_WorkingStateChanged(handler) {
        token := EventRegistrationToken()
        result := ComCall(8, this, "ptr", handler, "ptr", token, "int")
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
    remove_WorkingStateChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(9, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<WindowsUpdateManager, WindowsUpdateProgressChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ProgressChanged(handler) {
        token := EventRegistrationToken()
        result := ComCall(10, this, "ptr", handler, "ptr", token, "int")
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
    remove_ProgressChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(11, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<WindowsUpdateManager, WindowsUpdateAttentionRequiredReasonChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_AttentionRequiredReasonChanged(handler) {
        token := EventRegistrationToken()
        result := ComCall(12, this, "ptr", handler, "ptr", token, "int")
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
    remove_AttentionRequiredReasonChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(13, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<WindowsUpdateManager, WindowsUpdateActionCompletedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ActionCompleted(handler) {
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
    remove_ActionCompleted(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(15, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<WindowsUpdateManager, WindowsUpdateScanCompletedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ScanCompleted(handler) {
        token := EventRegistrationToken()
        result := ComCall(16, this, "ptr", handler, "ptr", token, "int")
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
    remove_ScanCompleted(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(17, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsScanning() {
        result := ComCall(18, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsWorking() {
        result := ComCall(19, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IReference<DateTime>} 
     */
    get_LastSuccessfulScanTimestamp() {
        result := ComCall(20, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetDateTime(), value)
    }

    /**
     * 
     * @returns {IVectorView<WindowsUpdate>} 
     */
    GetApplicableUpdates() {
        result := ComCall(21, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(WindowsUpdate, result_)
    }

    /**
     * 
     * @param {Integer} count 
     * @returns {IVectorView<WindowsUpdateItem>} 
     */
    GetMostRecentCompletedUpdates(count) {
        result := ComCall(22, this, "int", count, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(WindowsUpdateItem, result_)
    }

    /**
     * 
     * @param {Integer} count 
     * @returns {IAsyncOperation<IVectorView<WindowsUpdateItem>>} 
     */
    GetMostRecentCompletedUpdatesAsync(count) {
        result := ComCall(23, this, "int", count, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVectorView.Call.Bind(IVectorView, WindowsUpdateItem), operation)
    }

    /**
     * 
     * @param {Boolean} userInitiated 
     * @returns {HRESULT} 
     */
    StartScan(userInitiated) {
        result := ComCall(24, this, "int", userInitiated, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
