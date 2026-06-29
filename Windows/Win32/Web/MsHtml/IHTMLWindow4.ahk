#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IHTMLFrameBase.ahk" { IHTMLFrameBase }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IHTMLWindow4 extends IDispatch {
    /**
     * The interface identifier for IHTMLWindow4
     * @type {Guid}
     */
    static IID := Guid("{3050f6cf-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLWindow4 interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        createPopup      : IntPtr
        get_frameElement : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLWindow4.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {IHTMLFrameBase} 
     */
    frameElement {
        get => this.get_frameElement()
    }

    /**
     * 
     * @param {Pointer<VARIANT>} varArgIn 
     * @returns {IDispatch} 
     */
    createPopup(varArgIn) {
        result := ComCall(7, this, VARIANT.Ptr, varArgIn, "ptr*", &ppPopup := 0, "HRESULT")
        return IDispatch(ppPopup)
    }

    /**
     * 
     * @returns {IHTMLFrameBase} 
     */
    get_frameElement() {
        result := ComCall(8, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLFrameBase(p)
    }

    Query(iid) {
        if (IHTMLWindow4.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.createPopup := CallbackCreate(GetMethod(implObj, "createPopup"), flags, 3)
        this.vtbl.get_frameElement := CallbackCreate(GetMethod(implObj, "get_frameElement"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.createPopup)
        CallbackFree(this.vtbl.get_frameElement)
    }
}
