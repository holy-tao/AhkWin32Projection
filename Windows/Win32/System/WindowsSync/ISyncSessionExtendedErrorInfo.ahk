#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISyncProvider.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Represents information about which provider caused synchronization to fail.
 * @see https://docs.microsoft.com/windows/win32/api//winsync/nn-winsync-isyncsessionextendederrorinfo
 * @namespace Windows.Win32.System.WindowsSync
 * @version v4.0.30319
 */
class ISyncSessionExtendedErrorInfo extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISyncSessionExtendedErrorInfo
     * @type {Guid}
     */
    static IID => Guid("{326c6810-790a-409b-b741-6999388761eb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetSyncProviderWithError"]

    /**
     * Gets the ISyncProvider interface of the provider that caused synchronization to fail.
     * @returns {ISyncProvider} The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winsync/nn-winsync-isyncprovider">ISyncProvider</a> interface of the provider that caused synchronization to fail.
     * @see https://docs.microsoft.com/windows/win32/api//winsync/nf-winsync-isyncsessionextendederrorinfo-getsyncproviderwitherror
     */
    GetSyncProviderWithError() {
        result := ComCall(3, this, "ptr*", &ppProviderWithError := 0, "HRESULT")
        return ISyncProvider(ppProviderWithError)
    }
}
