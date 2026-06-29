#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Retrieves the activity identifier associated with the current object context.
 * @remarks
 * You obtain a reference to an object's <b>IObjectContextActivity</b> interface by calling <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> on the object's context, as in the following example:
 * 
 * 
 * ``` syntax
 * hr = m_pIObjectContext-&gt;QueryInterface(
 *             IID_IObjectContextActivity, 
 *             (void**)&amp;m_pIObjectContextActivity);
 * 
 * ```
 * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nn-comsvcs-iobjectcontextactivity
 * @namespace Windows.Win32.System.ComponentServices
 */
export default struct IObjectContextActivity extends IUnknown {
    /**
     * The interface identifier for IObjectContextActivity
     * @type {Guid}
     */
    static IID := Guid("{51372afc-cae7-11cf-be81-00aa00a2fa25}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IObjectContextActivity interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetActivityId : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IObjectContextActivity.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves the GUID associated with the current activity.
     * @param {Pointer<Guid>} pGUID A reference to the GUID associated with the current activity.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-iobjectcontextactivity-getactivityid
     */
    GetActivityId(pGUID) {
        result := ComCall(3, this, Guid.Ptr, pGUID, "HRESULT")
        return result
    }

    Query(iid) {
        if (IObjectContextActivity.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetActivityId := CallbackCreate(GetMethod(implObj, "GetActivityId"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetActivityId)
    }
}
