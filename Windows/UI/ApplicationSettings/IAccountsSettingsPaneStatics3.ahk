#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncAction.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.ApplicationSettings
 * @version WindowsRuntime 1.4
 */
class IAccountsSettingsPaneStatics3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAccountsSettingsPaneStatics3
     * @type {Guid}
     */
    static IID => Guid("{08410458-a2ba-4c6f-b4ac-48f514331216}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ShowManageAccountsForUserAsync", "ShowAddAccountForUserAsync"]

    /**
     * 
     * @param {User} user_ 
     * @returns {IAsyncAction} 
     */
    ShowManageAccountsForUserAsync(user_) {
        result := ComCall(6, this, "ptr", user_, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(operation)
    }

    /**
     * 
     * @param {User} user_ 
     * @returns {IAsyncAction} 
     */
    ShowAddAccountForUserAsync(user_) {
        result := ComCall(7, this, "ptr", user_, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(operation)
    }
}
