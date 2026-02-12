#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Store.Preview
 * @version WindowsRuntime 1.4
 */
class IStorePreviewPurchaseResults extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStorePreviewPurchaseResults
     * @type {Guid}
     */
    static IID => Guid("{b0daaed1-d6c5-4e53-a043-fba0d8e61231}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ProductPurchaseStatus"]

    /**
     * @type {Integer} 
     */
    ProductPurchaseStatus {
        get => this.get_ProductPurchaseStatus()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ProductPurchaseStatus() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
