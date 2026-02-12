#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\WalletItemStore.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Wallet
 * @version WindowsRuntime 1.4
 */
class IWalletManagerStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWalletManagerStatics
     * @type {Guid}
     */
    static IID => Guid("{5111d6b8-c9a4-4c64-b4dd-e1e548001c0d}")

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
     * @returns {IAsyncOperation<WalletItemStore>} 
     */
    RequestStoreAsync() {
        result := ComCall(6, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(WalletItemStore, operation)
    }
}
