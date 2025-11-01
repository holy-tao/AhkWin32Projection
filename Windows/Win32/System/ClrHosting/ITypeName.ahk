#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.ClrHosting
 * @version v4.0.30319
 */
class ITypeName extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITypeName
     * @type {Guid}
     */
    static IID => Guid("{b81ff171-20f3-11d2-8dcc-00a0c9b00522}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetNameCount", "GetNames", "GetTypeArgumentCount", "GetTypeArguments", "GetModifierLength", "GetModifiers", "GetAssemblyName"]

    /**
     * 
     * @param {Pointer<Integer>} pCount 
     * @returns {HRESULT} 
     */
    GetNameCount(pCount) {
        pCountMarshal := pCount is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, pCountMarshal, pCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} count 
     * @param {Pointer<BSTR>} rgbszNames 
     * @param {Pointer<Integer>} pCount 
     * @returns {HRESULT} 
     */
    GetNames(count, rgbszNames, pCount) {
        pCountMarshal := pCount is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "uint", count, "ptr", rgbszNames, pCountMarshal, pCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pCount 
     * @returns {HRESULT} 
     */
    GetTypeArgumentCount(pCount) {
        pCountMarshal := pCount is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, pCountMarshal, pCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} count 
     * @param {Pointer<ITypeName>} rgpArguments 
     * @param {Pointer<Integer>} pCount 
     * @returns {HRESULT} 
     */
    GetTypeArguments(count, rgpArguments, pCount) {
        pCountMarshal := pCount is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, "uint", count, "ptr*", rgpArguments, pCountMarshal, pCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pCount 
     * @returns {HRESULT} 
     */
    GetModifierLength(pCount) {
        pCountMarshal := pCount is VarRef ? "uint*" : "ptr"

        result := ComCall(7, this, pCountMarshal, pCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} count 
     * @param {Pointer<Integer>} rgModifiers 
     * @param {Pointer<Integer>} pCount 
     * @returns {HRESULT} 
     */
    GetModifiers(count, rgModifiers, pCount) {
        rgModifiersMarshal := rgModifiers is VarRef ? "uint*" : "ptr"
        pCountMarshal := pCount is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, "uint", count, rgModifiersMarshal, rgModifiers, pCountMarshal, pCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} rgbszAssemblyNames 
     * @returns {HRESULT} 
     */
    GetAssemblyName(rgbszAssemblyNames) {
        result := ComCall(9, this, "ptr", rgbszAssemblyNames, "HRESULT")
        return result
    }
}
