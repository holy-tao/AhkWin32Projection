#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that allow an application to remove one or all destinations from the Recent or Frequent categories in a Jump List.
 * @remarks
 * 
  * <h3><a id="When_to_Implement"></a><a id="when_to_implement"></a><a id="WHEN_TO_IMPLEMENT"></a>When to Implement</h3>
  * An implementation of this interface is provided in Windows as CLSID_ApplicationDestinations. This interface is not implemented by third parties.
  * 
  * <h3><a id="When_to_Use"></a><a id="when_to_use"></a><a id="WHEN_TO_USE"></a>When to Use</h3>
  * An application calls the methods of this interface when it wants to remove items from a Jump List's automatically generated destinations. These destinations, found in the <b>Recent</b> or <b>Frequent</b> categories, are generated through calls to <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nf-shlobj_core-shaddtorecentdocs">SHAddToRecentDocs</a>, either explicitly or by the system when a file is opened through Windows Explorer or the common file dialog is used to open, save, or create a file.
  * 
  * 
  * 
  * An application should call <b>IApplicationDestinations</b> methods in the following situations:
  *                 
  * <ul>
  * <li>When the application is uninstalled.</li>
  * <li>When the user clears history.</li>
  * <li>When the user disables destination tracking in the application's Settings or Options pages.</li>
  * <li>When the user deletes the destination from within the application. This is particularly important in the case of a destination that is not a file. In the case of non-file destinations—generally, though not always, <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishelllinka">IShellLink</a> items—it is the application's responsibility to remove the destination from the list when it detects that it no longer exists.</li>
  * </ul>
  * 
  * 
  * If the user turns off usage tracking in the application's privacy setting, the application is responsible for clearing the existing data and also stopping the system from collecting usage data on that item in the future. This is done by setting the NoRecentDocs value in all of the application's file type registrations. See <a href="https://docs.microsoft.com/windows/desktop/api/shlwapi/ne-shlwapi-filetypeattributeflags">FTA_NoRecentDocs</a> for more information.
  * 
  * <b>IApplicationDestinations</b> methods are used only with the automatically generated <b>Recent</b> or <b>Frequent</b> categories. They do not remove items that the user has pinned to the Jump List. Those items cannot be removed programmatically; only the user can remove them. These methods also have no effect on <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-icustomdestinationlist">custom categories</a> or the task list.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-iapplicationdestinations
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IApplicationDestinations extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IApplicationDestinations
     * @type {Guid}
     */
    static IID => Guid("{12337d35-94c6-48a0-bce7-6a9c69d4d600}")

    /**
     * The class identifier for ApplicationDestinations
     * @type {Guid}
     */
    static CLSID => Guid("{86c14003-4d6b-4ef3-a7b4-0506663b2e68}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetAppID", "RemoveDestination", "RemoveAllDestinations"]

    /**
     * 
     * @param {PWSTR} pszAppID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iapplicationdestinations-setappid
     */
    SetAppID(pszAppID) {
        pszAppID := pszAppID is String ? StrPtr(pszAppID) : pszAppID

        result := ComCall(3, this, "ptr", pszAppID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} punk 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iapplicationdestinations-removedestination
     */
    RemoveDestination(punk) {
        result := ComCall(4, this, "ptr", punk, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iapplicationdestinations-removealldestinations
     */
    RemoveAllDestinations() {
        result := ComCall(5, this, "HRESULT")
        return result
    }
}
