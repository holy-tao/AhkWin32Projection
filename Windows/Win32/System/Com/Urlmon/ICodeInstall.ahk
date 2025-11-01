#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IWindowForBindingUI.ahk

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 * @version v4.0.30319
 */
class ICodeInstall extends IWindowForBindingUI{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICodeInstall
     * @type {Guid}
     */
    static IID => Guid("{79eac9d1-baf9-11ce-8c82-00aa004ba90b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnCodeInstallProblem"]

    /**
     * 
     * @param {Integer} ulStatusCode 
     * @param {PWSTR} szDestination 
     * @param {PWSTR} szSource 
     * @param {Integer} dwReserved 
     * @returns {HRESULT} 
     */
    OnCodeInstallProblem(ulStatusCode, szDestination, szSource, dwReserved) {
        szDestination := szDestination is String ? StrPtr(szDestination) : szDestination
        szSource := szSource is String ? StrPtr(szSource) : szSource

        result := ComCall(4, this, "uint", ulStatusCode, "ptr", szDestination, "ptr", szSource, "uint", dwReserved, "HRESULT")
        return result
    }
}
