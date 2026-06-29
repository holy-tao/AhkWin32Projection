#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IUnknown.ahk" { IUnknown }

/**
 * The ICallFactory (objidlbase.h) interface creates a call object for processing calls to the methods of an asynchronous interface.
 * @see https://learn.microsoft.com/windows/win32/api/objidlbase/nn-objidlbase-icallfactory
 * @namespace Windows.Win32.System.Com
 */
export default struct ICallFactory extends IUnknown {
    /**
     * The interface identifier for ICallFactory
     * @type {Guid}
     */
    static IID := Guid("{1c733a30-2a1c-11ce-ade5-00aa0044773d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICallFactory interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        CreateCall : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICallFactory.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The ICallFactory::CreateCall (objidlbase.h) method creates an instance of the call object that corresponds to a specified asynchronous interface.
     * @param {Pointer<Guid>} riid A reference to the identifier for the asynchronous interface.
     * @param {IUnknown} pCtrlUnk A pointer to the controlling <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> of the call object. If this parameter is not <b>NULL</b>, the call object is aggregated in the specified object.
     * If this parameter is <b>NULL</b>, the call object is not aggregated.
     * @param {Pointer<Guid>} riid2 The identifier of an interface on the call object. Typical values are IID_IUnknown and IID_ISynchronize.
     * @returns {IUnknown} The address of a pointer to the interface specified by <i>riid2</i>. This parameter cannot be <b>NULL</b>.
     * @see https://learn.microsoft.com/windows/win32/api/objidlbase/nf-objidlbase-icallfactory-createcall
     */
    CreateCall(riid, pCtrlUnk, riid2) {
        result := ComCall(3, this, Guid.Ptr, riid, "ptr", pCtrlUnk, Guid.Ptr, riid2, "ptr*", &ppv := 0, "HRESULT")
        return IUnknown(ppv)
    }

    Query(iid) {
        if (ICallFactory.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateCall := CallbackCreate(GetMethod(implObj, "CreateCall"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateCall)
    }
}
