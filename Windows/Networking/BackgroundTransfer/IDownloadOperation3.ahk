#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Storage\Streams\IRandomAccessStreamReference.ahk
#Include ..\..\Foundation\Collections\IVector.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Foundation\IReference.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.BackgroundTransfer
 * @version WindowsRuntime 1.4
 */
class IDownloadOperation3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDownloadOperation3
     * @type {Guid}
     */
    static IID => Guid("{5027351c-7d5e-4adc-b8d3-df5c6031b9cc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsRandomAccessRequired", "put_IsRandomAccessRequired", "GetResultRandomAccessStreamReference", "GetDownloadedRanges", "add_RangesDownloaded", "remove_RangesDownloaded", "put_RequestedUri", "get_RecoverableWebErrorStatuses", "get_CurrentWebErrorStatus"]

    /**
     * @type {Boolean} 
     */
    IsRandomAccessRequired {
        get => this.get_IsRandomAccessRequired()
        set => this.put_IsRandomAccessRequired(value)
    }

    /**
     * @type {HRESULT} 
     */
    RequestedUri {
        set => this.put_RequestedUri(value)
    }

    /**
     * @type {IVector<Integer>} 
     */
    RecoverableWebErrorStatuses {
        get => this.get_RecoverableWebErrorStatuses()
    }

    /**
     * @type {IReference<Integer>} 
     */
    CurrentWebErrorStatus {
        get => this.get_CurrentWebErrorStatus()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsRandomAccessRequired() {
        result := ComCall(6, this, "int*", &value := 0, "int")
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
    put_IsRandomAccessRequired(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IRandomAccessStreamReference} 
     */
    GetResultRandomAccessStreamReference() {
        result := ComCall(8, this, "ptr*", &stream := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IRandomAccessStreamReference(stream)
    }

    /**
     * 
     * @returns {IVector<BackgroundTransferFileRange>} 
     */
    GetDownloadedRanges() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector((ptr) => IPropertyValue(ptr).GetBackgroundTransferFileRange(), value)
    }

    /**
     * 
     * @param {TypedEventHandler<DownloadOperation, BackgroundTransferRangesDownloadedEventArgs>} eventHandler 
     * @returns {EventRegistrationToken} 
     */
    add_RangesDownloaded(eventHandler) {
        eventCookie := EventRegistrationToken()
        result := ComCall(10, this, "ptr", eventHandler, "ptr", eventCookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return eventCookie
    }

    /**
     * 
     * @param {EventRegistrationToken} eventCookie 
     * @returns {HRESULT} 
     */
    remove_RangesDownloaded(eventCookie) {
        eventCookie := eventCookie is Win32Handle ? NumGet(eventCookie, "ptr") : eventCookie

        result := ComCall(11, this, "ptr", eventCookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Uri} value 
     * @returns {HRESULT} 
     */
    put_RequestedUri(value) {
        result := ComCall(12, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IVector<Integer>} 
     */
    get_RecoverableWebErrorStatuses() {
        result := ComCall(13, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector((ptr) => IPropertyValue(ptr).GetInt32(), value)
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_CurrentWebErrorStatus() {
        result := ComCall(14, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetInt32(), value)
    }
}
