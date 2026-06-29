#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IScriptEventHandler extends IUnknown {
    /**
     * The interface identifier for IScriptEventHandler
     * @type {Guid}
     */
    static IID := Guid("{3051083a-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IScriptEventHandler interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        FunctionName         : IntPtr
        DebugDocumentContext : IntPtr
        EventHandlerDispatch : IntPtr
        UsesCapture          : IntPtr
        Cookie               : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IScriptEventHandler.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {BSTR} 
     */
    FunctionName() {
        pbstrFunctionName := BSTR.Owned()
        result := ComCall(3, this, BSTR.Ptr, pbstrFunctionName, "HRESULT")
        return pbstrFunctionName
    }

    /**
     * 
     * @returns {IUnknown} 
     */
    DebugDocumentContext() {
        result := ComCall(4, this, "ptr*", &ppDebugDocumentContext := 0, "HRESULT")
        return IUnknown(ppDebugDocumentContext)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    EventHandlerDispatch() {
        result := ComCall(5, this, "ptr*", &ppDispHandler := 0, "HRESULT")
        return IDispatch(ppDispHandler)
    }

    /**
     * 
     * @returns {BOOL} 
     */
    UsesCapture() {
        result := ComCall(6, this, BOOL.Ptr, &pfUsesCapture := 0, "HRESULT")
        return pfUsesCapture
    }

    /**
     * 
     * @returns {Integer} 
     */
    Cookie() {
        result := ComCall(7, this, "uint*", &pullCookie := 0, "HRESULT")
        return pullCookie
    }

    Query(iid) {
        if (IScriptEventHandler.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.FunctionName := CallbackCreate(GetMethod(implObj, "FunctionName"), flags, 2)
        this.vtbl.DebugDocumentContext := CallbackCreate(GetMethod(implObj, "DebugDocumentContext"), flags, 2)
        this.vtbl.EventHandlerDispatch := CallbackCreate(GetMethod(implObj, "EventHandlerDispatch"), flags, 2)
        this.vtbl.UsesCapture := CallbackCreate(GetMethod(implObj, "UsesCapture"), flags, 2)
        this.vtbl.Cookie := CallbackCreate(GetMethod(implObj, "Cookie"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.FunctionName)
        CallbackFree(this.vtbl.DebugDocumentContext)
        CallbackFree(this.vtbl.EventHandlerDispatch)
        CallbackFree(this.vtbl.UsesCapture)
        CallbackFree(this.vtbl.Cookie)
    }
}
