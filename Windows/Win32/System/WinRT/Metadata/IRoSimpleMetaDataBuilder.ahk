#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Provides a metadata locator with a destination for the metadata it has discovered.
 * @see https://docs.microsoft.com/windows/win32/api//roparameterizediid/ns-roparameterizediid-irosimplemetadatabuilder
 * @namespace Windows.Win32.System.WinRT.Metadata
 * @version v4.0.30319
 */
class IRoSimpleMetaDataBuilder extends Win32ComInterface{

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 0

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetWinRtInterface", "SetDelegate", "SetInterfaceGroupSimpleDefault", "SetInterfaceGroupParameterizedDefault", "SetRuntimeClassSimpleDefault", "SetRuntimeClassParameterizedDefault", "SetStruct", "SetEnum", "SetParameterizedInterface", "SetParameterizedDelegate"]

    /**
     * 
     * @param {Guid} iid 
     * @returns {HRESULT} 
     */
    SetWinRtInterface(iid) {
        result := ComCall(0, this, "ptr", iid, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Guid} iid 
     * @returns {HRESULT} 
     */
    SetDelegate(iid) {
        result := ComCall(1, this, "ptr", iid, "HRESULT")
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

        result := ComCall(2, this, "ptr", name, "ptr", defaultInterfaceName, "ptr", defaultInterfaceIID, "HRESULT")
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

        result := ComCall(4, this, "ptr", name, "ptr", defaultInterfaceName, "ptr", defaultInterfaceIID, "HRESULT")
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
        result := ComCall(8, this, "ptr", piid, "uint", numArgs, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Guid} piid 
     * @param {Integer} numArgs 
     * @returns {HRESULT} 
     */
    SetParameterizedDelegate(piid, numArgs) {
        result := ComCall(9, this, "ptr", piid, "uint", numArgs, "HRESULT")
        return result
    }
}
