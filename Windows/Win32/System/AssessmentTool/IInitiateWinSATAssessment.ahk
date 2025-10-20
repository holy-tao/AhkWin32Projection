#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Initiates an assessment.
 * @see https://docs.microsoft.com/windows/win32/api//winsatcominterfacei/nn-winsatcominterfacei-iinitiatewinsatassessment
 * @namespace Windows.Win32.System.AssessmentTool
 * @version v4.0.30319
 */
class IInitiateWinSATAssessment extends IUnknown{
    /**
     * The interface identifier for IInitiateWinSATAssessment
     * @type {Guid}
     */
    static IID => Guid("{d983fc50-f5bf-49d5-b5ed-cccb18aa7fc1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {PWSTR} cmdLine 
     * @param {Pointer<IWinSATInitiateEvents>} pCallbacks 
     * @param {HWND} callerHwnd 
     * @returns {HRESULT} 
     */
    InitiateAssessment(cmdLine, pCallbacks, callerHwnd) {
        cmdLine := cmdLine is String ? StrPtr(cmdLine) : cmdLine
        callerHwnd := callerHwnd is Win32Handle ? NumGet(callerHwnd, "ptr") : callerHwnd

        result := ComCall(3, this, "ptr", cmdLine, "ptr", pCallbacks, "ptr", callerHwnd, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IWinSATInitiateEvents>} pCallbacks 
     * @param {HWND} callerHwnd 
     * @returns {HRESULT} 
     */
    InitiateFormalAssessment(pCallbacks, callerHwnd) {
        callerHwnd := callerHwnd is Win32Handle ? NumGet(callerHwnd, "ptr") : callerHwnd

        result := ComCall(4, this, "ptr", pCallbacks, "ptr", callerHwnd, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    CancelAssessment() {
        result := ComCall(5, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
