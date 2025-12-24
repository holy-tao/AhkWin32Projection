#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Enables receiving package state-change notifications during Windows Store app debugging.
 * @remarks
 * 
 * Implement the <b>IPackageExecutionStateChangeNotification</b> interface when you need to receive package state-change notifications during Windows Store app debugging. 
 * 
 * Call the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ipackagedebugsettings-registerforpackagestatechanges">RegisterForPackageStateChanges</a> method to register for package state-change notifications.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-ipackageexecutionstatechangenotification
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IPackageExecutionStateChangeNotification extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPackageExecutionStateChangeNotification
     * @type {Guid}
     */
    static IID => Guid("{1bb12a62-2ad8-432b-8ccf-0c2c52afcd5b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnStateChanged"]

    /**
     * Called when package state changes during Windows Store app debugging.
     * @param {PWSTR} pszPackageFullName The package full name.
     * @param {Integer} pesNewState The new state that the package changed to.
     * @returns {HRESULT} Return <b>S_OK</b> when you implement the <b>OnStateChanged</b>method.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ipackageexecutionstatechangenotification-onstatechanged
     */
    OnStateChanged(pszPackageFullName, pesNewState) {
        pszPackageFullName := pszPackageFullName is String ? StrPtr(pszPackageFullName) : pszPackageFullName

        result := ComCall(3, this, "ptr", pszPackageFullName, "int", pesNewState, "HRESULT")
        return result
    }
}
