#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include .\IDataModelScript.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IDataModelScript2 extends IDataModelScript{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDataModelScript2
     * @type {Guid}
     */
    static IID => Guid("{7d90cf81-bee2-4b91-9d49-8fec0f7d56d1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 10

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetScriptFullFilePathName", "SetScriptFullFilePathName"]

    /**
     * 
     * @param {Pointer<BSTR>} scriptFullPathName 
     * @returns {HRESULT} 
     */
    GetScriptFullFilePathName(scriptFullPathName) {
        result := ComCall(10, this, "ptr", scriptFullPathName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} scriptFullPathName 
     * @returns {HRESULT} 
     */
    SetScriptFullFilePathName(scriptFullPathName) {
        scriptFullPathName := scriptFullPathName is String ? StrPtr(scriptFullPathName) : scriptFullPathName

        result := ComCall(11, this, "ptr", scriptFullPathName, "HRESULT")
        return result
    }
}
