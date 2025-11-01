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
     * 
     * @param {PWSTR} packageFullName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/icontentprefetchertasktrigger/nf-icontentprefetchertasktrigger-icontentprefetchertasktrigger-triggercontentprefetchertask
     */
    TriggerContentPrefetcherTask(packageFullName) {
        packageFullName := packageFullName is String ? StrPtr(packageFullName) : packageFullName

        result := ComCall(6, this, "ptr", packageFullName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} packageFullName 
     * @param {Pointer<Integer>} isRegistered 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/icontentprefetchertasktrigger/nf-icontentprefetchertasktrigger-icontentprefetchertasktrigger-isregisteredforcontentprefetch
     */
    IsRegisteredForContentPrefetch(packageFullName, isRegistered) {
        packageFullName := packageFullName is String ? StrPtr(packageFullName) : packageFullName

        isRegisteredMarshal := isRegistered is VarRef ? "char*" : "ptr"

        result := ComCall(7, this, "ptr", packageFullName, isRegisteredMarshal, isRegistered, "HRESULT")
        return result
    }
}
