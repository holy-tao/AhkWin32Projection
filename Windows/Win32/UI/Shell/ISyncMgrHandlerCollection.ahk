#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IEnumString.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that provide an enumerator of sync handler IDs and instantiate those sync handlers.
 * @remarks
 * 
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
 * 
 * @see https://docs.microsoft.com/windows/win32/api//syncmgr/nn-syncmgr-isyncmgrhandlercollection
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class ISyncMgrHandlerCollection extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISyncMgrHandlerCollection
     * @type {Guid}
     */
    static IID => Guid("{a7f337a3-d20b-45cb-9ed7-87d094ca5045}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetHandlerEnumerator", "BindToHandler"]

    /**
     * Gets an enumerator that provides access to the IDs of sync handlers exposed to and managed by the user.
     * @returns {IEnumString} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ienumstring">IEnumString</a>**</b>
     * 
     * When this method returns, contains an address of a pointer to an instance of <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ienumstring">IEnumString</a> that enumerates the IDs of known sync handlers.
     * @see https://docs.microsoft.com/windows/win32/api//syncmgr/nf-syncmgr-isyncmgrhandlercollection-gethandlerenumerator
     */
    GetHandlerEnumerator() {
        result := ComCall(3, this, "ptr*", &ppenum := 0, "HRESULT")
        return IEnumString(ppenum)
    }

    /**
     * Instantiates a specified sync handler when called by Sync Center.
     * @param {PWSTR} pszHandlerID Type: <b>LPCWSTR</b>
     * 
     * The ID of the sync handler.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * The IID of the requested interface. This will typically be IID_ISyncMgrHandler. If the method fails when passed IID_ISyncMgrHandler, it is recalled using IID_ISyncMgrSynchronize, the IID of the older <a href="https://docs.microsoft.com/windows/desktop/api/mobsync/nn-mobsync-isyncmgrsynchronize">ISyncMgrSynchronize</a> interface. When the method returns successfully, a pointer to the requested interface is referenced in the <i>ppv</i> parameter.
     * @returns {Pointer<Void>} Type: <b>void**</b>
     * 
     * When this method returns, contains an address of a pointer to an interface representing the sync handler.
     * @see https://docs.microsoft.com/windows/win32/api//syncmgr/nf-syncmgr-isyncmgrhandlercollection-bindtohandler
     */
    BindToHandler(pszHandlerID, riid) {
        pszHandlerID := pszHandlerID is String ? StrPtr(pszHandlerID) : pszHandlerID

        result := ComCall(4, this, "ptr", pszHandlerID, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }
}
