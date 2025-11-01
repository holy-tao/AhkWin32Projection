#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IScriptEventHandlerSourceInfo extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IScriptEventHandlerSourceInfo
     * @type {Guid}
     */
    static IID => Guid("{30510841-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetSourceInfo"]

    /**
     * 
     * @param {Pointer<BSTR>} pbstrFunctionName 
     * @param {Pointer<Integer>} line 
     * @param {Pointer<Integer>} column 
     * @param {Pointer<Integer>} cchLength 
     * @returns {HRESULT} 
     */
    GetSourceInfo(pbstrFunctionName, line, column, cchLength) {
        lineMarshal := line is VarRef ? "uint*" : "ptr"
        columnMarshal := column is VarRef ? "uint*" : "ptr"
        cchLengthMarshal := cchLength is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "ptr", pbstrFunctionName, lineMarshal, line, columnMarshal, column, cchLengthMarshal, cchLength, "HRESULT")
        return result
    }
}
