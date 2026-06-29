#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IHTMLXMLHttpRequest.ahk" { IHTMLXMLHttpRequest }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IHTMLXMLHttpRequestFactory extends IDispatch {
    /**
     * The interface identifier for IHTMLXMLHttpRequestFactory
     * @type {Guid}
     */
    static IID := Guid("{3051040c-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for HTMLXMLHttpRequestFactory
     * @type {Guid}
     */
    static CLSID := Guid("{3051040d-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLXMLHttpRequestFactory interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        create : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLXMLHttpRequestFactory.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {IHTMLXMLHttpRequest} 
     */
    create() {
        result := ComCall(7, this, "ptr*", &__MIDL__IHTMLXMLHttpRequestFactory0000 := 0, "HRESULT")
        return IHTMLXMLHttpRequest(__MIDL__IHTMLXMLHttpRequestFactory0000)
    }

    Query(iid) {
        if (IHTMLXMLHttpRequestFactory.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.create := CallbackCreate(GetMethod(implObj, "create"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.create)
    }
}
