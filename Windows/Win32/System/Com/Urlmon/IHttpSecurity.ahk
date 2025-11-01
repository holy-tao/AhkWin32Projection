#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IWindowForBindingUI.ahk

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 * @version v4.0.30319
 */
class IHttpSecurity extends IWindowForBindingUI{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHttpSecurity
     * @type {Guid}
     */
    static IID => Guid("{79eac9d7-bafa-11ce-8c82-00aa004ba90b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnSecurityProblem"]

    /**
     * 
     * @param {Integer} dwProblem 
     * @returns {HRESULT} 
     */
    OnSecurityProblem(dwProblem) {
        result := ComCall(4, this, "uint", dwProblem, "HRESULT")
        return result
    }
}
