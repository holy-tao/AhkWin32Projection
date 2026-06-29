#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ISyncProvider.ahk" { ISyncProvider }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Represents information about which provider caused synchronization to fail.
 * @see https://learn.microsoft.com/windows/win32/api/winsync/nn-winsync-isyncsessionextendederrorinfo
 * @namespace Windows.Win32.System.WindowsSync
 */
export default struct ISyncSessionExtendedErrorInfo extends IUnknown {
    /**
     * The interface identifier for ISyncSessionExtendedErrorInfo
     * @type {Guid}
     */
    static IID := Guid("{326c6810-790a-409b-b741-6999388761eb}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISyncSessionExtendedErrorInfo interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetSyncProviderWithError : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISyncSessionExtendedErrorInfo.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the ISyncProvider interface of the provider that caused synchronization to fail.
     * @remarks
     * The destination provider indicates which provider caused synchronization to fail during processing of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winsync/nf-winsync-iknowledgesyncprovider-processchangebatch">IKnowledgeSyncProvider::ProcessChangeBatch</a> method by using <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winsync/nf-winsync-isyncsessionstate2-setproviderwitherror">ISyncSessionState2::SetProviderWithError</a>. <b>ISyncSessionExtendedErrorInfo::GetSyncProviderWithError</b> is used by an application to obtain the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winsync/nn-winsync-isyncprovider">ISyncProvider</a> interface of the provider that caused the failure. The application can then query for other interfaces that are implemented by the provider, and call methods to handle the error.
     * @returns {ISyncProvider} The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winsync/nn-winsync-isyncprovider">ISyncProvider</a> interface of the provider that caused synchronization to fail.
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-isyncsessionextendederrorinfo-getsyncproviderwitherror
     */
    GetSyncProviderWithError() {
        result := ComCall(3, this, "ptr*", &ppProviderWithError := 0, "HRESULT")
        return ISyncProvider(ppProviderWithError)
    }

    Query(iid) {
        if (ISyncSessionExtendedErrorInfo.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetSyncProviderWithError := CallbackCreate(GetMethod(implObj, "GetSyncProviderWithError"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetSyncProviderWithError)
    }
}
