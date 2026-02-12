#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISyncProvider.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Represents information about which provider caused synchronization to fail.
 * @see https://learn.microsoft.com/windows/win32/api//content/winsync/nn-winsync-isyncsessionextendederrorinfo
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
     * @remarks
     * The destination provider indicates which provider caused synchronization to fail during processing of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winsync/nf-winsync-iknowledgesyncprovider-processchangebatch">IKnowledgeSyncProvider::ProcessChangeBatch</a> method by using <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winsync/nf-winsync-isyncsessionstate2-setproviderwitherror">ISyncSessionState2::SetProviderWithError</a>. <b>ISyncSessionExtendedErrorInfo::GetSyncProviderWithError</b> is used by an application to obtain the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winsync/nn-winsync-isyncprovider">ISyncProvider</a> interface of the provider that caused the failure. The application can then query for other interfaces that are implemented by the provider, and call methods to handle the error.
     * @returns {ISyncProvider} The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winsync/nn-winsync-isyncprovider">ISyncProvider</a> interface of the provider that caused synchronization to fail.
     * @see https://learn.microsoft.com/windows/win32/api//content/winsync/nf-winsync-isyncsessionextendederrorinfo-getsyncproviderwitherror
     */
    GetSyncProviderWithError() {
        result := ComCall(3, this, "ptr*", &ppProviderWithError := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ISyncProvider(ppProviderWithError)
    }
}
