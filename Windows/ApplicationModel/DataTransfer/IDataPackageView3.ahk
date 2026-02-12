#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.DataTransfer
 * @version WindowsRuntime 1.4
 */
class IDataPackageView3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDataPackageView3
     * @type {Guid}
     */
    static IID => Guid("{d37771a8-ddad-4288-8428-d1cae394128b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RequestAccessAsync", "RequestAccessWithEnterpriseIdAsync", "UnlockAndAssumeEnterpriseIdentity"]

    /**
     * 
     * @returns {IAsyncOperation<Integer>} 
     */
    RequestAccessAsync() {
        result := ComCall(6, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetInt32(), operation)
    }

    /**
     * 
     * @param {HSTRING} enterpriseId 
     * @returns {IAsyncOperation<Integer>} 
     */
    RequestAccessWithEnterpriseIdAsync(enterpriseId) {
        if(enterpriseId is String) {
            pin := HSTRING.Create(enterpriseId)
            enterpriseId := pin.Value
        }
        enterpriseId := enterpriseId is Win32Handle ? NumGet(enterpriseId, "ptr") : enterpriseId

        result := ComCall(7, this, "ptr", enterpriseId, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetInt32(), operation)
    }

    /**
     * 
     * @returns {Integer} 
     */
    UnlockAndAssumeEnterpriseIdentity() {
        result := ComCall(8, this, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }
}
