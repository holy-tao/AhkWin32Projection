#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that allow implementers of a custom IAssocHandler object to provide access to its explicit Application User Model ID (AppUserModelID).
 * @remarks
 * 
  * Only file types for which an application is a registered handler appear in that application's Jump List. When an application uses an explicit AppUserModelID to identify itself and the windows and processes that belong to it, that AppUserModelID must also be set in a handler's implemention so that the handler is recognized as being associated with that application. When the application accesses a file such that <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nf-shlobj_core-shaddtorecentdocs">SHAddToRecentDocs</a> is called as a result, an attempt is made to add the file to the <b>Recent</b> or <b>Frequent</b> category, or possibly a custom category, in that application's Jump List. If the application is a registered handler for that file type, identified as such by the handler's AppUserModelID matching the application's AppUserModelID, that file is added to the Jump List. If not, it is filtered and does not appear.
  * 
  * <h3><a id="When_to_Implement"></a><a id="when_to_implement"></a><a id="WHEN_TO_IMPLEMENT"></a>When to Implement</h3>
  * An implementation of this interface is provided in Windows. Applications that create custom Shell folders that expose an association handler enumeration needed by the system to determine the files allowed in the application's Jump List should implement their own versions.
  * 
  * <h3><a id="When_to_Use"></a><a id="when_to_use"></a><a id="WHEN_TO_USE"></a>When to Use</h3>
  * This object is needed only if your application is using explicit AppUserModelIDs. Without an explicit AppUserModelID to expose, there is no need for this object.
  * 
  * <b>IObjectWithAppUserModelID</b> is always used as part of a larger object that uses explicit AppUserModelIDs and wants to expose that information to the system.
  * 
  * The system calls the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-iobjectwithappusermodelid-getappid">IObjectWithAppUserModelID::GetAppID</a> method implemented on a handler to determine whether the application is a registered handler for a file type.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-iobjectwithappusermodelid
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IObjectWithAppUserModelID extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IObjectWithAppUserModelID
     * @type {Guid}
     */
    static IID => Guid("{36db0196-9665-46d1-9ba7-d3709eecf9ed}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetAppID", "GetAppID"]

    /**
     * 
     * @param {PWSTR} pszAppID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iobjectwithappusermodelid-setappid
     */
    SetAppID(pszAppID) {
        pszAppID := pszAppID is String ? StrPtr(pszAppID) : pszAppID

        result := ComCall(3, this, "ptr", pszAppID, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iobjectwithappusermodelid-getappid
     */
    GetAppID() {
        result := ComCall(4, this, "ptr*", &ppszAppID := 0, "HRESULT")
        return ppszAppID
    }
}
