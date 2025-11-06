#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\ISWbemObject.ahk
#Include .\ISWbemQualifierSet.ahk
#Include ..\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class ISWbemMethod extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISWbemMethod
     * @type {Guid}
     */
    static IID => Guid("{422e8e90-d955-11d1-8b09-00600806d9b6}")

    /**
     * The class identifier for SWbemMethod
     * @type {Guid}
     */
    static CLSID => Guid("{04b83d5b-21ae-11d2-8b33-00600806d9b6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Name", "get_Origin", "get_InParameters", "get_OutParameters", "get_Qualifiers_"]

    /**
     * 
     * @returns {BSTR} 
     */
    get_Name() {
        strName := BSTR()
        result := ComCall(7, this, "ptr", strName, "HRESULT")
        return strName
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Origin() {
        strOrigin := BSTR()
        result := ComCall(8, this, "ptr", strOrigin, "HRESULT")
        return strOrigin
    }

    /**
     * 
     * @returns {ISWbemObject} 
     */
    get_InParameters() {
        result := ComCall(9, this, "ptr*", &objWbemInParameters := 0, "HRESULT")
        return ISWbemObject(objWbemInParameters)
    }

    /**
     * 
     * @returns {ISWbemObject} 
     */
    get_OutParameters() {
        result := ComCall(10, this, "ptr*", &objWbemOutParameters := 0, "HRESULT")
        return ISWbemObject(objWbemOutParameters)
    }

    /**
     * 
     * @returns {ISWbemQualifierSet} 
     */
    get_Qualifiers_() {
        result := ComCall(11, this, "ptr*", &objWbemQualifierSet := 0, "HRESULT")
        return ISWbemQualifierSet(objWbemQualifierSet)
    }
}
