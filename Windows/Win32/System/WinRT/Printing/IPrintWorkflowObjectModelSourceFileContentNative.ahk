#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Storage\Xps\IXpsOMObjectFactory1.ahk" { IXpsOMObjectFactory1 }
#Import ".\IPrintWorkflowXpsReceiver.ahk" { IPrintWorkflowXpsReceiver }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.WinRT.Printing
 */
export default struct IPrintWorkflowObjectModelSourceFileContentNative extends IUnknown {
    /**
     * The interface identifier for IPrintWorkflowObjectModelSourceFileContentNative
     * @type {Guid}
     */
    static IID := Guid("{68c9e477-993e-4052-8ac6-454eff58db9d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPrintWorkflowObjectModelSourceFileContentNative interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        StartXpsOMGeneration : IntPtr
        get_ObjectFactory    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPrintWorkflowObjectModelSourceFileContentNative.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {IXpsOMObjectFactory1} 
     */
    ObjectFactory {
        get => this.get_ObjectFactory()
    }

    /**
     * 
     * @param {IPrintWorkflowXpsReceiver} receiver 
     * @returns {HRESULT} 
     */
    StartXpsOMGeneration(receiver) {
        result := ComCall(3, this, "ptr", receiver, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IXpsOMObjectFactory1} 
     */
    get_ObjectFactory() {
        result := ComCall(4, this, "ptr*", &value := 0, "HRESULT")
        return IXpsOMObjectFactory1(value)
    }

    Query(iid) {
        if (IPrintWorkflowObjectModelSourceFileContentNative.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.StartXpsOMGeneration := CallbackCreate(GetMethod(implObj, "StartXpsOMGeneration"), flags, 2)
        this.vtbl.get_ObjectFactory := CallbackCreate(GetMethod(implObj, "get_ObjectFactory"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.StartXpsOMGeneration)
        CallbackFree(this.vtbl.get_ObjectFactory)
    }
}
