#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IPrintSchemaTicket.ahk" { IPrintSchemaTicket }
#Import ".\IPrinterPropertyBag.ahk" { IPrinterPropertyBag }
#Import ".\IPrinterQueue.ahk" { IPrinterQueue }

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct IPrinterExtensionContext extends IDispatch {
    /**
     * The interface identifier for IPrinterExtensionContext
     * @type {Guid}
     */
    static IID := Guid("{39843bf2-c4d2-41fd-b4b2-aedbee5e1900}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPrinterExtensionContext interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_PrinterQueue      : IntPtr
        get_PrintSchemaTicket : IntPtr
        get_DriverProperties  : IntPtr
        get_UserProperties    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPrinterExtensionContext.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {IPrinterQueue} 
     */
    PrinterQueue {
        get => this.get_PrinterQueue()
    }

    /**
     * @type {IPrintSchemaTicket} 
     */
    PrintSchemaTicket {
        get => this.get_PrintSchemaTicket()
    }

    /**
     * @type {IPrinterPropertyBag} 
     */
    DriverProperties {
        get => this.get_DriverProperties()
    }

    /**
     * @type {IPrinterPropertyBag} 
     */
    UserProperties {
        get => this.get_UserProperties()
    }

    /**
     * 
     * @returns {IPrinterQueue} 
     */
    get_PrinterQueue() {
        result := ComCall(7, this, "ptr*", &ppQueue := 0, "HRESULT")
        return IPrinterQueue(ppQueue)
    }

    /**
     * 
     * @returns {IPrintSchemaTicket} 
     */
    get_PrintSchemaTicket() {
        result := ComCall(8, this, "ptr*", &ppTicket := 0, "HRESULT")
        return IPrintSchemaTicket(ppTicket)
    }

    /**
     * 
     * @returns {IPrinterPropertyBag} 
     */
    get_DriverProperties() {
        result := ComCall(9, this, "ptr*", &ppPropertyBag := 0, "HRESULT")
        return IPrinterPropertyBag(ppPropertyBag)
    }

    /**
     * 
     * @returns {IPrinterPropertyBag} 
     */
    get_UserProperties() {
        result := ComCall(10, this, "ptr*", &ppPropertyBag := 0, "HRESULT")
        return IPrinterPropertyBag(ppPropertyBag)
    }

    Query(iid) {
        if (IPrinterExtensionContext.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_PrinterQueue := CallbackCreate(GetMethod(implObj, "get_PrinterQueue"), flags, 2)
        this.vtbl.get_PrintSchemaTicket := CallbackCreate(GetMethod(implObj, "get_PrintSchemaTicket"), flags, 2)
        this.vtbl.get_DriverProperties := CallbackCreate(GetMethod(implObj, "get_DriverProperties"), flags, 2)
        this.vtbl.get_UserProperties := CallbackCreate(GetMethod(implObj, "get_UserProperties"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_PrinterQueue)
        CallbackFree(this.vtbl.get_PrintSchemaTicket)
        CallbackFree(this.vtbl.get_DriverProperties)
        CallbackFree(this.vtbl.get_UserProperties)
    }
}
