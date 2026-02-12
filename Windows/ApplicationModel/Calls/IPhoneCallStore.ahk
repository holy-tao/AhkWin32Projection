#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\PhoneLineWatcher.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Calls
 * @version WindowsRuntime 1.4
 */
class IPhoneCallStore extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPhoneCallStore
     * @type {Guid}
     */
    static IID => Guid("{5f610748-18a6-4173-86d1-28be9dc62dba}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["IsEmergencyPhoneNumberAsync", "GetDefaultLineAsync", "RequestLineWatcher"]

    /**
     * 
     * @param {HSTRING} number_ 
     * @returns {IAsyncOperation<Boolean>} 
     */
    IsEmergencyPhoneNumberAsync(number_) {
        if(number_ is String) {
            pin := HSTRING.Create(number_)
            number_ := pin.Value
        }
        number_ := number_ is Win32Handle ? NumGet(number_, "ptr") : number_

        result := ComCall(6, this, "ptr", number_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), result_)
    }

    /**
     * 
     * @returns {IAsyncOperation<Guid>} 
     */
    GetDefaultLineAsync() {
        result := ComCall(7, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetGuid(), result_)
    }

    /**
     * 
     * @returns {PhoneLineWatcher} 
     */
    RequestLineWatcher() {
        result := ComCall(8, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PhoneLineWatcher(result_)
    }
}
