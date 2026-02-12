#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\WalletItemCustomProperty.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Wallet
 * @version WindowsRuntime 1.4
 */
class IWalletItemCustomPropertyFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWalletItemCustomPropertyFactory
     * @type {Guid}
     */
    static IID => Guid("{d0046a44-61a1-41aa-b259-a5610ab5d575}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateWalletItemCustomProperty"]

    /**
     * 
     * @param {HSTRING} name 
     * @param {HSTRING} value 
     * @returns {WalletItemCustomProperty} 
     */
    CreateWalletItemCustomProperty(name, value) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(6, this, "ptr", name, "ptr", value, "ptr*", &walletItemCustomProperty_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return WalletItemCustomProperty(walletItemCustomProperty_)
    }
}
