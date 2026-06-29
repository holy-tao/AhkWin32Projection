#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * Exposes a method to return information about a local object.
 * @see https://learn.microsoft.com/windows/win32/api/msaatext/nn-msaatext-icocreatedlocally
 * @namespace Windows.Win32.UI.TextServices
 */
export default struct ICoCreatedLocally extends IUnknown {
    /**
     * The interface identifier for ICoCreatedLocally
     * @type {Guid}
     */
    static IID := Guid("{0a53eb6c-1908-4742-8cff-2cee2e93f94c}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICoCreatedLocally interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        LocalInit : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICoCreatedLocally.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Implemented by clients to return information about the local object.Note  Active Accessibility Text Services is deprecated.
     * @param {IUnknown} punkLocalObject Type: <b>IUnknown*</b>
     * 
     * A pointer to the server object.
     * @param {Pointer<Guid>} riidParam Type: <b>REFIID</b>
     * 
     * An optional interface parameter that is passed to the new helper object. This parameter specifies an interface identifier.
     * @param {IUnknown} punkParam Type: <b>IUnknown*</b>
     * 
     * An optional interface parameter that is passed to the new helper object. This parameter specifies the interface pointer.
     * @param {VARIANT} varParam Type: <b>VARIANT</b>
     * 
     * An optional interface parameter that is passed to the new helper object.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If successful, returns S_OK. If not successful, returns a standard <a href="https://docs.microsoft.com/windows/desktop/WinAuto/return-values">COM error code</a>.
     * @see https://learn.microsoft.com/windows/win32/api/msaatext/nf-msaatext-icocreatedlocally-localinit
     */
    LocalInit(punkLocalObject, riidParam, punkParam, varParam) {
        result := ComCall(3, this, "ptr", punkLocalObject, Guid.Ptr, riidParam, "ptr", punkParam, VARIANT, varParam, "HRESULT")
        return result
    }

    Query(iid) {
        if (ICoCreatedLocally.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.LocalInit := CallbackCreate(GetMethod(implObj, "LocalInit"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.LocalInit)
    }
}
