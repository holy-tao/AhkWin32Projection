#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes a method to discover objects that are named with a GUID from another object. Unlike QueryService this interface will not delegate its functionality on to other objects.
 * @remarks
 * Similar to <a href="https://docs.microsoft.com/previous-versions/windows/internet-explorer/ie-developer/platform-apis/cc678965(v=vs.85)">IServiceProvider</a>, except that this method does not imply that unhandled or unknown requests should be forwarded.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-iobjectprovider
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IObjectProvider extends IUnknown {
    /**
     * The interface identifier for IObjectProvider
     * @type {Guid}
     */
    static IID := Guid("{a6087428-3be3-4d73-b308-7c04a540bf1a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IObjectProvider interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        QueryObject : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IObjectProvider.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Queries for a specified object.
     * @remarks
     * Object implementers that want to enable the discovery of other objects that they can produce or that they hold should implement <b>IObjectProvider::QueryObject</b> and publish the <b>GUID</b> values that name those objects for clients of that object. Note that objects should not pass on the request for an object to other objects like <a href="https://docs.microsoft.com/previous-versions/windows/internet-explorer/ie-developer/platform-apis/cc678966(v=vs.85)">QueryService</a>.
     * @param {Pointer<Guid>} guidObject Type: <b>REFGUID</b>
     * 
     * A reference to the <b>GUID</b> used to identify the object.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * Specifies the desired interface ID.
     * @returns {Pointer<Void>} Type: <b>void**</b>
     * 
     * On success, contains the address of a pointer to the object specified by <i>riid</i>.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iobjectprovider-queryobject
     */
    QueryObject(guidObject, riid) {
        result := ComCall(3, this, Guid.Ptr, guidObject, Guid.Ptr, riid, "ptr*", &ppvOut := 0, "HRESULT")
        return ppvOut
    }

    Query(iid) {
        if (IObjectProvider.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.QueryObject := CallbackCreate(GetMethod(implObj, "QueryObject"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.QueryObject)
    }
}
