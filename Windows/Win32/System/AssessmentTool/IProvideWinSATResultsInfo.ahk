#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Gets information about the results of an assessment, for example, the base score and the date that the assessment was run.
 * @see https://docs.microsoft.com/windows/win32/api//winsatcominterfacei/nn-winsatcominterfacei-iprovidewinsatresultsinfo
 * @namespace Windows.Win32.System.AssessmentTool
 * @version v4.0.30319
 */
class IProvideWinSATResultsInfo extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IProvideWinSATResultsInfo
     * @type {Guid}
     */
    static IID => Guid("{f8334d5d-568e-4075-875f-9df341506640}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetAssessmentInfo", "get_AssessmentState", "get_AssessmentDateTime", "get_SystemRating", "get_RatingStateDesc"]

    /**
     * 
     * @param {Integer} assessment 
     * @param {Pointer<IProvideWinSATAssessmentInfo>} ppinfo 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsatcominterfacei/nf-winsatcominterfacei-iprovidewinsatresultsinfo-getassessmentinfo
     */
    GetAssessmentInfo(assessment, ppinfo) {
        result := ComCall(7, this, "int", assessment, "ptr*", ppinfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} state 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsatcominterfacei/nf-winsatcominterfacei-iprovidewinsatresultsinfo-get_assessmentstate
     */
    get_AssessmentState(state) {
        result := ComCall(8, this, "int*", state, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} fileTime 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsatcominterfacei/nf-winsatcominterfacei-iprovidewinsatresultsinfo-get_assessmentdatetime
     */
    get_AssessmentDateTime(fileTime) {
        result := ComCall(9, this, "ptr", fileTime, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} level 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsatcominterfacei/nf-winsatcominterfacei-iprovidewinsatresultsinfo-get_systemrating
     */
    get_SystemRating(level) {
        result := ComCall(10, this, "float*", level, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} description 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsatcominterfacei/nf-winsatcominterfacei-iprovidewinsatresultsinfo-get_ratingstatedesc
     */
    get_RatingStateDesc(description) {
        result := ComCall(11, this, "ptr", description, "HRESULT")
        return result
    }
}
