#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\WinRT\IInspectable.ahk" { IInspectable }

/**
 * The IContentPrefetcherTaskTrigger interface supports content prefetching behavior and performance testing by defining methods that allow you to verify that an installed app package is registered for this background task and manually trigger its content prefetch operations.
 * @see https://learn.microsoft.com/windows/win32/api/icontentprefetchertasktrigger/nn-icontentprefetchertasktrigger-icontentprefetchertasktrigger
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct IContentPrefetcherTaskTrigger extends IInspectable {
    /**
     * The interface identifier for IContentPrefetcherTaskTrigger
     * @type {Guid}
     */
    static IID := Guid("{1b35a14a-6094-4799-a60e-e474e15d4dc9}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IContentPrefetcherTaskTrigger interfaces
    */
    struct Vtbl extends IInspectable.Vtbl {
        TriggerContentPrefetcherTask   : IntPtr
        IsRegisteredForContentPrefetch : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IContentPrefetcherTaskTrigger.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Triggers a content prefetch background task for the specified app package.
     * @param {PWSTR} packageFullName The package ID.
     * @returns {HRESULT} Returns S_OK on success. Other possible values include:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The provided package ID is not an installed package that has registered for the content prefetch background task, or the package ID is empty or null.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ACCESSDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method call was not made at the required Medium Integrity Level (Medium IL).
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/icontentprefetchertasktrigger/nf-icontentprefetchertasktrigger-icontentprefetchertasktrigger-triggercontentprefetchertask
     */
    TriggerContentPrefetcherTask(packageFullName) {
        packageFullName := packageFullName is String ? StrPtr(packageFullName) : packageFullName

        result := ComCall(6, this, "ptr", packageFullName, "HRESULT")
        return result
    }

    /**
     * Indicates if an app package has registered for the content prefetch background task.
     * @param {PWSTR} packageFullName The package ID.
     * @returns {Integer} True if the app package has registered for the content prefetch background task; otherwise, false.
     * @see https://learn.microsoft.com/windows/win32/api/icontentprefetchertasktrigger/nf-icontentprefetchertasktrigger-icontentprefetchertasktrigger-isregisteredforcontentprefetch
     */
    IsRegisteredForContentPrefetch(packageFullName) {
        packageFullName := packageFullName is String ? StrPtr(packageFullName) : packageFullName

        result := ComCall(7, this, "ptr", packageFullName, "char*", &isRegistered := 0, "HRESULT")
        return isRegistered
    }

    Query(iid) {
        if (IContentPrefetcherTaskTrigger.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.TriggerContentPrefetcherTask := CallbackCreate(GetMethod(implObj, "TriggerContentPrefetcherTask"), flags, 2)
        this.vtbl.IsRegisteredForContentPrefetch := CallbackCreate(GetMethod(implObj, "IsRegisteredForContentPrefetch"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.TriggerContentPrefetcherTask)
        CallbackFree(this.vtbl.IsRegisteredForContentPrefetch)
    }
}
