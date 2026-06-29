#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Not supported. This interface may be absent in later versions of Windows. (IComputerInfoChangeNotify)
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nn-shobjidl-icomputerinfochangenotify
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IComputerInfoChangeNotify extends IUnknown {
    /**
     * The interface identifier for IComputerInfoChangeNotify
     * @type {Guid}
     */
    static IID := Guid("{0df60d92-6818-46d6-b358-d66170dde466}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IComputerInfoChangeNotify interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        ComputerInfoChanged : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IComputerInfoChangeNotify.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Not supported. This interface may be absent in later versions of Windows. (IComputerInfoChangeNotify.ComputerInfoChanged)
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-icomputerinfochangenotify-computerinfochanged
     */
    ComputerInfoChanged() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IComputerInfoChangeNotify.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.ComputerInfoChanged := CallbackCreate(GetMethod(implObj, "ComputerInfoChanged"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.ComputerInfoChanged)
    }
}
