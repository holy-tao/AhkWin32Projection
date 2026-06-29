#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ISVGAnimatedTransformList.ahk" { ISVGAnimatedTransformList }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct ISVGTransformable extends IDispatch {
    /**
     * The interface identifier for ISVGTransformable
     * @type {Guid}
     */
    static IID := Guid("{305104dc-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISVGTransformable interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_transform : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISVGTransformable.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {ISVGAnimatedTransformList} 
     */
    transform {
        get => this.get_transform()
    }

    /**
     * 
     * @returns {ISVGAnimatedTransformList} 
     */
    get_transform() {
        result := ComCall(7, this, "ptr*", &p := 0, "HRESULT")
        return ISVGAnimatedTransformList(p)
    }

    Query(iid) {
        if (ISVGTransformable.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_transform := CallbackCreate(GetMethod(implObj, "get_transform"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_transform)
    }
}
