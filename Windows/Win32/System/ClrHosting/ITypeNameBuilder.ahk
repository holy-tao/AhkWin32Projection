#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.ClrHosting
 * @version v4.0.30319
 */
class ITypeNameBuilder extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITypeNameBuilder
     * @type {Guid}
     */
    static IID => Guid("{b81ff171-20f3-11d2-8dcc-00a0c9b00523}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OpenGenericArguments", "CloseGenericArguments", "OpenGenericArgument", "CloseGenericArgument", "AddName", "AddPointer", "AddByRef", "AddSzArray", "AddArray", "AddAssemblySpec", "ToString", "Clear"]

    /**
     * 
     * @returns {HRESULT} 
     */
    OpenGenericArguments() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    CloseGenericArguments() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    OpenGenericArgument() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    CloseGenericArgument() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} szName 
     * @returns {HRESULT} 
     */
    AddName(szName) {
        szName := szName is String ? StrPtr(szName) : szName

        result := ComCall(7, this, "ptr", szName, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    AddPointer() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    AddByRef() {
        result := ComCall(9, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    AddSzArray() {
        result := ComCall(10, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} rank 
     * @returns {HRESULT} 
     */
    AddArray(rank) {
        result := ComCall(11, this, "uint", rank, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} szAssemblySpec 
     * @returns {HRESULT} 
     */
    AddAssemblySpec(szAssemblySpec) {
        szAssemblySpec := szAssemblySpec is String ? StrPtr(szAssemblySpec) : szAssemblySpec

        result := ComCall(12, this, "ptr", szAssemblySpec, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pszStringRepresentation 
     * @returns {HRESULT} 
     */
    ToString(pszStringRepresentation) {
        result := ComCall(13, this, "ptr", pszStringRepresentation, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Clear() {
        result := ComCall(14, this, "HRESULT")
        return result
    }
}
