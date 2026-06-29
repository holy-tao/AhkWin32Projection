#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\..\Graphics\Printing\IPrinterPropertyBag.ahk" { IPrinterPropertyBag }
#Import "..\..\..\Graphics\Printing\IPrinterQueue.ahk" { IPrinterQueue }

/**
 * @namespace Windows.Win32.System.WinRT.Printing
 */
export default struct IPrintWorkflowConfigurationNative extends IUnknown {
    /**
     * The interface identifier for IPrintWorkflowConfigurationNative
     * @type {Guid}
     */
    static IID := Guid("{c056be0a-9ee2-450a-9823-964f0006f2bb}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPrintWorkflowConfigurationNative interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        get_PrinterQueue     : IntPtr
        get_DriverProperties : IntPtr
        get_UserProperties   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPrintWorkflowConfigurationNative.Vtbl()
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
        result := ComCall(3, this, "ptr*", &value := 0, "HRESULT")
        return IPrinterQueue(value)
    }

    /**
     * 
     * @returns {IPrinterPropertyBag} 
     */
    get_DriverProperties() {
        result := ComCall(4, this, "ptr*", &value := 0, "HRESULT")
        return IPrinterPropertyBag(value)
    }

    /**
     * 
     * @returns {IPrinterPropertyBag} 
     */
    get_UserProperties() {
        result := ComCall(5, this, "ptr*", &value := 0, "HRESULT")
        return IPrinterPropertyBag(value)
    }

    Query(iid) {
        if (IPrintWorkflowConfigurationNative.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_PrinterQueue := CallbackCreate(GetMethod(implObj, "get_PrinterQueue"), flags, 2)
        this.vtbl.get_DriverProperties := CallbackCreate(GetMethod(implObj, "get_DriverProperties"), flags, 2)
        this.vtbl.get_UserProperties := CallbackCreate(GetMethod(implObj, "get_UserProperties"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_PrinterQueue)
        CallbackFree(this.vtbl.get_DriverProperties)
        CallbackFree(this.vtbl.get_UserProperties)
    }
}
