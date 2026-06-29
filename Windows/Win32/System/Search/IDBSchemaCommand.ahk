#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ICommand.ahk" { ICommand }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Search
 */
export default struct IDBSchemaCommand extends IUnknown {
    /**
     * The interface identifier for IDBSchemaCommand
     * @type {Guid}
     */
    static IID := Guid("{0c733a50-2a1c-11ce-ade5-00aa0044773d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDBSchemaCommand interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetCommand : IntPtr
        GetSchemas : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDBSchemaCommand.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {IUnknown} pUnkOuter 
     * @param {Pointer<Guid>} rguidSchema 
     * @returns {ICommand} 
     */
    GetCommand(pUnkOuter, rguidSchema) {
        result := ComCall(3, this, "ptr", pUnkOuter, Guid.Ptr, rguidSchema, "ptr*", &ppCommand := 0, "HRESULT")
        return ICommand(ppCommand)
    }

    /**
     * 
     * @param {Pointer<Integer>} pcSchemas 
     * @returns {Pointer<Guid>} 
     */
    GetSchemas(pcSchemas) {
        pcSchemasMarshal := pcSchemas is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, pcSchemasMarshal, pcSchemas, "ptr*", &prgSchemas := 0, "HRESULT")
        return prgSchemas
    }

    Query(iid) {
        if (IDBSchemaCommand.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetCommand := CallbackCreate(GetMethod(implObj, "GetCommand"), flags, 4)
        this.vtbl.GetSchemas := CallbackCreate(GetMethod(implObj, "GetSchemas"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetCommand)
        CallbackFree(this.vtbl.GetSchemas)
    }
}
