#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
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
     * @returns {Integer} 
     */
    GetNameCount() {
        result := ComCall(3, this, "uint*", &pCount := 0, "HRESULT")
        return pCount
    }

    /**
     * 
     * @param {Integer} count 
     * @param {Pointer<BSTR>} rgbszNames 
     * @returns {Integer} 
     */
    GetNames(count, rgbszNames) {
        result := ComCall(4, this, "uint", count, "ptr", rgbszNames, "uint*", &pCount := 0, "HRESULT")
        return pCount
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetTypeArgumentCount() {
        result := ComCall(5, this, "uint*", &pCount := 0, "HRESULT")
        return pCount
    }

    /**
     * 
     * @param {Integer} count 
     * @param {Pointer<ITypeName>} rgpArguments 
     * @returns {Integer} 
     */
    GetTypeArguments(count, rgpArguments) {
        result := ComCall(6, this, "uint", count, "ptr*", rgpArguments, "uint*", &pCount := 0, "HRESULT")
        return pCount
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetModifierLength() {
        result := ComCall(7, this, "uint*", &pCount := 0, "HRESULT")
        return pCount
    }

    /**
     * 
     * @param {Integer} count 
     * @param {Pointer<Integer>} rgModifiers 
     * @returns {Integer} 
     */
    GetModifiers(count, rgModifiers) {
        rgModifiersMarshal := rgModifiers is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, "uint", count, rgModifiersMarshal, rgModifiers, "uint*", &pCount := 0, "HRESULT")
        return pCount
    }

    /**
     * 
     * @returns {BSTR} 
     */
    GetAssemblyName() {
        rgbszAssemblyNames := BSTR()
        result := ComCall(9, this, "ptr", rgbszAssemblyNames, "HRESULT")
        return rgbszAssemblyNames
    }
}
