#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\IAsyncAction.ahk
#Include ..\..\..\Foundation\IAsyncOperation.ahk
#Include .\LicenseSatisfactionResult.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Store.LicenseManagement
 * @version WindowsRuntime 1.4
 */
class ILicenseManagerStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ILicenseManagerStatics
     * @type {Guid}
     */
    static IID => Guid("{b5ac3ae0-da47-4f20-9a23-09182c9476ff}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddLicenseAsync", "GetSatisfactionInfosAsync"]

    /**
     * 
     * @param {IBuffer} license 
     * @returns {IAsyncAction} 
     */
    AddLicenseAsync(license) {
        result := ComCall(6, this, "ptr", license, "ptr*", &action := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(action)
    }

    /**
     * 
     * @param {IIterable<HSTRING>} contentIds 
     * @param {IIterable<HSTRING>} keyIds 
     * @returns {IAsyncOperation<LicenseSatisfactionResult>} 
     */
    GetSatisfactionInfosAsync(contentIds, keyIds) {
        result := ComCall(7, this, "ptr", contentIds, "ptr", keyIds, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(LicenseSatisfactionResult, operation)
    }
}
