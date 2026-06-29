#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IEnumString.ahk" { IEnumString }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes methods that provide an enumerator of sync handler IDs and instantiate those sync handlers.
 * @remarks
 * The author of a sync handler implements this interface to support multiple devices or computers and sync their details independently. Sync Center uses the handler collection to request instantiation of individual sync handlers. <b>ISyncMgrHandlerCollection</b> also allows a sync handler author to add handlers dynamically to Sync Center as opposed to registering each one individually in the registry.
 * 
 * The following example shows an outline implementation of this interface.
 * 
 * 
 * ```cpp
 * class CMyHandlerCollection : public ISyncMgrHandlerCollection
 * {
 * public:
 *     // IUnknown
 *     // ISyncMgrHandlerCollection
 *     IFACEMETHODIMP GetHandlerEnumerator(__out IEnumString **ppenum);
 *     IFACEMETHODIMP BindToHandler(
 *         __in LPCWSTR    pszHandlerID,
 *         __in REFIID     riid,
 *         __out void    **ppv);
 * };
 * 
 * STDMETHODIMP CMyHandlerCollection::GetHandlerEnumerator(
 *     __out IEnumString **ppenum)
 * {
 *     // IDs are retrieved from a data source such as the registry.
 *     // IDs could be retrieved either by this collection class 
 *     // or the factory method.
 *     return CEnumMyHandlerIDs_Create(ppenum);
 * }
 * 
 * STDMETHODIMP CMyHandlerCollection::BindToHandler(
 *     __in LPCWSTR    pszHandlerID,
 *     __in REFIID     riid,
 *     __out void    **ppv)
 * {
 *     // Map the pszHandlerID to the handler to create. This could be done
 *     // by the factory method or by some other method.
 *     return CMyHandler_Create(pszHandlerID, riid, ppv);
 * }
 * 
 * ```
 * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nn-syncmgr-isyncmgrhandlercollection
 * @namespace Windows.Win32.UI.Shell
 */
export default struct ISyncMgrHandlerCollection extends IUnknown {
    /**
     * The interface identifier for ISyncMgrHandlerCollection
     * @type {Guid}
     */
    static IID := Guid("{a7f337a3-d20b-45cb-9ed7-87d094ca5045}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISyncMgrHandlerCollection interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetHandlerEnumerator : IntPtr
        BindToHandler        : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISyncMgrHandlerCollection.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets an enumerator that provides access to the IDs of sync handlers exposed to and managed by the user.
     * @remarks
     * A sync handler ID is a string that uniquely represents the handler. The ID must be unique across all handlers in the system and is limited to a maximum length of <b>MAX_SYNCMGR_ID</b>, including the terminating null character.
     * 
     * Earlier versions of Windows relied on GUIDs to represent handler and item IDs. Windows Vista uses strings for their greater flexibility. It is still recommended that the string contain a GUID to ensure uniqueness, but it can also contain other information of use to the handler, specific to the application or device.
     * @returns {IEnumString} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ienumstring">IEnumString</a>**</b>
     * 
     * When this method returns, contains an address of a pointer to an instance of <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ienumstring">IEnumString</a> that enumerates the IDs of known sync handlers.
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgrhandlercollection-gethandlerenumerator
     */
    GetHandlerEnumerator() {
        result := ComCall(3, this, "ptr*", &ppenum := 0, "HRESULT")
        return IEnumString(ppenum)
    }

    /**
     * Instantiates a specified sync handler when called by Sync Center.
     * @remarks
     * It is possible for this method to be called by Sync Center without it first calling <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nf-syncmgr-isyncmgrhandlercollection-gethandlerenumerator">ISyncMgrHandlerCollection::GetHandlerEnumerator</a>. This is because Sync Center caches information about handlers and their items. The handler collection can return an interface pointer for an existing sync handler or it can create a new instance.
     * @param {PWSTR} pszHandlerID Type: <b>LPCWSTR</b>
     * 
     * The ID of the sync handler.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * The IID of the requested interface. This will typically be IID_ISyncMgrHandler. If the method fails when passed IID_ISyncMgrHandler, it is recalled using IID_ISyncMgrSynchronize, the IID of the older <a href="https://docs.microsoft.com/windows/desktop/api/mobsync/nn-mobsync-isyncmgrsynchronize">ISyncMgrSynchronize</a> interface. When the method returns successfully, a pointer to the requested interface is referenced in the <i>ppv</i> parameter.
     * @returns {Pointer<Void>} Type: <b>void**</b>
     * 
     * When this method returns, contains an address of a pointer to an interface representing the sync handler.
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgrhandlercollection-bindtohandler
     */
    BindToHandler(pszHandlerID, riid) {
        pszHandlerID := pszHandlerID is String ? StrPtr(pszHandlerID) : pszHandlerID

        result := ComCall(4, this, "ptr", pszHandlerID, Guid.Ptr, riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    Query(iid) {
        if (ISyncMgrHandlerCollection.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetHandlerEnumerator := CallbackCreate(GetMethod(implObj, "GetHandlerEnumerator"), flags, 2)
        this.vtbl.BindToHandler := CallbackCreate(GetMethod(implObj, "BindToHandler"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetHandlerEnumerator)
        CallbackFree(this.vtbl.BindToHandler)
    }
}
