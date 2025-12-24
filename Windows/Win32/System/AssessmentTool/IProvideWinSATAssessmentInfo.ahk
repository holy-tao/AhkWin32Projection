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
     * Retrieves the score for the subcomponent.
     * @remarks
     * 
     * The score represents the subcomponent's metrics as normalized by WinSAT.    The score is a floating point value that should be displayed with only one significant digit to the right of the decimal point.  The value is 0.0 if the assessment is unavailable or not valid. 
     * 
     * A user can use the score to determine if a subcomponent of the computer can support a specific type of application.  For example, a user that spends more time reading or writing documents may require a higher score for the disk than a user who runs scientific applications, and a user who runs scientific applications would probably want a higher CPU subcomponent score and may not be concerned with a lower disk score.
     * 
     * To get the base score for the computer, call the <a href="https://docs.microsoft.com/windows/desktop/api/winsatcominterfacei/nf-winsatcominterfacei-iprovidewinsatresultsinfo-get_systemrating">IProvideWinSATResultsInfo::get_SystemRating</a> method. 
     * 
     * 
     * 
     * @returns {Float} 
     * @see https://docs.microsoft.com/windows/win32/api//winsatcominterfacei/nf-winsatcominterfacei-iprovidewinsatassessmentinfo-get_score
     */
    get_Score() {
        result := ComCall(7, this, "float*", &score := 0, "HRESULT")
        return score
    }

    /**
     * Retrieves the title of the subcomponent.
     * @remarks
     * 
     * Note that the title includes a trailing colon character. For example, the title for the CPU subcomponent is "Processor:".
     * 
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//winsatcominterfacei/nf-winsatcominterfacei-iprovidewinsatassessmentinfo-get_title
     */
    get_Title() {
        title := BSTR()
        result := ComCall(8, this, "ptr", title, "HRESULT")
        return title
    }

    /**
     * Retrieves the description of the subcomponent.
     * @remarks
     * 
     * The description provided depends on the subcomponent. For example, the description for the CPU subcomponent identifies the processor, and the description for the memory subcomponent indicates the amount of available RAM.
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//winsatcominterfacei/nf-winsatcominterfacei-iprovidewinsatassessmentinfo-get_description
     */
    get_Description() {
        description := BSTR()
        result := ComCall(9, this, "ptr", description, "HRESULT")
        return description
    }
}
