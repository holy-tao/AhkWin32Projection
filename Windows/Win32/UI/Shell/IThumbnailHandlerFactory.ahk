#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IBindCtx.ahk" { IBindCtx }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "Common\ITEMIDLIST.ahk" { ITEMIDLIST }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes a method for retrieving the thumbnail handler of an item. Implement this interface if you want to specify what extractor is used for a child IDList.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-ithumbnailhandlerfactory
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IThumbnailHandlerFactory extends IUnknown {
    /**
     * The interface identifier for IThumbnailHandlerFactory
     * @type {Guid}
     */
    static IID := Guid("{e35b4b2e-00da-4bc1-9f13-38bc11f5d417}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IThumbnailHandlerFactory interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetThumbnailHandler : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IThumbnailHandlerFactory.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the requested thumbnail handler for the thumbnail of a given item.
     * @remarks
     * Windows Vista calls the <b>IThumbnailHandlerFactory::GetThumbnailHandler</b> method before falling back on <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishellfolder-getuiobjectof">GetUIObjectOf</a>.
     * @param {Pointer<ITEMIDLIST>} pidlChild Type: <b>PCUITEMID_CHILD</b>
     * 
     * The item within the namespace for which the thumbnail handler is being retrieved.
     * @param {IBindCtx} pbc Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ibindctx">IBindCtx</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ibindctx">IBindCtx</a> to be used during the moniker binding operation of this process.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * A reference to the IID of the interface requested. This is usually <a href="https://docs.microsoft.com/windows/desktop/api/thumbcache/nn-thumbcache-ithumbnailprovider">IThumbnailProvider</a> or <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-iextractimage">IExtractImage</a>.
     * @returns {Pointer<Void>} Type: <b>void**</b>
     * 
     * When this method returns, contains the address of a pointer to the requested thumbnail handler. If this method fails, this value is <b>NULL</b>.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ithumbnailhandlerfactory-getthumbnailhandler
     */
    GetThumbnailHandler(pidlChild, pbc, riid) {
        result := ComCall(3, this, ITEMIDLIST.Ptr, pidlChild, "ptr", pbc, Guid.Ptr, riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    Query(iid) {
        if (IThumbnailHandlerFactory.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetThumbnailHandler := CallbackCreate(GetMethod(implObj, "GetThumbnailHandler"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetThumbnailHandler)
    }
}
