#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Provides a metadata locator with a destination for the metadata it has discovered.
 * @see https://learn.microsoft.com/windows/win32/api/roparameterizediid/ns-roparameterizediid-irosimplemetadatabuilder
 * @namespace Windows.Win32.System.WinRT.Metadata
 */
export default struct IRoSimpleMetaDataBuilder extends Win32ComInterface {

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRoSimpleMetaDataBuilder interfaces
    */
    struct Vtbl {
        SetWinRtInterface                     : IntPtr
        SetDelegate                           : IntPtr
        SetInterfaceGroupSimpleDefault        : IntPtr
        SetInterfaceGroupParameterizedDefault : IntPtr
        SetRuntimeClassSimpleDefault          : IntPtr
        SetRuntimeClassParameterizedDefault   : IntPtr
        SetStruct                             : IntPtr
        SetEnum                               : IntPtr
        SetParameterizedInterface             : IntPtr
        SetParameterizedDelegate              : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRoSimpleMetaDataBuilder.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Guid} iid 
     * @returns {HRESULT} 
     */
    SetWinRtInterface(iid) {
        result := ComCall(0, this, Guid, iid, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Guid} iid 
     * @returns {HRESULT} 
     */
    SetDelegate(iid) {
        result := ComCall(1, this, Guid, iid, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} name 
     * @param {PWSTR} defaultInterfaceName 
     * @param {Pointer<Guid>} defaultInterfaceIID 
     * @returns {HRESULT} 
     */
    SetInterfaceGroupSimpleDefault(name, defaultInterfaceName, defaultInterfaceIID) {
        name := name is String ? StrPtr(name) : name
        defaultInterfaceName := defaultInterfaceName is String ? StrPtr(defaultInterfaceName) : defaultInterfaceName

        result := ComCall(2, this, "ptr", name, "ptr", defaultInterfaceName, Guid.Ptr, defaultInterfaceIID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} name 
     * @param {Integer} elementCount 
     * @param {Pointer<PWSTR>} defaultInterfaceNameElements 
     * @returns {HRESULT} 
     */
    SetInterfaceGroupParameterizedDefault(name, elementCount, defaultInterfaceNameElements) {
        name := name is String ? StrPtr(name) : name

        defaultInterfaceNameElementsMarshal := defaultInterfaceNameElements is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "ptr", name, "uint", elementCount, defaultInterfaceNameElementsMarshal, defaultInterfaceNameElements, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} name 
     * @param {PWSTR} defaultInterfaceName 
     * @param {Pointer<Guid>} defaultInterfaceIID 
     * @returns {HRESULT} 
     */
    SetRuntimeClassSimpleDefault(name, defaultInterfaceName, defaultInterfaceIID) {
        name := name is String ? StrPtr(name) : name
        defaultInterfaceName := defaultInterfaceName is String ? StrPtr(defaultInterfaceName) : defaultInterfaceName

        result := ComCall(4, this, "ptr", name, "ptr", defaultInterfaceName, Guid.Ptr, defaultInterfaceIID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} name 
     * @param {Integer} elementCount 
     * @param {Pointer<PWSTR>} defaultInterfaceNameElements 
     * @returns {HRESULT} 
     */
    SetRuntimeClassParameterizedDefault(name, elementCount, defaultInterfaceNameElements) {
        name := name is String ? StrPtr(name) : name

        defaultInterfaceNameElementsMarshal := defaultInterfaceNameElements is VarRef ? "ptr*" : "ptr"

        result := ComCall(5, this, "ptr", name, "uint", elementCount, defaultInterfaceNameElementsMarshal, defaultInterfaceNameElements, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} name 
     * @param {Integer} numFields 
     * @param {Pointer<PWSTR>} fieldTypeNames 
     * @returns {HRESULT} 
     */
    SetStruct(name, numFields, fieldTypeNames) {
        name := name is String ? StrPtr(name) : name

        fieldTypeNamesMarshal := fieldTypeNames is VarRef ? "ptr*" : "ptr"

        result := ComCall(6, this, "ptr", name, "uint", numFields, fieldTypeNamesMarshal, fieldTypeNames, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} name 
     * @param {PWSTR} baseType 
     * @returns {HRESULT} 
     */
    SetEnum(name, baseType) {
        name := name is String ? StrPtr(name) : name
        baseType := baseType is String ? StrPtr(baseType) : baseType

        result := ComCall(7, this, "ptr", name, "ptr", baseType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Guid} piid 
     * @param {Integer} numArgs 
     * @returns {HRESULT} 
     */
    SetParameterizedInterface(piid, numArgs) {
        result := ComCall(8, this, Guid, piid, "uint", numArgs, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Guid} piid 
     * @param {Integer} numArgs 
     * @returns {HRESULT} 
     */
    SetParameterizedDelegate(piid, numArgs) {
        result := ComCall(9, this, Guid, piid, "uint", numArgs, "HRESULT")
        return result
    }

    Query(iid) {
        if (IRoSimpleMetaDataBuilder.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }
}
