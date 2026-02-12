#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * Enables a debugging or authoring app to receive notification of user interface events and respond to events that require user interaction.
 * @see https://learn.microsoft.com/windows/win32/api//content/webapplication/nn-webapplication-iwebapplicationuievents
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
     * Notifies the authoring app about an authentication problem.
     * @param {Integer} securityProblem Type: <b>DWORD</b>
     * 
     * The security problem encountered.
     * @param {Pointer<HRESULT>} result_ Type: <b>HRESULT*</b>
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/webapplication/nf-webapplication-iwebapplicationuievents-securityproblem
     */
    SecurityProblem(securityProblem, result_) {
        result_Marshal := result_ is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, "uint", securityProblem, result_Marshal, result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
