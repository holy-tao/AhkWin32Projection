#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IMSVidGraphSegment.ahk" { IMSVidGraphSegment }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IMSVidCompositionSegment extends IMSVidGraphSegment {
    /**
     * The interface identifier for IMSVidCompositionSegment
     * @type {Guid}
     */
    static IID := Guid("{1c15d483-911d-11d2-b632-00c04f79498e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMSVidCompositionSegment interfaces
    */
    struct Vtbl extends IMSVidGraphSegment.Vtbl {
        Compose  : IntPtr
        get_Up   : IntPtr
        get_Down : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMSVidCompositionSegment.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {IMSVidGraphSegment} 
     */
    Up {
        get => this.get_Up()
    }

    /**
     * @type {IMSVidGraphSegment} 
     */
    Down {
        get => this.get_Down()
    }

    /**
     * 
     * @param {IMSVidGraphSegment} upstream 
     * @param {IMSVidGraphSegment} downstream 
     * @returns {HRESULT} 
     */
    Compose(upstream, downstream) {
        result := ComCall(19, this, "ptr", upstream, "ptr", downstream, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IMSVidGraphSegment} 
     */
    get_Up() {
        result := ComCall(20, this, "ptr*", &upstream := 0, "HRESULT")
        return IMSVidGraphSegment(upstream)
    }

    /**
     * 
     * @returns {IMSVidGraphSegment} 
     */
    get_Down() {
        result := ComCall(21, this, "ptr*", &downstream := 0, "HRESULT")
        return IMSVidGraphSegment(downstream)
    }

    Query(iid) {
        if (IMSVidCompositionSegment.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Compose := CallbackCreate(GetMethod(implObj, "Compose"), flags, 3)
        this.vtbl.get_Up := CallbackCreate(GetMethod(implObj, "get_Up"), flags, 2)
        this.vtbl.get_Down := CallbackCreate(GetMethod(implObj, "get_Down"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Compose)
        CallbackFree(this.vtbl.get_Up)
        CallbackFree(this.vtbl.get_Down)
    }
}
