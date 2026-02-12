#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\IAsyncAction.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Payments.Provider
 * @version WindowsRuntime 1.4
 */
class IPaymentAppManager extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPaymentAppManager
     * @type {Guid}
     */
    static IID => Guid("{0e47aa53-8521-4969-a957-df2538a3a98f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RegisterAsync", "UnregisterAsync"]

    /**
     * 
     * @param {IIterable<HSTRING>} supportedPaymentMethodIds 
     * @returns {IAsyncAction} 
     */
    RegisterAsync(supportedPaymentMethodIds) {
        result := ComCall(6, this, "ptr", supportedPaymentMethodIds, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(result_)
    }

    /**
     * 
     * @returns {IAsyncAction} 
     */
    UnregisterAsync() {
        result := ComCall(7, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(result_)
    }
}
