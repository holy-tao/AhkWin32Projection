#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\ISvcSymbolType.ahk" { ISvcSymbolType }
#Import ".\ISvcModule.ahk" { ISvcModule }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IDebugServiceManager.ahk" { IDebugServiceManager }
#Import "..\..\..\Com\IUnknown.ahk" { IUnknown }
#Import ".\IDebugHostType.ahk" { IDebugHostType }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct IDebugHostSymbolsTargetComposition extends IUnknown {
    /**
     * The interface identifier for IDebugHostSymbolsTargetComposition
     * @type {Guid}
     */
    static IID := Guid("{3c4b6add-80e1-4c2b-afe1-9a1132586dd0}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDebugHostSymbolsTargetComposition interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetTypeForServiceType : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDebugHostSymbolsTargetComposition.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<IDebugServiceManager>} pServiceManager 
     * @param {Pointer<ISvcModule>} pModule 
     * @param {Pointer<ISvcSymbolType>} pType 
     * @returns {IDebugHostType} 
     */
    GetTypeForServiceType(pServiceManager, pModule, pType) {
        pServiceManagerMarshal := pServiceManager is VarRef ? "ptr*" : "ptr"
        pModuleMarshal := pModule is VarRef ? "ptr*" : "ptr"
        pTypeMarshal := pType is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, pServiceManagerMarshal, pServiceManager, pModuleMarshal, pModule, pTypeMarshal, pType, "ptr*", &ppHostType := 0, "HRESULT")
        return IDebugHostType(ppHostType)
    }

    Query(iid) {
        if (IDebugHostSymbolsTargetComposition.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetTypeForServiceType := CallbackCreate(GetMethod(implObj, "GetTypeForServiceType"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetTypeForServiceType)
    }
}
