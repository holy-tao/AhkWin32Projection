#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Defines task variables that can be passed as parameters to task handlers and external executables that are launched by tasks.
 * @see https://docs.microsoft.com/windows/win32/api//taskschd/nn-taskschd-itaskvariables
 * @namespace Windows.Win32.System.TaskScheduler
 * @version v4.0.30319
 */
class ITaskVariables extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITaskVariables
     * @type {Guid}
     */
    static IID => Guid("{3e4c9351-d966-4b8b-bb87-ceba68bb0107}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetInput", "SetOutput", "GetContext"]

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itaskvariables-getinput
     */
    GetInput() {
        pInput := BSTR()
        result := ComCall(3, this, "ptr", pInput, "HRESULT")
        return pInput
    }

    /**
     * 
     * @param {BSTR} input 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itaskvariables-setoutput
     */
    SetOutput(input) {
        input := input is String ? BSTR.Alloc(input).Value : input

        result := ComCall(4, this, "ptr", input, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itaskvariables-getcontext
     */
    GetContext() {
        pContext := BSTR()
        result := ComCall(5, this, "ptr", pContext, "HRESULT")
        return pContext
    }
}
