#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Gets summary information for a subcomponent of the assessment, for example, its score.
 * @remarks
 * 
  * To retrieve details of the subcomponent, call the <a href="https://docs.microsoft.com/windows/desktop/api/winsatcominterfacei/nf-winsatcominterfacei-iqueryrecentwinsatassessment-get_xml">IQueryRecentWinSATAssessment::get_XML</a> method.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//winsatcominterfacei/nn-winsatcominterfacei-iprovidewinsatassessmentinfo
 * @namespace Windows.Win32.System.AssessmentTool
 * @version v4.0.30319
 */
class IProvideWinSATAssessmentInfo extends IDispatch{
    /**
     * The interface identifier for IProvideWinSATAssessmentInfo
     * @type {Guid}
     */
    static IID => Guid("{0cd1c380-52d3-4678-ac6f-e929e480be9e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<Single>} score 
     * @returns {HRESULT} 
     */
    get_Score(score) {
        result := ComCall(7, this, "float*", score, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} title 
     * @returns {HRESULT} 
     */
    get_Title(title) {
        result := ComCall(8, this, "ptr", title, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} description 
     * @returns {HRESULT} 
     */
    get_Description(description) {
        result := ComCall(9, this, "ptr", description, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
