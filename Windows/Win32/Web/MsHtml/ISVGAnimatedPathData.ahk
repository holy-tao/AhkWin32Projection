#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ISVGPathSegList.ahk" { ISVGPathSegList }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct ISVGAnimatedPathData extends IDispatch {
    /**
     * The interface identifier for ISVGAnimatedPathData
     * @type {Guid}
     */
    static IID := Guid("{30510511-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISVGAnimatedPathData interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        putref_pathSegList                   : IntPtr
        get_pathSegList                      : IntPtr
        putref_normalizedPathSegList         : IntPtr
        get_normalizedPathSegList            : IntPtr
        putref_animatedPathSegList           : IntPtr
        get_animatedPathSegList              : IntPtr
        putref_animatedNormalizedPathSegList : IntPtr
        get_animatedNormalizedPathSegList    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISVGAnimatedPathData.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {ISVGPathSegList} 
     */
    pathSegList {
        get => this.get_pathSegList()
    }

    /**
     * @type {ISVGPathSegList} 
     */
    normalizedPathSegList {
        get => this.get_normalizedPathSegList()
    }

    /**
     * @type {ISVGPathSegList} 
     */
    animatedPathSegList {
        get => this.get_animatedPathSegList()
    }

    /**
     * @type {ISVGPathSegList} 
     */
    animatedNormalizedPathSegList {
        get => this.get_animatedNormalizedPathSegList()
    }

    /**
     * 
     * @param {ISVGPathSegList} v 
     * @returns {HRESULT} 
     */
    putref_pathSegList(v) {
        result := ComCall(7, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {ISVGPathSegList} 
     */
    get_pathSegList() {
        result := ComCall(8, this, "ptr*", &p := 0, "HRESULT")
        return ISVGPathSegList(p)
    }

    /**
     * 
     * @param {ISVGPathSegList} v 
     * @returns {HRESULT} 
     */
    putref_normalizedPathSegList(v) {
        result := ComCall(9, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {ISVGPathSegList} 
     */
    get_normalizedPathSegList() {
        result := ComCall(10, this, "ptr*", &p := 0, "HRESULT")
        return ISVGPathSegList(p)
    }

    /**
     * 
     * @param {ISVGPathSegList} v 
     * @returns {HRESULT} 
     */
    putref_animatedPathSegList(v) {
        result := ComCall(11, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {ISVGPathSegList} 
     */
    get_animatedPathSegList() {
        result := ComCall(12, this, "ptr*", &p := 0, "HRESULT")
        return ISVGPathSegList(p)
    }

    /**
     * 
     * @param {ISVGPathSegList} v 
     * @returns {HRESULT} 
     */
    putref_animatedNormalizedPathSegList(v) {
        result := ComCall(13, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {ISVGPathSegList} 
     */
    get_animatedNormalizedPathSegList() {
        result := ComCall(14, this, "ptr*", &p := 0, "HRESULT")
        return ISVGPathSegList(p)
    }

    Query(iid) {
        if (ISVGAnimatedPathData.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.putref_pathSegList := CallbackCreate(GetMethod(implObj, "putref_pathSegList"), flags, 2)
        this.vtbl.get_pathSegList := CallbackCreate(GetMethod(implObj, "get_pathSegList"), flags, 2)
        this.vtbl.putref_normalizedPathSegList := CallbackCreate(GetMethod(implObj, "putref_normalizedPathSegList"), flags, 2)
        this.vtbl.get_normalizedPathSegList := CallbackCreate(GetMethod(implObj, "get_normalizedPathSegList"), flags, 2)
        this.vtbl.putref_animatedPathSegList := CallbackCreate(GetMethod(implObj, "putref_animatedPathSegList"), flags, 2)
        this.vtbl.get_animatedPathSegList := CallbackCreate(GetMethod(implObj, "get_animatedPathSegList"), flags, 2)
        this.vtbl.putref_animatedNormalizedPathSegList := CallbackCreate(GetMethod(implObj, "putref_animatedNormalizedPathSegList"), flags, 2)
        this.vtbl.get_animatedNormalizedPathSegList := CallbackCreate(GetMethod(implObj, "get_animatedNormalizedPathSegList"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.putref_pathSegList)
        CallbackFree(this.vtbl.get_pathSegList)
        CallbackFree(this.vtbl.putref_normalizedPathSegList)
        CallbackFree(this.vtbl.get_normalizedPathSegList)
        CallbackFree(this.vtbl.putref_animatedPathSegList)
        CallbackFree(this.vtbl.get_animatedPathSegList)
        CallbackFree(this.vtbl.putref_animatedNormalizedPathSegList)
        CallbackFree(this.vtbl.get_animatedNormalizedPathSegList)
    }
}
