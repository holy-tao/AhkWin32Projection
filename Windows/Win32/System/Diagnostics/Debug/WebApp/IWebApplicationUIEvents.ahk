#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * Enables a debugging or authoring app to receive notification of user interface events and respond to events that require user interaction.
 * @see https://docs.microsoft.com/windows/win32/api//webapplication/nn-webapplication-iwebapplicationuievents
 * @namespace Windows.Win32.System.Diagnostics.Debug.WebApp
 * @version v4.0.30319
 */
class IWebApplicationUIEvents extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWebApplicationUIEvents
     * @type {Guid}
     */
    static IID => Guid("{5b2b3f99-328c-41d5-a6f7-7483ed8e71dd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SecurityProblem"]

    /**
     * 
     * @param {Integer} securityProblem 
     * @param {Pointer<HRESULT>} result 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/webapplication/nf-webapplication-iwebapplicationuievents-securityproblem
     */
    SecurityProblem(securityProblem, result) {
        result := ComCall(3, this, "uint", securityProblem, "ptr", result, "HRESULT")
        return result
    }
}
