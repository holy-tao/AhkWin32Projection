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
     * 
     * @param {Integer} assessment 
     * @returns {IProvideWinSATAssessmentInfo} 
     * @see https://learn.microsoft.com/windows/win32/api/winsatcominterfacei/nf-winsatcominterfacei-iprovidewinsatresultsinfo-getassessmentinfo
     */
    GetAssessmentInfo(assessment) {
        result := ComCall(7, this, "int", assessment, "ptr*", &ppinfo := 0, "HRESULT")
        return IProvideWinSATAssessmentInfo(ppinfo)
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/winsatcominterfacei/nf-winsatcominterfacei-iprovidewinsatresultsinfo-get_assessmentstate
     */
    get_AssessmentState() {
        result := ComCall(8, this, "int*", &state := 0, "HRESULT")
        return state
    }

    /**
     * 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsatcominterfacei/nf-winsatcominterfacei-iprovidewinsatresultsinfo-get_assessmentdatetime
     */
    get_AssessmentDateTime() {
        fileTime := VARIANT()
        result := ComCall(9, this, "ptr", fileTime, "HRESULT")
        return fileTime
    }

    /**
     * 
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/winsatcominterfacei/nf-winsatcominterfacei-iprovidewinsatresultsinfo-get_systemrating
     */
    get_SystemRating() {
        result := ComCall(10, this, "float*", &level := 0, "HRESULT")
        return level
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/winsatcominterfacei/nf-winsatcominterfacei-iprovidewinsatresultsinfo-get_ratingstatedesc
     */
    get_RatingStateDesc() {
        description := BSTR()
        result := ComCall(11, this, "ptr", description, "HRESULT")
        return description
    }
}
