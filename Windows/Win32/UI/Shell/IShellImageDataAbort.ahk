#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes a single method used to abort IShellImageData processes.
 * @remarks
 * This interface is not expected to be available in later versions of Windows. It is recommended that Windows GDI+ APIs be used in place of <a href="https://docs.microsoft.com/windows/desktop/api/shimgdata/nn-shimgdata-ishellimagedata">IShellImageData</a> methods.
 * 
 * This interface was not included in a public header file prior to Windows Vista.
 * @see https://learn.microsoft.com/windows/win32/api/shimgdata/nn-shimgdata-ishellimagedataabort
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IShellImageDataAbort extends IUnknown {
    /**
     * The interface identifier for IShellImageDataAbort
     * @type {Guid}
     */
    static IID := Guid("{53fb8e58-50c0-4003-b4aa-0c8df28e7f3a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IShellImageDataAbort interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        QueryAbort : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IShellImageDataAbort.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Aborts an IShellImageData process such as Decode, Draw, or Scale. This is a callback method.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if the <a href="https://docs.microsoft.com/windows/desktop/api/shimgdata/nn-shimgdata-ishellimagedata">IShellImageData</a> process should continue, or S_FALSE if it should be aborted.
     * @see https://learn.microsoft.com/windows/win32/api/shimgdata/nf-shimgdata-ishellimagedataabort-queryabort
     */
    QueryAbort() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IShellImageDataAbort.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.QueryAbort := CallbackCreate(GetMethod(implObj, "QueryAbort"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.QueryAbort)
    }
}
