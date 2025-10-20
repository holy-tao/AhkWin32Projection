#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.ClrHosting
 * @version v4.0.30319
 */
class ITypeNameFactory extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITypeNameFactory
     * @type {Guid}
     */
    static IID => Guid("{b81ff171-20f3-11d2-8dcc-00a0c9b00521}")

    /**
     * The class identifier for TypeNameFactory
     * @type {Guid}
     */
    static CLSID => Guid("{b81ff171-20f3-11d2-8dcc-00a0c9b00525}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ParseTypeName", "GetTypeNameBuilder"]

    /**
     * 
     * @param {PWSTR} szName 
     * @param {Pointer<Integer>} pError 
     * @param {Pointer<ITypeName>} ppTypeName 
     * @returns {HRESULT} 
     */
    ParseTypeName(szName, pError, ppTypeName) {
        szName := szName is String ? StrPtr(szName) : szName

        result := ComCall(3, this, "ptr", szName, "uint*", pError, "ptr*", ppTypeName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ITypeNameBuilder>} ppTypeBuilder 
     * @returns {HRESULT} 
     */
    GetTypeNameBuilder(ppTypeBuilder) {
        result := ComCall(4, this, "ptr*", ppTypeBuilder, "HRESULT")
        return result
    }
}
