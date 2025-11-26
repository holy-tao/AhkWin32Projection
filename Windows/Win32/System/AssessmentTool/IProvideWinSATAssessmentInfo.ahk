#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Score", "get_Title", "get_Description"]

    /**
     * @type {Float} 
     */
    Score {
        get => this.get_Score()
    }

    /**
     * @type {BSTR} 
     */
    Title {
        get => this.get_Title()
    }

    /**
     * @type {BSTR} 
     */
    Description {
        get => this.get_Description()
    }

    /**
     * 
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/winsatcominterfacei/nf-winsatcominterfacei-iprovidewinsatassessmentinfo-get_score
     */
    get_Score() {
        result := ComCall(7, this, "float*", &score := 0, "HRESULT")
        return score
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/winsatcominterfacei/nf-winsatcominterfacei-iprovidewinsatassessmentinfo-get_title
     */
    get_Title() {
        title := BSTR()
        result := ComCall(8, this, "ptr", title, "HRESULT")
        return title
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/winsatcominterfacei/nf-winsatcominterfacei-iprovidewinsatassessmentinfo-get_description
     */
    get_Description() {
        description := BSTR()
        result := ComCall(9, this, "ptr", description, "HRESULT")
        return description
    }
}
