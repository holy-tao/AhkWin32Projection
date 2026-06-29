#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Gets summary information for a subcomponent of the assessment, for example, its score.
 * @remarks
 * To retrieve details of the subcomponent, call the <a href="https://docs.microsoft.com/windows/desktop/api/winsatcominterfacei/nf-winsatcominterfacei-iqueryrecentwinsatassessment-get_xml">IQueryRecentWinSATAssessment::get_XML</a> method.
 * @see https://learn.microsoft.com/windows/win32/api/winsatcominterfacei/nn-winsatcominterfacei-iprovidewinsatassessmentinfo
 * @namespace Windows.Win32.System.AssessmentTool
 */
export default struct IProvideWinSATAssessmentInfo extends IDispatch {
    /**
     * The interface identifier for IProvideWinSATAssessmentInfo
     * @type {Guid}
     */
    static IID := Guid("{0cd1c380-52d3-4678-ac6f-e929e480be9e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IProvideWinSATAssessmentInfo interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Score       : IntPtr
        get_Title       : IntPtr
        get_Description : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IProvideWinSATAssessmentInfo.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * The score represents the subcomponent's metrics as normalized by WinSAT.    The score is a floating point value that should be displayed with only one significant digit to the right of the decimal point.  The value is 0.0 if the assessment is unavailable or not valid. 
     * 
     * A user can use the score to determine if a subcomponent of the computer can support a specific type of application.  For example, a user that spends more time reading or writing documents may require a higher score for the disk than a user who runs scientific applications, and a user who runs scientific applications would probably want a higher CPU subcomponent score and may not be concerned with a lower disk score.
     * 
     * To get the base score for the computer, call the <a href="https://docs.microsoft.com/windows/desktop/api/winsatcominterfacei/nf-winsatcominterfacei-iprovidewinsatresultsinfo-get_systemrating">IProvideWinSATResultsInfo::get_SystemRating</a> method.
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/winsatcominterfacei/nf-winsatcominterfacei-iprovidewinsatassessmentinfo-get_score
     */
    get_Score() {
        result := ComCall(7, this, "float*", &score := 0, "HRESULT")
        return score
    }

    /**
     * Retrieves the title of the subcomponent.
     * @remarks
     * Note that the title includes a trailing colon character. For example, the title for the CPU subcomponent is "Processor:".
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/winsatcominterfacei/nf-winsatcominterfacei-iprovidewinsatassessmentinfo-get_title
     */
    get_Title() {
        title := BSTR.Owned()
        result := ComCall(8, this, BSTR.Ptr, title, "HRESULT")
        return title
    }

    /**
     * Retrieves the description of the subcomponent.
     * @remarks
     * The description provided depends on the subcomponent. For example, the description for the CPU subcomponent identifies the processor, and the description for the memory subcomponent indicates the amount of available RAM.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/winsatcominterfacei/nf-winsatcominterfacei-iprovidewinsatassessmentinfo-get_description
     */
    get_Description() {
        description := BSTR.Owned()
        result := ComCall(9, this, BSTR.Ptr, description, "HRESULT")
        return description
    }

    Query(iid) {
        if (IProvideWinSATAssessmentInfo.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Score := CallbackCreate(GetMethod(implObj, "get_Score"), flags, 2)
        this.vtbl.get_Title := CallbackCreate(GetMethod(implObj, "get_Title"), flags, 2)
        this.vtbl.get_Description := CallbackCreate(GetMethod(implObj, "get_Description"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Score)
        CallbackFree(this.vtbl.get_Title)
        CallbackFree(this.vtbl.get_Description)
    }
}
