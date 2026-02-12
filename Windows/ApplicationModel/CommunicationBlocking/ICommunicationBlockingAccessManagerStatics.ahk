#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.CommunicationBlocking
 * @version WindowsRuntime 1.4
 */
class ICommunicationBlockingAccessManagerStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICommunicationBlockingAccessManagerStatics
     * @type {Guid}
     */
    static IID => Guid("{1c969998-9d2a-5db7-edd5-0ce407fc2595}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsBlockingActive", "IsBlockedNumberAsync", "ShowBlockNumbersUI", "ShowUnblockNumbersUI", "ShowBlockedCallsUI", "ShowBlockedMessagesUI"]

    /**
     * @type {Boolean} 
     */
    IsBlockingActive {
        get => this.get_IsBlockingActive()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsBlockingActive() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} number_ 
     * @returns {IAsyncOperation<Boolean>} 
     */
    IsBlockedNumberAsync(number_) {
        if(number_ is String) {
            pin := HSTRING.Create(number_)
            number_ := pin.Value
        }
        number_ := number_ is Win32Handle ? NumGet(number_, "ptr") : number_

        result := ComCall(7, this, "ptr", number_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), result_)
    }

    /**
     * 
     * @param {IIterable<HSTRING>} phoneNumbers 
     * @returns {Boolean} 
     */
    ShowBlockNumbersUI(phoneNumbers) {
        result := ComCall(8, this, "ptr", phoneNumbers, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {IIterable<HSTRING>} phoneNumbers 
     * @returns {Boolean} 
     */
    ShowUnblockNumbersUI(phoneNumbers) {
        result := ComCall(9, this, "ptr", phoneNumbers, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ShowBlockedCallsUI() {
        result := ComCall(10, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ShowBlockedMessagesUI() {
        result := ComCall(11, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
