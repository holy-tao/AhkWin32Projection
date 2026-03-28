#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Implement this interface to receive notifications when an assessment is complete or making progress.
 * @see https://learn.microsoft.com/windows/win32/api/winsatcominterfacei/nn-winsatcominterfacei-iwinsatinitiateevents
 * @namespace Windows.Win32.System.AssessmentTool
 * @version v4.0.30319
 */
class IWinSATInitiateEvents extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWinSATInitiateEvents
     * @type {Guid}
     */
    static IID => Guid("{262a1918-ba0d-41d5-92c2-fab4633ee74f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["WinSATComplete", "WinSATUpdate"]

    /**
     * Receives notification when an assessment succeeds, fails, or is canceled.
     * @param {HRESULT} _hresult 
     * @param {PWSTR} strDescription The description of the completion status. This string is valid during the life of this callback. Copy the string if you need it after the callback returns.
     * @returns {HRESULT} This method should return  S_OK; the value is ignored.
     * @see https://learn.microsoft.com/windows/win32/api/winsatcominterfacei/nf-winsatcominterfacei-iwinsatinitiateevents-winsatcomplete
     */
    WinSATComplete(_hresult, strDescription) {
        strDescription := strDescription is String ? StrPtr(strDescription) : strDescription

        result := ComCall(3, this, "int", _hresult, "ptr", strDescription, "HRESULT")
        return result
    }

    /**
     * Receives notification when an assessment is making progress.
     * @remarks
     * You can use this method to determine the progress of a formal assessment.  
     * 
     * <div class="alert"><b>Note</b>  You can use the <i>uCurrentTick</i> and <i>uTickTotal</i> values to mark progress for formal assessments only; the values are zero for all other assessments.</div>
     * <div> </div>
     * You should keep your implementation short so you do not miss subsequent updates; you will not get new updates until the method returns.
     * 
     * <div class="alert"><b>Note</b>  If an instance of WinSAT is already running, it is possible that you could receive one or more update callbacks for the currently running assessment.</div>
     * <div> </div>
     * @param {Integer} uCurrentTick The current progress tick of the assessment.
     * @param {Integer} uTickTotal The total number of progress ticks for the assessment.
     * @param {PWSTR} strCurrentState A string that contains the current state of the assessment. This string is valid during the life of this callback. Copy the string if you need it after the callback returns.
     * @returns {HRESULT} This method should return  S_OK; the value is ignored.
     * @see https://learn.microsoft.com/windows/win32/api/winsatcominterfacei/nf-winsatcominterfacei-iwinsatinitiateevents-winsatupdate
     */
    WinSATUpdate(uCurrentTick, uTickTotal, strCurrentState) {
        strCurrentState := strCurrentState is String ? StrPtr(strCurrentState) : strCurrentState

        result := ComCall(4, this, "uint", uCurrentTick, "uint", uTickTotal, "ptr", strCurrentState, "HRESULT")
        return result
    }
}
