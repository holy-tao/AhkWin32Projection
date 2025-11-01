#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 * @version v4.0.30319
 */
class IActiveScriptSiteTraceInfo extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IActiveScriptSiteTraceInfo
     * @type {Guid}
     */
    static IID => Guid("{4b7272ae-1955-4bfe-98b0-780621888569}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SendScriptTraceInfo"]

    /**
     * 
     * @param {Integer} stiEventType 
     * @param {Guid} guidContextID 
     * @param {Integer} dwScriptContextCookie 
     * @param {Integer} lScriptStatementStart 
     * @param {Integer} lScriptStatementEnd 
     * @param {Integer} dwReserved 
     * @returns {HRESULT} 
     */
    SendScriptTraceInfo(stiEventType, guidContextID, dwScriptContextCookie, lScriptStatementStart, lScriptStatementEnd, dwReserved) {
        result := ComCall(3, this, "int", stiEventType, "ptr", guidContextID, "uint", dwScriptContextCookie, "int", lScriptStatementStart, "int", lScriptStatementEnd, "uint", dwReserved, "HRESULT")
        return result
    }
}
