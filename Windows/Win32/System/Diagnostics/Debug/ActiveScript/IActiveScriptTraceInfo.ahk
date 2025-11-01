#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 * @version v4.0.30319
 */
class IActiveScriptTraceInfo extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IActiveScriptTraceInfo
     * @type {Guid}
     */
    static IID => Guid("{c35456e7-bebf-4a1b-86a9-24d56be8b369}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["StartScriptTracing", "StopScriptTracing"]

    /**
     * 
     * @param {IActiveScriptSiteTraceInfo} pSiteTraceInfo 
     * @param {Guid} guidContextID 
     * @returns {HRESULT} 
     */
    StartScriptTracing(pSiteTraceInfo, guidContextID) {
        result := ComCall(3, this, "ptr", pSiteTraceInfo, "ptr", guidContextID, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    StopScriptTracing() {
        result := ComCall(4, this, "HRESULT")
        return result
    }
}
