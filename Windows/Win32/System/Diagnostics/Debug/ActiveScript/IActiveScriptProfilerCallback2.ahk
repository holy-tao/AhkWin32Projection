#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include .\IActiveScriptProfilerCallback.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 * @version v4.0.30319
 */
class IActiveScriptProfilerCallback2 extends IActiveScriptProfilerCallback{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IActiveScriptProfilerCallback2
     * @type {Guid}
     */
    static IID => Guid("{31b7f8ad-a637-409c-b22f-040995b6103d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 9

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnFunctionEnterByName", "OnFunctionExitByName"]

    /**
     * 
     * @param {PWSTR} pwszFunctionName 
     * @param {Integer} type 
     * @returns {HRESULT} 
     */
    OnFunctionEnterByName(pwszFunctionName, type) {
        pwszFunctionName := pwszFunctionName is String ? StrPtr(pwszFunctionName) : pwszFunctionName

        result := ComCall(9, this, "ptr", pwszFunctionName, "int", type, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwszFunctionName 
     * @param {Integer} type 
     * @returns {HRESULT} 
     */
    OnFunctionExitByName(pwszFunctionName, type) {
        pwszFunctionName := pwszFunctionName is String ? StrPtr(pwszFunctionName) : pwszFunctionName

        result := ComCall(10, this, "ptr", pwszFunctionName, "int", type, "HRESULT")
        return result
    }
}
