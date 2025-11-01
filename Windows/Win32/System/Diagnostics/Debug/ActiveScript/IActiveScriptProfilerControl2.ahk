#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include .\IActiveScriptProfilerControl.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 * @version v4.0.30319
 */
class IActiveScriptProfilerControl2 extends IActiveScriptProfilerControl{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IActiveScriptProfilerControl2
     * @type {Guid}
     */
    static IID => Guid("{47810165-498f-40be-94f1-653557e9e7da}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CompleteProfilerStart", "PrepareProfilerStop"]

    /**
     * 
     * @returns {HRESULT} 
     */
    CompleteProfilerStart() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    PrepareProfilerStop() {
        result := ComCall(7, this, "HRESULT")
        return result
    }
}
