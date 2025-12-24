#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IProvideWinSATAssessmentInfo.ahk
#Include ..\Variant\VARIANT.ahk
#Include ..\..\Foundation\BSTR.ahk
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
     * @type {Integer} 
     */
    AssessmentState {
        get => this.get_AssessmentState()
    }

    /**
     * @type {VARIANT} 
     */
    AssessmentDateTime {
        get => this.get_AssessmentDateTime()
    }

    /**
     * @type {Float} 
     */
    SystemRating {
        get => this.get_SystemRating()
    }

    /**
     * @type {BSTR} 
     */
    RatingStateDesc {
        get => this.get_RatingStateDesc()
    }

    /**
     * Retrieves summary information for a subcomponent of the assessment.
     * @param {Integer} assessment A subcomponent of the assessment whose summary information you want to retrieve. For possible values, see the <a href="https://docs.microsoft.com/windows/win32/api/winsatcominterfacei/ne-winsatcominterfacei-winsat_assessment_type">WINSAT_ASSESSMENT_TYPE</a> enumeration.
     * @returns {IProvideWinSATAssessmentInfo} An <a href="https://docs.microsoft.com/windows/desktop/api/winsatcominterfacei/nn-winsatcominterfacei-iprovidewinsatassessmentinfo">IProvideWinSATAssessmentInfo</a> interface that you use to get the score for the subcomponent.
     * @see https://docs.microsoft.com/windows/win32/api//winsatcominterfacei/nf-winsatcominterfacei-iprovidewinsatresultsinfo-getassessmentinfo
     */
    GetAssessmentInfo(assessment) {
        result := ComCall(7, this, "int", assessment, "ptr*", &ppinfo := 0, "HRESULT")
        return IProvideWinSATAssessmentInfo(ppinfo)
    }

    /**
     * Retrieves the state of the assessment.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//winsatcominterfacei/nf-winsatcominterfacei-iprovidewinsatresultsinfo-get_assessmentstate
     */
    get_AssessmentState() {
        result := ComCall(8, this, "int*", &state := 0, "HRESULT")
        return state
    }

    /**
     * Retrieves the date and time that the assessment was run.
     * @returns {VARIANT} 
     * @see https://docs.microsoft.com/windows/win32/api//winsatcominterfacei/nf-winsatcominterfacei-iprovidewinsatresultsinfo-get_assessmentdatetime
     */
    get_AssessmentDateTime() {
        fileTime := VARIANT()
        result := ComCall(9, this, "ptr", fileTime, "HRESULT")
        return fileTime
    }

    /**
     * Retrieves the base score for the computer.
     * @remarks
     * 
     * The Windows Experience Index feature measures the capability of your computer's hardware configuration and expresses this measurement as a number called a base score. A higher base score generally means that your computer will perform better and faster than a computer with a lower base score, especially when performing more advanced and resource-intensive tasks. 
     * 
     * 
     * 
     * Each hardware component receives an individual subscore. Your computer's base score is determined by the lowest subscore. For example, if the lowest subscore of an individual hardware component is 2.6, then the base score is 2.6. The base score is not an average of the combined subscores.
     * 
     * 
     * 
     * You can use the base score to confidently buy programs and other software that are matched to your computer's base score. For example, if your computer has a base score of 3.3, then you can confidently purchase any software designed for this version of Windows that requires a computer with a base score of 3 or lower.
     * 
     * 
     * To get the score for a subcomponent of the assessment, such as the CPU, call the <a href="https://docs.microsoft.com/windows/desktop/api/winsatcominterfacei/nf-winsatcominterfacei-iprovidewinsatassessmentinfo-get_score">IProvideWinSATAssessmentInfo::get_Score</a> method.
     * 
     * 
     * 
     * @returns {Float} 
     * @see https://docs.microsoft.com/windows/win32/api//winsatcominterfacei/nf-winsatcominterfacei-iprovidewinsatresultsinfo-get_systemrating
     */
    get_SystemRating() {
        result := ComCall(10, this, "float*", &level := 0, "HRESULT")
        return level
    }

    /**
     * Retrieves a string that you can use in a UI to indicate whether the assessment is valid.
     * @remarks
     * 
     * If the assessment is valid, the string is "Windows Experience Index"; otherwise, the string is "Windows Experience Index : Unrated". To determine the validity of the assessment, call the <a href="https://docs.microsoft.com/windows/desktop/api/winsatcominterfacei/nf-winsatcominterfacei-iprovidewinsatresultsinfo-get_assessmentstate">IProvideWinSATResultsInfo::get_AssessmentState</a> method.
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//winsatcominterfacei/nf-winsatcominterfacei-iprovidewinsatresultsinfo-get_ratingstatedesc
     */
    get_RatingStateDesc() {
        description := BSTR()
        result := ComCall(11, this, "ptr", description, "HRESULT")
        return description
    }
}
