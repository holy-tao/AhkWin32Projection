#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IBackgroundCopyFile3.ahk" { IBackgroundCopyFile3 }

/**
 * Use this interface to retrieve download statistics for peers and origin servers.
 * @see https://learn.microsoft.com/windows/win32/api/bits4_0/nn-bits4_0-ibackgroundcopyfile4
 * @namespace Windows.Win32.Networking.BackgroundIntelligentTransferService
 */
export default struct IBackgroundCopyFile4 extends IBackgroundCopyFile3 {
    /**
     * The interface identifier for IBackgroundCopyFile4
     * @type {Guid}
     */
    static IID := Guid("{ef7e0655-7888-4960-b0e5-730846e03492}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IBackgroundCopyFile4 interfaces
    */
    struct Vtbl extends IBackgroundCopyFile3.Vtbl {
        GetPeerDownloadStats : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IBackgroundCopyFile4.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Specifies statistics about the amount of data downloaded from peers and origin servers.
     * @param {Pointer<Integer>} pFromOrigin Specifies the amount of file data downloaded from the originating server.
     * @param {Pointer<Integer>} pFromPeers Specifies the amount of file data downloaded from a peer-to-peer source.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/bits4_0/nf-bits4_0-ibackgroundcopyfile4-getpeerdownloadstats
     */
    GetPeerDownloadStats(pFromOrigin, pFromPeers) {
        pFromOriginMarshal := pFromOrigin is VarRef ? "uint*" : "ptr"
        pFromPeersMarshal := pFromPeers is VarRef ? "uint*" : "ptr"

        result := ComCall(12, this, pFromOriginMarshal, pFromOrigin, pFromPeersMarshal, pFromPeers, "HRESULT")
        return result
    }

    Query(iid) {
        if (IBackgroundCopyFile4.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetPeerDownloadStats := CallbackCreate(GetMethod(implObj, "GetPeerDownloadStats"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetPeerDownloadStats)
    }
}
