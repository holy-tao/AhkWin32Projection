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
     * 
     * @param {Integer} assessment 
     * @param {Pointer<IProvideWinSATAssessmentInfo>} ppinfo 
     * @returns {HRESULT} 
     */
    GetAssessmentInfo(assessment, ppinfo) {
        result := ComCall(7, this, "int", assessment, "ptr", ppinfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} state 
     * @returns {HRESULT} 
     */
    get_AssessmentState(state) {
        result := ComCall(8, this, "int*", state, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} fileTime 
     * @returns {HRESULT} 
     */
    get_AssessmentDateTime(fileTime) {
        result := ComCall(9, this, "ptr", fileTime, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Single>} level 
     * @returns {HRESULT} 
     */
    get_SystemRating(level) {
        result := ComCall(10, this, "float*", level, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} description 
     * @returns {HRESULT} 
     */
    get_RatingStateDesc(description) {
        result := ComCall(11, this, "ptr", description, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
