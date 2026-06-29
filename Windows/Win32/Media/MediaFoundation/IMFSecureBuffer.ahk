#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFSecureBuffer extends IUnknown {
    /**
     * The interface identifier for IMFSecureBuffer
     * @type {Guid}
     */
    static IID := Guid("{c1209904-e584-4752-a2d6-7f21693f8b21}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFSecureBuffer interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetIdentifier : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFSecureBuffer.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {Guid} 
     */
    GetIdentifier() {
        pGuidIdentifier := Guid()
        result := ComCall(3, this, Guid.Ptr, pGuidIdentifier, "HRESULT")
        return pGuidIdentifier
    }

    Query(iid) {
        if (IMFSecureBuffer.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetIdentifier := CallbackCreate(GetMethod(implObj, "GetIdentifier"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetIdentifier)
    }
}
