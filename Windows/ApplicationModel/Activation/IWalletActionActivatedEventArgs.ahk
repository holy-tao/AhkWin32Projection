#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Provides information to an app that was launched as the result of a wallet action.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.iwalletactionactivatedeventargs
 * @namespace Windows.ApplicationModel.Activation
 * @version WindowsRuntime 1.4
 */
class IWalletActionActivatedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWalletActionActivatedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{fcfc027b-1a1a-4d22-923f-ae6f45fa52d9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ItemId", "get_ActionKind", "get_ActionId"]

    /**
     * Gets the ID of the [WalletItem](../windows.applicationmodel.wallet/walletitem.md) on which the user performed the action.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.iwalletactionactivatedeventargs.itemid
     * @type {HSTRING} 
     */
    ItemId {
        get => this.get_ItemId()
    }

    /**
     * Gets the action that was performed on the [WalletItem](../windows.applicationmodel.wallet/walletitem.md).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.iwalletactionactivatedeventargs.actionkind
     * @type {Integer} 
     */
    ActionKind {
        get => this.get_ActionKind()
    }

    /**
     * Gets the ID of the action, such as the id of the verb, transaction and so on.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.iwalletactionactivatedeventargs.actionid
     * @type {HSTRING} 
     */
    ActionId {
        get => this.get_ActionId()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ItemId() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ActionKind() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ActionId() {
        value := HSTRING()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
