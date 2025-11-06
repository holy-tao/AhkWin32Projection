#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include .\IDebugHostType.ahk
#Include .\IDebugHostModule3.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IDebugHostModule4 extends IDebugHostModule3{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDebugHostModule4
     * @type {Guid}
     */
    static IID => Guid("{41415136-38a4-474f-8e98-57e2dc64e565}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 18

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["FindTypeByName2"]

    /**
     * 
     * @param {IDebugHostSymbol} pEnclosingSymbol 
     * @param {PWSTR} typeName 
     * @returns {IDebugHostType} 
     */
    FindTypeByName2(pEnclosingSymbol, typeName) {
        typeName := typeName is String ? StrPtr(typeName) : typeName

        result := ComCall(18, this, "ptr", pEnclosingSymbol, "ptr", typeName, "ptr*", &type := 0, "HRESULT")
        return IDebugHostType(type)
    }
}
