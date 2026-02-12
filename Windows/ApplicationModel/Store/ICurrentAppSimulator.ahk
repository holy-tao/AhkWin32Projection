#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\LicenseInformation.ahk
#Include ..\..\Foundation\Uri.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\ListingInformation.ahk
#Include ..\..\Foundation\IAsyncAction.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Store
 * @version WindowsRuntime 1.4
 */
class ICurrentAppSimulator extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICurrentAppSimulator
     * @type {Guid}
     */
    static IID => Guid("{f17f9db1-74cd-4787-9787-19866e9a5559}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_LicenseInformation", "get_LinkUri", "get_AppId", "RequestAppPurchaseAsync", "RequestProductPurchaseAsync", "LoadListingInformationAsync", "GetAppReceiptAsync", "GetProductReceiptAsync", "ReloadSimulatorAsync"]

    /**
     * @type {LicenseInformation} 
     */
    LicenseInformation {
        get => this.get_LicenseInformation()
    }

    /**
     * @type {Uri} 
     */
    LinkUri {
        get => this.get_LinkUri()
    }

    /**
     * @type {Guid} 
     */
    AppId {
        get => this.get_AppId()
    }

    /**
     * 
     * @returns {LicenseInformation} 
     */
    get_LicenseInformation() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return LicenseInformation(value)
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_LinkUri() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Uri(value)
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_AppId() {
        value := Guid()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} includeReceipt 
     * @returns {IAsyncOperation<HSTRING>} 
     */
    RequestAppPurchaseAsync(includeReceipt) {
        result := ComCall(9, this, "int", includeReceipt, "ptr*", &requestAppPurchaseOperation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => HSTRING({ Value: ptr }), requestAppPurchaseOperation)
    }

    /**
     * 
     * @param {HSTRING} productId 
     * @param {Boolean} includeReceipt 
     * @returns {IAsyncOperation<HSTRING>} 
     */
    RequestProductPurchaseAsync(productId, includeReceipt) {
        if(productId is String) {
            pin := HSTRING.Create(productId)
            productId := pin.Value
        }
        productId := productId is Win32Handle ? NumGet(productId, "ptr") : productId

        result := ComCall(10, this, "ptr", productId, "int", includeReceipt, "ptr*", &requestProductPurchaseOperation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => HSTRING({ Value: ptr }), requestProductPurchaseOperation)
    }

    /**
     * 
     * @returns {IAsyncOperation<ListingInformation>} 
     */
    LoadListingInformationAsync() {
        result := ComCall(11, this, "ptr*", &loadListingOperation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(ListingInformation, loadListingOperation)
    }

    /**
     * 
     * @returns {IAsyncOperation<HSTRING>} 
     */
    GetAppReceiptAsync() {
        result := ComCall(12, this, "ptr*", &appReceiptOperation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => HSTRING({ Value: ptr }), appReceiptOperation)
    }

    /**
     * 
     * @param {HSTRING} productId 
     * @returns {IAsyncOperation<HSTRING>} 
     */
    GetProductReceiptAsync(productId) {
        if(productId is String) {
            pin := HSTRING.Create(productId)
            productId := pin.Value
        }
        productId := productId is Win32Handle ? NumGet(productId, "ptr") : productId

        result := ComCall(13, this, "ptr", productId, "ptr*", &getProductReceiptOperation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => HSTRING({ Value: ptr }), getProductReceiptOperation)
    }

    /**
     * 
     * @param {StorageFile} simulatorSettingsFile 
     * @returns {IAsyncAction} 
     */
    ReloadSimulatorAsync(simulatorSettingsFile) {
        result := ComCall(14, this, "ptr", simulatorSettingsFile, "ptr*", &reloadSimulatorOperation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(reloadSimulatorOperation)
    }
}
