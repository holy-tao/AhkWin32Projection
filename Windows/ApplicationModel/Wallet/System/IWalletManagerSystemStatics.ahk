#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\IAsyncOperation.ahk
#Include .\WalletItemSystemStore.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Wallet.System
 * @version WindowsRuntime 1.4
 */
class IWalletManagerSystemStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWalletManagerSystemStatics
     * @type {Guid}
     */
    static IID => Guid("{bee8eb89-2634-4b9a-8b23-ee8903c91fe0}")

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
     * @returns {IAsyncOperation<WalletItemSystemStore>} 
     */
    RequestStoreAsync() {
        result := ComCall(6, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(WalletItemSystemStore, operation)
    }
}
