#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IEnumDebugExtendedPropertyInfo.ahk" { IEnumDebugExtendedPropertyInfo }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ExtendedDebugPropertyInfo.ahk" { ExtendedDebugPropertyInfo }
#Import ".\IDebugProperty.ahk" { IDebugProperty }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct IDebugExtendedProperty extends IDebugProperty {
    /**
     * The interface identifier for IDebugExtendedProperty
     * @type {Guid}
     */
    static IID := Guid("{51973c52-cb0c-11d0-b5c9-00a0244a0e7a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDebugExtendedProperty interfaces
    */
    struct Vtbl extends IDebugProperty.Vtbl {
        GetExtendedPropertyInfo : IntPtr
        EnumExtendedMembers     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDebugExtendedProperty.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} dwFieldSpec 
     * @param {Integer} nRadix 
     * @returns {ExtendedDebugPropertyInfo} 
     */
    GetExtendedPropertyInfo(dwFieldSpec, nRadix) {
        pExtendedPropertyInfo := ExtendedDebugPropertyInfo()
        result := ComCall(8, this, "uint", dwFieldSpec, "uint", nRadix, ExtendedDebugPropertyInfo.Ptr, pExtendedPropertyInfo, "HRESULT")
        return pExtendedPropertyInfo
    }

    /**
     * 
     * @param {Integer} dwFieldSpec 
     * @param {Integer} nRadix 
     * @returns {IEnumDebugExtendedPropertyInfo} 
     */
    EnumExtendedMembers(dwFieldSpec, nRadix) {
        result := ComCall(9, this, "uint", dwFieldSpec, "uint", nRadix, "ptr*", &ppeepi := 0, "HRESULT")
        return IEnumDebugExtendedPropertyInfo(ppeepi)
    }

    Query(iid) {
        if (IDebugExtendedProperty.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetExtendedPropertyInfo := CallbackCreate(GetMethod(implObj, "GetExtendedPropertyInfo"), flags, 4)
        this.vtbl.EnumExtendedMembers := CallbackCreate(GetMethod(implObj, "EnumExtendedMembers"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetExtendedPropertyInfo)
        CallbackFree(this.vtbl.EnumExtendedMembers)
    }
}
