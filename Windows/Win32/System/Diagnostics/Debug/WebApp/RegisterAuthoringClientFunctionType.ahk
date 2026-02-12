#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * Defines a pointer to an application-defined function in a dynamic-link library (DLL) that will be used as the authoring binary. When the app host starts in authoring mode, this function is called to initialize the authoring binary.
 * @see https://learn.microsoft.com/windows/win32/api//content/webapplication/nc-webapplication-registerauthoringclientfunctiontype
 * @namespace Windows.Win32.System.Diagnostics.Debug.WebApp
 * @version v4.0.30319
 */
class RegisterAuthoringClientFunctionType extends IUnknown {

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Invoke"]

    /**
     * Invokes helper functionality for the IDispatch interface.
     * @param {IWebApplicationAuthoringMode} authoringModeObject 
     * @param {IWebApplicationHost} host 
     * @returns {HRESULT} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(authoringModeObject, host) {
        result := ComCall(3, this, "ptr", authoringModeObject, "ptr", host, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
