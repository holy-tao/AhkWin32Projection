#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IMarkupPointer.ahk" { IMarkupPointer }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\IHTMLChangeLog.ahk" { IHTMLChangeLog }
#Import ".\IHTMLChangeSink.ahk" { IHTMLChangeSink }
#Import ".\IHTMLElement.ahk" { IHTMLElement }
#Import ".\IMarkupContainer.ahk" { IMarkupContainer }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IMarkupContainer2 extends IMarkupContainer {
    /**
     * The interface identifier for IMarkupContainer2
     * @type {Guid}
     */
    static IID := Guid("{3050f648-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMarkupContainer2 interfaces
    */
    struct Vtbl extends IMarkupContainer.Vtbl {
        CreateChangeLog         : IntPtr
        RegisterForDirtyRange   : IntPtr
        UnRegisterForDirtyRange : IntPtr
        GetAndClearDirtyRange   : IntPtr
        GetVersionNumber        : IntPtr
        GetMasterElement        : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMarkupContainer2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {IHTMLChangeSink} pChangeSink 
     * @param {BOOL} fForward 
     * @param {BOOL} fBackward 
     * @returns {IHTMLChangeLog} 
     */
    CreateChangeLog(pChangeSink, fForward, fBackward) {
        result := ComCall(4, this, "ptr", pChangeSink, "ptr*", &ppChangeLog := 0, BOOL, fForward, BOOL, fBackward, "HRESULT")
        return IHTMLChangeLog(ppChangeLog)
    }

    /**
     * 
     * @param {IHTMLChangeSink} pChangeSink 
     * @returns {Integer} 
     */
    RegisterForDirtyRange(pChangeSink) {
        result := ComCall(5, this, "ptr", pChangeSink, "uint*", &pdwCookie := 0, "HRESULT")
        return pdwCookie
    }

    /**
     * 
     * @param {Integer} dwCookie 
     * @returns {HRESULT} 
     */
    UnRegisterForDirtyRange(dwCookie) {
        result := ComCall(6, this, "uint", dwCookie, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwCookie 
     * @param {IMarkupPointer} pIPointerBegin 
     * @param {IMarkupPointer} pIPointerEnd 
     * @returns {HRESULT} 
     */
    GetAndClearDirtyRange(dwCookie, pIPointerBegin, pIPointerEnd) {
        result := ComCall(7, this, "uint", dwCookie, "ptr", pIPointerBegin, "ptr", pIPointerEnd, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetVersionNumber() {
        result := ComCall(8, this, Int32)
        return result
    }

    /**
     * 
     * @returns {IHTMLElement} 
     */
    GetMasterElement() {
        result := ComCall(9, this, "ptr*", &ppElementMaster := 0, "HRESULT")
        return IHTMLElement(ppElementMaster)
    }

    Query(iid) {
        if (IMarkupContainer2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateChangeLog := CallbackCreate(GetMethod(implObj, "CreateChangeLog"), flags, 5)
        this.vtbl.RegisterForDirtyRange := CallbackCreate(GetMethod(implObj, "RegisterForDirtyRange"), flags, 3)
        this.vtbl.UnRegisterForDirtyRange := CallbackCreate(GetMethod(implObj, "UnRegisterForDirtyRange"), flags, 2)
        this.vtbl.GetAndClearDirtyRange := CallbackCreate(GetMethod(implObj, "GetAndClearDirtyRange"), flags, 4)
        this.vtbl.GetVersionNumber := CallbackCreate(GetMethod(implObj, "GetVersionNumber"), flags, 1)
        this.vtbl.GetMasterElement := CallbackCreate(GetMethod(implObj, "GetMasterElement"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateChangeLog)
        CallbackFree(this.vtbl.RegisterForDirtyRange)
        CallbackFree(this.vtbl.UnRegisterForDirtyRange)
        CallbackFree(this.vtbl.GetAndClearDirtyRange)
        CallbackFree(this.vtbl.GetVersionNumber)
        CallbackFree(this.vtbl.GetMasterElement)
    }
}
