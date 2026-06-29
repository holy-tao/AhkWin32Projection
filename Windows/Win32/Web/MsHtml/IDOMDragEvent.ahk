#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IEventTarget.ahk" { IEventTarget }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import ".\IHTMLDataTransfer.ahk" { IHTMLDataTransfer }
#Import ".\IHTMLWindow2.ahk" { IHTMLWindow2 }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IDOMDragEvent extends IDispatch {
    /**
     * The interface identifier for IDOMDragEvent
     * @type {Guid}
     */
    static IID := Guid("{30510761-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for DOMDragEvent
     * @type {Guid}
     */
    static CLSID := Guid("{30510762-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDOMDragEvent interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_dataTransfer : IntPtr
        initDragEvent    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDOMDragEvent.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {IHTMLDataTransfer} 
     */
    dataTransfer {
        get => this.get_dataTransfer()
    }

    /**
     * 
     * @returns {IHTMLDataTransfer} 
     */
    get_dataTransfer() {
        result := ComCall(7, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLDataTransfer(p)
    }

    /**
     * 
     * @param {BSTR} eventType 
     * @param {VARIANT_BOOL} canBubble 
     * @param {VARIANT_BOOL} cancelable 
     * @param {IHTMLWindow2} viewArg 
     * @param {Integer} detailArg 
     * @param {Integer} screenXArg 
     * @param {Integer} screenYArg 
     * @param {Integer} clientXArg 
     * @param {Integer} clientYArg 
     * @param {VARIANT_BOOL} ctrlKeyArg 
     * @param {VARIANT_BOOL} altKeyArg 
     * @param {VARIANT_BOOL} shiftKeyArg 
     * @param {VARIANT_BOOL} metaKeyArg 
     * @param {Integer} buttonArg 
     * @param {IEventTarget} relatedTargetArg 
     * @param {IHTMLDataTransfer} dataTransferArg 
     * @returns {HRESULT} 
     */
    initDragEvent(eventType, canBubble, cancelable, viewArg, detailArg, screenXArg, screenYArg, clientXArg, clientYArg, ctrlKeyArg, altKeyArg, shiftKeyArg, metaKeyArg, buttonArg, relatedTargetArg, dataTransferArg) {
        eventType := eventType is String ? BSTR.Alloc(eventType).Value : eventType

        result := ComCall(8, this, BSTR, eventType, VARIANT_BOOL, canBubble, VARIANT_BOOL, cancelable, "ptr", viewArg, "int", detailArg, "int", screenXArg, "int", screenYArg, "int", clientXArg, "int", clientYArg, VARIANT_BOOL, ctrlKeyArg, VARIANT_BOOL, altKeyArg, VARIANT_BOOL, shiftKeyArg, VARIANT_BOOL, metaKeyArg, "ushort", buttonArg, "ptr", relatedTargetArg, "ptr", dataTransferArg, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDOMDragEvent.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_dataTransfer := CallbackCreate(GetMethod(implObj, "get_dataTransfer"), flags, 2)
        this.vtbl.initDragEvent := CallbackCreate(GetMethod(implObj, "initDragEvent"), flags, 17)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_dataTransfer)
        CallbackFree(this.vtbl.initDragEvent)
    }
}
