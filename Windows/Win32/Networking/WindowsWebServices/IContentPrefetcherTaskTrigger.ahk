#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\WinRT\IInspectable.ahk

/**
 * The IContentPrefetcherTaskTrigger interface supports content prefetching behavior and performance testing by defining methods that allow you to verify that an installed app package is registered for this background task and manually trigger its content prefetch operations.
 * @see https://docs.microsoft.com/windows/win32/api//icontentprefetchertasktrigger/nn-icontentprefetchertasktrigger-icontentprefetchertasktrigger
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class IContentPrefetcherTaskTrigger extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IContentPrefetcherTaskTrigger
     * @type {Guid}
     */
    static IID => Guid("{1b35a14a-6094-4799-a60e-e474e15d4dc9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["TriggerContentPrefetcherTask", "IsRegisteredForContentPrefetch"]

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
     * @see https://docs.microsoft.com/windows/win32/api//icontentprefetchertasktrigger/nf-icontentprefetchertasktrigger-icontentprefetchertasktrigger-triggercontentprefetchertask
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
     * @see https://docs.microsoft.com/windows/win32/api//icontentprefetchertasktrigger/nf-icontentprefetchertasktrigger-icontentprefetchertasktrigger-isregisteredforcontentprefetch
     */
    IsRegisteredForContentPrefetch(packageFullName) {
        packageFullName := packageFullName is String ? StrPtr(packageFullName) : packageFullName

        result := ComCall(7, this, "ptr", packageFullName, "char*", &isRegistered := 0, "HRESULT")
        return isRegistered
    }
}
