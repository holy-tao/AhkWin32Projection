#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\WalletItem.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Wallet
 * @version WindowsRuntime 1.4
 */
class IWalletItemFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWalletItemFactory
     * @type {Guid}
     */
    static IID => Guid("{53e27470-4f0b-4a3e-99e5-0bbb1eab38d4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateWalletItem"]

    /**
     * 
     * @param {Integer} kind 
     * @param {HSTRING} displayName 
     * @returns {WalletItem} 
     */
    CreateWalletItem(kind, displayName) {
        if(displayName is String) {
            pin := HSTRING.Create(displayName)
            displayName := pin.Value
        }
        displayName := displayName is Win32Handle ? NumGet(displayName, "ptr") : displayName

        result := ComCall(6, this, "int", kind, "ptr", displayName, "ptr*", &walletItem_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return WalletItem(walletItem_)
    }
}
