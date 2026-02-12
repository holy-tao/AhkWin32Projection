#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\IReference.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Store.Preview
 * @version WindowsRuntime 1.4
 */
class IStoreConfigurationStatics2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStoreConfigurationStatics2
     * @type {Guid}
     */
    static IID => Guid("{657c4595-c8b7-4fe9-9f4c-4d71027d347e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_PurchasePromptingPolicy", "put_PurchasePromptingPolicy"]

    /**
     * @type {IReference<Integer>} 
     */
    PurchasePromptingPolicy {
        get => this.get_PurchasePromptingPolicy()
        set => this.put_PurchasePromptingPolicy(value)
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_PurchasePromptingPolicy() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetUInt32(), value)
    }

    /**
     * 
     * @param {IReference<Integer>} value 
     * @returns {HRESULT} 
     */
    put_PurchasePromptingPolicy(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
