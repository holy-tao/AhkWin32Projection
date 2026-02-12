#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\..\Foundation\Collections\IVectorView.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.UserDataAccounts.SystemAccess
 * @version WindowsRuntime 1.4
 */
class IUserDataAccountSystemAccessManagerStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUserDataAccountSystemAccessManagerStatics
     * @type {Guid}
     */
    static IID => Guid("{9d6b11b9-cbe5-45f5-822b-c267b81dbdb6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddAndShowDeviceAccountsAsync"]

    /**
     * 
     * @param {IIterable<DeviceAccountConfiguration>} accounts 
     * @returns {IAsyncOperation<IVectorView<HSTRING>>} 
     */
    AddAndShowDeviceAccountsAsync(accounts) {
        result := ComCall(6, this, "ptr", accounts, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVectorView.Call.Bind(IVectorView, (ptr) => HSTRING({ Value: ptr })), result_)
    }
}
