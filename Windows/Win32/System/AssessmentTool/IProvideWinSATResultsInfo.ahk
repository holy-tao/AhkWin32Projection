#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\WINSAT_ASSESSMENT_STATE.ahk" { WINSAT_ASSESSMENT_STATE }
#Import ".\IProvideWinSATAssessmentInfo.ahk" { IProvideWinSATAssessmentInfo }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Variant\VARIANT.ahk" { VARIANT }
#Import ".\WINSAT_ASSESSMENT_TYPE.ahk" { WINSAT_ASSESSMENT_TYPE }

/**
 * Gets information about the results of an assessment, for example, the base score and the date that the assessment was run.
 * @see https://learn.microsoft.com/windows/win32/api/winsatcominterfacei/nn-winsatcominterfacei-iprovidewinsatresultsinfo
 * @namespace Windows.Win32.System.AssessmentTool
 */
export default struct IProvideWinSATResultsInfo extends IDispatch {
    /**
     * The interface identifier for IProvideWinSATResultsInfo
     * @type {Guid}
     */
    static IID := Guid("{f8334d5d-568e-4075-875f-9df341506640}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IProvideWinSATResultsInfo interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        GetAssessmentInfo      : IntPtr
        get_AssessmentState    : IntPtr
        get_AssessmentDateTime : IntPtr
        get_SystemRating       : IntPtr
        get_RatingStateDesc    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IProvideWinSATResultsInfo.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {WINSAT_ASSESSMENT_STATE} 
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
     * @param {WINSAT_ASSESSMENT_TYPE} assessment A subcomponent of the assessment whose summary information you want to retrieve. For possible values, see the <a href="https://docs.microsoft.com/windows/win32/api/winsatcominterfacei/ne-winsatcominterfacei-winsat_assessment_type">WINSAT_ASSESSMENT_TYPE</a> enumeration.
     * @returns {IProvideWinSATAssessmentInfo} An <a href="https://docs.microsoft.com/windows/desktop/api/winsatcominterfacei/nn-winsatcominterfacei-iprovidewinsatassessmentinfo">IProvideWinSATAssessmentInfo</a> interface that you use to get the score for the subcomponent.
     * @see https://learn.microsoft.com/windows/win32/api/winsatcominterfacei/nf-winsatcominterfacei-iprovidewinsatresultsinfo-getassessmentinfo
     */
    GetAssessmentInfo(assessment) {
        result := ComCall(7, this, WINSAT_ASSESSMENT_TYPE, assessment, "ptr*", &ppinfo := 0, "HRESULT")
        return IProvideWinSATAssessmentInfo(ppinfo)
    }

    /**
     * Retrieves the state of the assessment.
     * @returns {WINSAT_ASSESSMENT_STATE} 
     * @see https://learn.microsoft.com/windows/win32/api/winsatcominterfacei/nf-winsatcominterfacei-iprovidewinsatresultsinfo-get_assessmentstate
     */
    get_AssessmentState() {
        result := ComCall(8, this, "int*", &state := 0, "HRESULT")
        return state
    }

    /**
     * Retrieves the date and time that the assessment was run.
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsatcominterfacei/nf-winsatcominterfacei-iprovidewinsatresultsinfo-get_assessmentdatetime
     */
    get_AssessmentDateTime() {
        _fileTime := VARIANT()
        result := ComCall(9, this, VARIANT.Ptr, _fileTime, "HRESULT")
        return _fileTime
    }

    /**
     * Retrieves the base score for the computer.
     * @remarks
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
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/winsatcominterfacei/nf-winsatcominterfacei-iprovidewinsatresultsinfo-get_systemrating
     */
    get_SystemRating() {
        result := ComCall(10, this, "float*", &level := 0, "HRESULT")
        return level
    }

    /**
     * Retrieves a string that you can use in a UI to indicate whether the assessment is valid.
     * @remarks
     * If the assessment is valid, the string is "Windows Experience Index"; otherwise, the string is "Windows Experience Index : Unrated". To determine the validity of the assessment, call the <a href="https://docs.microsoft.com/windows/desktop/api/winsatcominterfacei/nf-winsatcominterfacei-iprovidewinsatresultsinfo-get_assessmentstate">IProvideWinSATResultsInfo::get_AssessmentState</a> method.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/winsatcominterfacei/nf-winsatcominterfacei-iprovidewinsatresultsinfo-get_ratingstatedesc
     */
    get_RatingStateDesc() {
        description := BSTR.Owned()
        result := ComCall(11, this, BSTR.Ptr, description, "HRESULT")
        return description
    }

    Query(iid) {
        if (IProvideWinSATResultsInfo.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetAssessmentInfo := CallbackCreate(GetMethod(implObj, "GetAssessmentInfo"), flags, 3)
        this.vtbl.get_AssessmentState := CallbackCreate(GetMethod(implObj, "get_AssessmentState"), flags, 2)
        this.vtbl.get_AssessmentDateTime := CallbackCreate(GetMethod(implObj, "get_AssessmentDateTime"), flags, 2)
        this.vtbl.get_SystemRating := CallbackCreate(GetMethod(implObj, "get_SystemRating"), flags, 2)
        this.vtbl.get_RatingStateDesc := CallbackCreate(GetMethod(implObj, "get_RatingStateDesc"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetAssessmentInfo)
        CallbackFree(this.vtbl.get_AssessmentState)
        CallbackFree(this.vtbl.get_AssessmentDateTime)
        CallbackFree(this.vtbl.get_SystemRating)
        CallbackFree(this.vtbl.get_RatingStateDesc)
    }
}
