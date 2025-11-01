#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 * @version v4.0.30319
 */
class IActiveScriptStringCompare extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IActiveScriptStringCompare
     * @type {Guid}
     */
    static IID => Guid("{58562769-ed52-42f7-8403-4963514e1f11}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["StrComp"]

    /**
     * 
     * @param {BSTR} bszStr1 
     * @param {BSTR} bszStr2 
     * @param {Pointer<Integer>} iRet 
     * @returns {HRESULT} 
     */
    StrComp(bszStr1, bszStr2, iRet) {
        bszStr1 := bszStr1 is String ? BSTR.Alloc(bszStr1).Value : bszStr1
        bszStr2 := bszStr2 is String ? BSTR.Alloc(bszStr2).Value : bszStr2

        iRetMarshal := iRet is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, "ptr", bszStr1, "ptr", bszStr2, iRetMarshal, iRet, "HRESULT")
        return result
    }
}
