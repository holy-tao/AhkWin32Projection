#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IPrinterExtensionRequest.ahk" { IPrinterExtensionRequest }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\IPrinterExtensionContext.ahk" { IPrinterExtensionContext }

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct IPrinterExtensionEventArgs extends IPrinterExtensionContext {
    /**
     * The interface identifier for IPrinterExtensionEventArgs
     * @type {Guid}
     */
    static IID := Guid("{39843bf4-c4d2-41fd-b4b2-aedbee5e1900}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPrinterExtensionEventArgs interfaces
    */
    struct Vtbl extends IPrinterExtensionContext.Vtbl {
        get_BidiNotification  : IntPtr
        get_ReasonId          : IntPtr
        get_Request           : IntPtr
        get_SourceApplication : IntPtr
        get_DetailedReasonId  : IntPtr
        get_WindowModal       : IntPtr
        get_WindowParent      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPrinterExtensionEventArgs.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    BidiNotification {
        get => this.get_BidiNotification()
    }

    /**
     * @type {Guid} 
     */
    ReasonId {
        get => this.get_ReasonId()
    }

    /**
     * @type {IPrinterExtensionRequest} 
     */
    Request {
        get => this.get_Request()
    }

    /**
     * @type {BSTR} 
     */
    SourceApplication {
        get => this.get_SourceApplication()
    }

    /**
     * @type {Guid} 
     */
    DetailedReasonId {
        get => this.get_DetailedReasonId()
    }

    /**
     * @type {BOOL} 
     */
    WindowModal {
        get => this.get_WindowModal()
    }

    /**
     * @type {HANDLE} 
     */
    WindowParent {
        get => this.get_WindowParent()
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_BidiNotification() {
        pbstrBidiNotification := BSTR.Owned()
        result := ComCall(11, this, BSTR.Ptr, pbstrBidiNotification, "HRESULT")
        return pbstrBidiNotification
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_ReasonId() {
        pReasonId := Guid()
        result := ComCall(12, this, Guid.Ptr, pReasonId, "HRESULT")
        return pReasonId
    }

    /**
     * 
     * @returns {IPrinterExtensionRequest} 
     */
    get_Request() {
        result := ComCall(13, this, "ptr*", &ppRequest := 0, "HRESULT")
        return IPrinterExtensionRequest(ppRequest)
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_SourceApplication() {
        pbstrApplication := BSTR.Owned()
        result := ComCall(14, this, BSTR.Ptr, pbstrApplication, "HRESULT")
        return pbstrApplication
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_DetailedReasonId() {
        pDetailedReasonId := Guid()
        result := ComCall(15, this, Guid.Ptr, pDetailedReasonId, "HRESULT")
        return pDetailedReasonId
    }

    /**
     * 
     * @returns {BOOL} 
     */
    get_WindowModal() {
        result := ComCall(16, this, BOOL.Ptr, &pbModal := 0, "HRESULT")
        return pbModal
    }

    /**
     * 
     * @returns {HANDLE} 
     */
    get_WindowParent() {
        phwndParent := HANDLE.Owned()
        result := ComCall(17, this, HANDLE.Ptr, phwndParent, "HRESULT")
        return phwndParent
    }

    Query(iid) {
        if (IPrinterExtensionEventArgs.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_BidiNotification := CallbackCreate(GetMethod(implObj, "get_BidiNotification"), flags, 2)
        this.vtbl.get_ReasonId := CallbackCreate(GetMethod(implObj, "get_ReasonId"), flags, 2)
        this.vtbl.get_Request := CallbackCreate(GetMethod(implObj, "get_Request"), flags, 2)
        this.vtbl.get_SourceApplication := CallbackCreate(GetMethod(implObj, "get_SourceApplication"), flags, 2)
        this.vtbl.get_DetailedReasonId := CallbackCreate(GetMethod(implObj, "get_DetailedReasonId"), flags, 2)
        this.vtbl.get_WindowModal := CallbackCreate(GetMethod(implObj, "get_WindowModal"), flags, 2)
        this.vtbl.get_WindowParent := CallbackCreate(GetMethod(implObj, "get_WindowParent"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_BidiNotification)
        CallbackFree(this.vtbl.get_ReasonId)
        CallbackFree(this.vtbl.get_Request)
        CallbackFree(this.vtbl.get_SourceApplication)
        CallbackFree(this.vtbl.get_DetailedReasonId)
        CallbackFree(this.vtbl.get_WindowModal)
        CallbackFree(this.vtbl.get_WindowParent)
    }
}
