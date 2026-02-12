#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\PaymentAppManager.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Payments.Provider
 * @version WindowsRuntime 1.4
 */
class IPaymentAppManagerStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPaymentAppManagerStatics
     * @type {Guid}
     */
    static IID => Guid("{a341ac28-fc89-4406-b4d9-34e7fe79dfb6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Current"]

    /**
     * @type {PaymentAppManager} 
     */
    Current {
        get => this.get_Current()
    }

    /**
     * 
     * @returns {PaymentAppManager} 
     */
    get_Current() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PaymentAppManager(value)
    }
}
