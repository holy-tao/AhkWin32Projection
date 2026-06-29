#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import ".\ISVGStringList.ahk" { ISVGStringList }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct ISVGTests extends IDispatch {
    /**
     * The interface identifier for ISVGTests
     * @type {Guid}
     */
    static IID := Guid("{305104dd-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISVGTests interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_requiredFeatures   : IntPtr
        get_requiredExtensions : IntPtr
        get_systemLanguage     : IntPtr
        hasExtension           : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISVGTests.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {ISVGStringList} 
     */
    requiredFeatures {
        get => this.get_requiredFeatures()
    }

    /**
     * @type {ISVGStringList} 
     */
    requiredExtensions {
        get => this.get_requiredExtensions()
    }

    /**
     * @type {ISVGStringList} 
     */
    systemLanguage {
        get => this.get_systemLanguage()
    }

    /**
     * 
     * @returns {ISVGStringList} 
     */
    get_requiredFeatures() {
        result := ComCall(7, this, "ptr*", &p := 0, "HRESULT")
        return ISVGStringList(p)
    }

    /**
     * 
     * @returns {ISVGStringList} 
     */
    get_requiredExtensions() {
        result := ComCall(8, this, "ptr*", &p := 0, "HRESULT")
        return ISVGStringList(p)
    }

    /**
     * 
     * @returns {ISVGStringList} 
     */
    get_systemLanguage() {
        result := ComCall(9, this, "ptr*", &p := 0, "HRESULT")
        return ISVGStringList(p)
    }

    /**
     * 
     * @param {BSTR} _extension 
     * @returns {VARIANT_BOOL} 
     */
    hasExtension(_extension) {
        _extension := _extension is String ? BSTR.Alloc(_extension).Value : _extension

        result := ComCall(10, this, BSTR, _extension, VARIANT_BOOL.Ptr, &pResult := 0, "HRESULT")
        return pResult
    }

    Query(iid) {
        if (ISVGTests.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_requiredFeatures := CallbackCreate(GetMethod(implObj, "get_requiredFeatures"), flags, 2)
        this.vtbl.get_requiredExtensions := CallbackCreate(GetMethod(implObj, "get_requiredExtensions"), flags, 2)
        this.vtbl.get_systemLanguage := CallbackCreate(GetMethod(implObj, "get_systemLanguage"), flags, 2)
        this.vtbl.hasExtension := CallbackCreate(GetMethod(implObj, "hasExtension"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_requiredFeatures)
        CallbackFree(this.vtbl.get_requiredExtensions)
        CallbackFree(this.vtbl.get_systemLanguage)
        CallbackFree(this.vtbl.hasExtension)
    }
}
