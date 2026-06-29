#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IDataModelManager.ahk" { IDataModelManager }
#Import ".\IDebugHost.ahk" { IDebugHost }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct IHostDataModelAccess extends IUnknown {
    /**
     * The interface identifier for IHostDataModelAccess
     * @type {Guid}
     */
    static IID := Guid("{f2bce54e-4835-4f8a-836e-7981e29904d1}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHostDataModelAccess interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetDataModel : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHostDataModelAccess.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<IDataModelManager>} manager 
     * @param {Pointer<IDebugHost>} host 
     * @returns {HRESULT} 
     */
    GetDataModel(manager, host) {
        result := ComCall(3, this, IDataModelManager.Ptr, manager, IDebugHost.Ptr, host, "HRESULT")
        return result
    }

    Query(iid) {
        if (IHostDataModelAccess.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetDataModel := CallbackCreate(GetMethod(implObj, "GetDataModel"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetDataModel)
    }
}
