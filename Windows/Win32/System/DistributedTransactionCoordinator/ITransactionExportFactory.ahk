#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ITransactionExport.ahk" { ITransactionExport }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 */
export default struct ITransactionExportFactory extends IUnknown {
    /**
     * The interface identifier for ITransactionExportFactory
     * @type {Guid}
     */
    static IID := Guid("{e1cf9b53-8745-11ce-a9ba-00aa006c3706}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITransactionExportFactory interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetRemoteClassId : IntPtr
        Create           : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITransactionExportFactory.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {Guid} 
     */
    GetRemoteClassId() {
        pclsid := Guid()
        result := ComCall(3, this, Guid.Ptr, pclsid, "HRESULT")
        return pclsid
    }

    /**
     * The Create Time/Date Summary property conveys the time and date when an author created the installation package, transform, or patch package.
     * @param {Integer} cbWhereabouts 
     * @param {Pointer<Integer>} rgbWhereabouts 
     * @returns {ITransactionExport} 
     * @see https://learn.microsoft.com/windows/win32/Msi/create-time-date-summary
     */
    Create(cbWhereabouts, rgbWhereabouts) {
        rgbWhereaboutsMarshal := rgbWhereabouts is VarRef ? "char*" : "ptr"

        result := ComCall(4, this, "uint", cbWhereabouts, rgbWhereaboutsMarshal, rgbWhereabouts, "ptr*", &ppExport := 0, "HRESULT")
        return ITransactionExport(ppExport)
    }

    Query(iid) {
        if (ITransactionExportFactory.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetRemoteClassId := CallbackCreate(GetMethod(implObj, "GetRemoteClassId"), flags, 2)
        this.vtbl.Create := CallbackCreate(GetMethod(implObj, "Create"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetRemoteClassId)
        CallbackFree(this.vtbl.Create)
    }
}
