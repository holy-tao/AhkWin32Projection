#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IScriptEventHandlerSourceInfo extends IUnknown{
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
     * 
     * @param {Pointer<BSTR>} pbstrFunctionName 
     * @param {Pointer<UInt32>} line 
     * @param {Pointer<UInt32>} column 
     * @param {Pointer<UInt32>} cchLength 
     * @returns {HRESULT} 
     */
    GetSourceInfo(pbstrFunctionName, line, column, cchLength) {
        result := ComCall(3, this, "ptr", pbstrFunctionName, "uint*", line, "uint*", column, "uint*", cchLength, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
