#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\Folder2.ahk" { Folder2 }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

/**
 * @namespace Windows.Win32.UI.Shell
 */
export default struct Folder3 extends Folder2 {
    /**
     * The interface identifier for Folder3
     * @type {Guid}
     */
    static IID := Guid("{a7ae5f64-c4d7-4d7f-9307-4d24ee54b841}")

    /**
     * The class identifier for Folder3
     * @type {Guid}
     */
    static CLSID := Guid("{a7ae5f64-c4d7-4d7f-9307-4d24ee54b841}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for Folder3 interfaces
    */
    struct Vtbl extends Folder2.Vtbl {
        get_ShowWebViewBarricade : IntPtr
        put_ShowWebViewBarricade : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := Folder3.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    ShowWebViewBarricade {
        get => this.get_ShowWebViewBarricade()
        set => this.put_ShowWebViewBarricade(value)
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_ShowWebViewBarricade() {
        result := ComCall(22, this, VARIANT_BOOL.Ptr, &pbShowWebViewBarricade := 0, "HRESULT")
        return pbShowWebViewBarricade
    }

    /**
     * 
     * @param {VARIANT_BOOL} bShowWebViewBarricade 
     * @returns {HRESULT} 
     */
    put_ShowWebViewBarricade(bShowWebViewBarricade) {
        result := ComCall(23, this, VARIANT_BOOL, bShowWebViewBarricade, "HRESULT")
        return result
    }

    Query(iid) {
        if (Folder3.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_ShowWebViewBarricade := CallbackCreate(GetMethod(implObj, "get_ShowWebViewBarricade"), flags, 2)
        this.vtbl.put_ShowWebViewBarricade := CallbackCreate(GetMethod(implObj, "put_ShowWebViewBarricade"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_ShowWebViewBarricade)
        CallbackFree(this.vtbl.put_ShowWebViewBarricade)
    }
}
