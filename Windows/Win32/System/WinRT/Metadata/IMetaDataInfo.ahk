#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.WinRT.Metadata
 */
export default struct IMetaDataInfo extends IUnknown {
    /**
     * The interface identifier for IMetaDataInfo
     * @type {Guid}
     */
    static IID := Guid("{7998ea64-7f95-48b8-86fc-17caf48bf5cb}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMetaDataInfo interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetFileMapping : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMetaDataInfo.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<Pointer<Void>>} ppvData 
     * @param {Pointer<Integer>} pcbData 
     * @param {Pointer<Integer>} pdwMappingType 
     * @returns {HRESULT} 
     */
    GetFileMapping(ppvData, pcbData, pdwMappingType) {
        ppvDataMarshal := ppvData is VarRef ? "ptr*" : "ptr"
        pcbDataMarshal := pcbData is VarRef ? "uint*" : "ptr"
        pdwMappingTypeMarshal := pdwMappingType is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, ppvDataMarshal, ppvData, pcbDataMarshal, pcbData, pdwMappingTypeMarshal, pdwMappingType, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMetaDataInfo.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetFileMapping := CallbackCreate(GetMethod(implObj, "GetFileMapping"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetFileMapping)
    }
}
