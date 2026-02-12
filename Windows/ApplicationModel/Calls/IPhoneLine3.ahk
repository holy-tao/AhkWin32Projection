#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\PhoneLineDialResult.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\PhoneCallsResult.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Calls
 * @version WindowsRuntime 1.4
 */
class IPhoneLine3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPhoneLine3
     * @type {Guid}
     */
    static IID => Guid("{e2e33cf7-2406-57f3-826a-e5a5f40d6fb5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["DialWithResult", "DialWithResultAsync", "GetAllActivePhoneCalls", "GetAllActivePhoneCallsAsync"]

    /**
     * 
     * @param {HSTRING} number_ 
     * @param {HSTRING} displayName 
     * @returns {PhoneLineDialResult} 
     */
    DialWithResult(number_, displayName) {
        if(number_ is String) {
            pin := HSTRING.Create(number_)
            number_ := pin.Value
        }
        number_ := number_ is Win32Handle ? NumGet(number_, "ptr") : number_
        if(displayName is String) {
            pin := HSTRING.Create(displayName)
            displayName := pin.Value
        }
        displayName := displayName is Win32Handle ? NumGet(displayName, "ptr") : displayName

        result := ComCall(6, this, "ptr", number_, "ptr", displayName, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PhoneLineDialResult(result_)
    }

    /**
     * 
     * @param {HSTRING} number_ 
     * @param {HSTRING} displayName 
     * @returns {IAsyncOperation<PhoneLineDialResult>} 
     */
    DialWithResultAsync(number_, displayName) {
        if(number_ is String) {
            pin := HSTRING.Create(number_)
            number_ := pin.Value
        }
        number_ := number_ is Win32Handle ? NumGet(number_, "ptr") : number_
        if(displayName is String) {
            pin := HSTRING.Create(displayName)
            displayName := pin.Value
        }
        displayName := displayName is Win32Handle ? NumGet(displayName, "ptr") : displayName

        result := ComCall(7, this, "ptr", number_, "ptr", displayName, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(PhoneLineDialResult, operation)
    }

    /**
     * 
     * @returns {PhoneCallsResult} 
     */
    GetAllActivePhoneCalls() {
        result := ComCall(8, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PhoneCallsResult(result_)
    }

    /**
     * 
     * @returns {IAsyncOperation<PhoneCallsResult>} 
     */
    GetAllActivePhoneCallsAsync() {
        result := ComCall(9, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(PhoneCallsResult, operation)
    }
}
