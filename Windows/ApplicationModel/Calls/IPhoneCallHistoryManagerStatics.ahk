#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\PhoneCallHistoryStore.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Calls
 * @version WindowsRuntime 1.4
 */
class IPhoneCallHistoryManagerStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPhoneCallHistoryManagerStatics
     * @type {Guid}
     */
    static IID => Guid("{f5a6da39-b31f-4f45-ac8e-1b08893c1b50}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RequestStoreAsync"]

    /**
     * 
     * @param {Integer} accessType 
     * @returns {IAsyncOperation<PhoneCallHistoryStore>} 
     */
    RequestStoreAsync(accessType) {
        result := ComCall(6, this, "int", accessType, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(PhoneCallHistoryStore, result_)
    }
}
