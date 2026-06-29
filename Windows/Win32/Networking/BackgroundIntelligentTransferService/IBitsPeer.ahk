#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Use IBitsPeer to get information about a peer in the neighborhood.
 * @see https://learn.microsoft.com/windows/win32/api/bits3_0/nn-bits3_0-ibitspeer
 * @namespace Windows.Win32.Networking.BackgroundIntelligentTransferService
 */
export default struct IBitsPeer extends IUnknown {
    /**
     * The interface identifier for IBitsPeer
     * @type {Guid}
     */
    static IID := Guid("{659cdea2-489e-11d9-a9cd-000d56965251}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IBitsPeer interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetPeerName     : IntPtr
        IsAuthenticated : IntPtr
        IsAvailable     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IBitsPeer.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the server principal name that uniquely identifies the peer.
     * @remarks
     * The principal name ensures the unique identity of the peer computer and is the entity that Kerberos authenticates.
     * @returns {PWSTR} Null-terminated string that contains the server principal name of the peer. The principal name is of the form, server$.domain.suffix. Call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function to free <i>pName</i> when done.
     * @see https://learn.microsoft.com/windows/win32/api/bits3_0/nf-bits3_0-ibitspeer-getpeername
     */
    GetPeerName() {
        result := ComCall(3, this, PWSTR.Ptr, &pName := 0, "HRESULT")
        return pName
    }

    /**
     * Determines whether the peer is authenticated.
     * @remarks
     * BITS cannot download content from an unauthenticated peer. When peers are detected, they are initially not authenticated.  BITS contacts peers when downloading a job that is enabled for peercaching; BITS authenticates a given peer the first time it is contacted.
     * @returns {BOOL} <b>TRUE</b> if the peer is authenticated, otherwise, <b>FALSE</b>.
     * @see https://learn.microsoft.com/windows/win32/api/bits3_0/nf-bits3_0-ibitspeer-isauthenticated
     */
    IsAuthenticated() {
        result := ComCall(4, this, BOOL.Ptr, &pAuth := 0, "HRESULT")
        return pAuth
    }

    /**
     * Determines whether the peer is available (online) to serve content.
     * @remarks
     * If this peer goes offline while BITS is downloading content from it, BITS immediately begins downloading from the origin server. 
     * 
     * If the peer stays offline for an extended period of time, BITS removes the peer from the neighborhood.
     * @returns {BOOL} <b>TRUE</b> if the peer is available to serve content, otherwise, <b>FALSE</b>.
     * @see https://learn.microsoft.com/windows/win32/api/bits3_0/nf-bits3_0-ibitspeer-isavailable
     */
    IsAvailable() {
        result := ComCall(5, this, BOOL.Ptr, &pOnline := 0, "HRESULT")
        return pOnline
    }

    Query(iid) {
        if (IBitsPeer.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetPeerName := CallbackCreate(GetMethod(implObj, "GetPeerName"), flags, 2)
        this.vtbl.IsAuthenticated := CallbackCreate(GetMethod(implObj, "IsAuthenticated"), flags, 2)
        this.vtbl.IsAvailable := CallbackCreate(GetMethod(implObj, "IsAvailable"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetPeerName)
        CallbackFree(this.vtbl.IsAuthenticated)
        CallbackFree(this.vtbl.IsAvailable)
    }
}
