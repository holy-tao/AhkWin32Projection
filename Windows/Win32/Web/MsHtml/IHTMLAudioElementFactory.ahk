#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IHTMLAudioElement.ahk" { IHTMLAudioElement }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IHTMLAudioElementFactory extends IDispatch {
    /**
     * The interface identifier for IHTMLAudioElementFactory
     * @type {Guid}
     */
    static IID := Guid("{305107eb-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for HTMLAudioElementFactory
     * @type {Guid}
     */
    static CLSID := Guid("{305107ec-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLAudioElementFactory interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        create : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLAudioElementFactory.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {VARIANT} src 
     * @returns {IHTMLAudioElement} 
     */
    create(src) {
        result := ComCall(7, this, VARIANT, src, "ptr*", &__MIDL__IHTMLAudioElementFactory0000 := 0, "HRESULT")
        return IHTMLAudioElement(__MIDL__IHTMLAudioElementFactory0000)
    }

    Query(iid) {
        if (IHTMLAudioElementFactory.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.create := CallbackCreate(GetMethod(implObj, "create"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.create)
    }
}
