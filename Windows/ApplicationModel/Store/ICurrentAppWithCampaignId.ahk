#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Store
 * @version WindowsRuntime 1.4
 */
class ICurrentAppWithCampaignId extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICurrentAppWithCampaignId
     * @type {Guid}
     */
    static IID => Guid("{312f4cd0-36c1-44a6-b32b-432d608e4dd6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetAppPurchaseCampaignIdAsync"]

    /**
     * 
     * @returns {IAsyncOperation<HSTRING>} 
     */
    GetAppPurchaseCampaignIdAsync() {
        result := ComCall(6, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => HSTRING({ Value: ptr }), operation)
    }
}
