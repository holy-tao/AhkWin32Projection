#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Com\IUnknown.ahk" { IUnknown }

/**
 * This interface is not currently implemented.
 * @see https://learn.microsoft.com/windows/win32/api/windowsstoragecom/nn-windowsstoragecom-ioplockbreakinghandler
 * @namespace Windows.Win32.System.WinRT.Storage
 */
export default struct IOplockBreakingHandler extends IUnknown {
    /**
     * The interface identifier for IOplockBreakingHandler
     * @type {Guid}
     */
    static IID := Guid("{826abe3d-3acd-47d3-84f2-88aaedcf6304}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IOplockBreakingHandler interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OplockBreaking : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IOplockBreakingHandler.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * This method is not currently implemented. (IOplockBreakingHandler.OplockBreaking)
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/windowsstoragecom/nf-windowsstoragecom-ioplockbreakinghandler-oplockbreaking
     */
    OplockBreaking() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IOplockBreakingHandler.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OplockBreaking := CallbackCreate(GetMethod(implObj, "OplockBreaking"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OplockBreaking)
    }
}
