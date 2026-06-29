#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IKeyStore.ahk" { IKeyStore }
#Import ".\IModelObject.ahk" { IModelObject }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct IModelMethod extends IUnknown {
    /**
     * The interface identifier for IModelMethod
     * @type {Guid}
     */
    static IID := Guid("{80600c1f-b90b-4896-82ad-1c00207909e8}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IModelMethod interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Call : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IModelMethod.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {IModelObject} pContextObject 
     * @param {Integer} argCount 
     * @param {Pointer<IModelObject>} ppArguments 
     * @param {Pointer<IModelObject>} ppResult 
     * @param {Pointer<IKeyStore>} ppMetadata 
     * @returns {HRESULT} 
     */
    Call(pContextObject, argCount, ppArguments, ppResult, ppMetadata) {
        result := ComCall(3, this, "ptr", pContextObject, "uint", argCount, IModelObject.Ptr, ppArguments, IModelObject.Ptr, ppResult, IKeyStore.Ptr, ppMetadata, "HRESULT")
        return result
    }

    Query(iid) {
        if (IModelMethod.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Call := CallbackCreate(GetMethod(implObj, "Call"), flags, 6)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Call)
    }
}
