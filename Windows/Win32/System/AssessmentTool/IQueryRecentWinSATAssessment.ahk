#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IProvideWinSATResultsInfo.ahk" { IProvideWinSATResultsInfo }
#Import "..\..\Data\Xml\MsXml\IXMLDOMNodeList.ahk" { IXMLDOMNodeList }

/**
 * Retrieves details about the results of the most recent formal WinSAT assessment.
 * @see https://learn.microsoft.com/windows/win32/api/winsatcominterfacei/nn-winsatcominterfacei-iqueryrecentwinsatassessment
 * @namespace Windows.Win32.System.AssessmentTool
 */
export default struct IQueryRecentWinSATAssessment extends IDispatch {
    /**
     * The interface identifier for IQueryRecentWinSATAssessment
     * @type {Guid}
     */
    static IID := Guid("{f8ad5d1f-3b47-4bdc-9375-7c6b1da4eca7}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IQueryRecentWinSATAssessment interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_XML  : IntPtr
        get_Info : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IQueryRecentWinSATAssessment.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {IProvideWinSATResultsInfo} 
     */
    Info {
        get => this.get_Info()
    }

    /**
     * Retrieves data from the XML assessment document by using the specified XPath. The query is run against the most recent formal assessment in the WinSAT data store.
     * @remarks
     * You can use this method to retrieve details of the assessment that are not available in the summary information provided through the API. For details about all the information available in an assessment, see the <a href="https://docs.microsoft.com/windows/desktop/WinSAT/winsat-schema">WinSAT Schema</a>.
     * 
     * The first formal assessment is run when you initially set up your computer. The initial assessment will remain in the data store for the life of the data store. The WinSAT data store can contain up to 100 formal assessments. When the store reaches capacity, WinSAT will delete the oldest assessment (but not the initial assessment) in the data store for each new formal assessment that is run.
     * 
     * The WinSAT data store contains only formal assessments. If you want to retrieve assessment data from ad hoc assessments, you must save the results to an XML file when you run the assessment (see the <b>-xml</b> command-line argument for details). You can then use the members of the <b>IXMLDOMDocument2</b> interface to query data from the ad hoc assessment.
     * 
     * To retrieve summary information about the assessment, call the <a href="https://docs.microsoft.com/windows/desktop/api/winsatcominterfacei/nf-winsatcominterfacei-iqueryrecentwinsatassessment-get_info">IQueryRecentWinSATAssessment::get_Info</a> method. To retrieve summary information for a subcomponent of the assessment, call the <a href="https://docs.microsoft.com/windows/desktop/api/winsatcominterfacei/nf-winsatcominterfacei-iprovidewinsatresultsinfo-getassessmentinfo">IProvideWinSATResultsInfo::GetAssessmentInfo</a> method.
     * @param {BSTR} xPath 
     * @param {BSTR} namespaces 
     * @returns {IXMLDOMNodeList} 
     * @see https://learn.microsoft.com/windows/win32/api/winsatcominterfacei/nf-winsatcominterfacei-iqueryrecentwinsatassessment-get_xml
     */
    get_XML(xPath, namespaces) {
        xPath := xPath is String ? BSTR.Alloc(xPath).Value : xPath
        namespaces := namespaces is String ? BSTR.Alloc(namespaces).Value : namespaces

        result := ComCall(7, this, BSTR, xPath, BSTR, namespaces, "ptr*", &ppDomNodeList := 0, "HRESULT")
        return IXMLDOMNodeList(ppDomNodeList)
    }

    /**
     * Retrieves an interface that provides information about the results of the most recent formal assessment, for example, the base score and the date that the assessment was run.
     * @remarks
     * To retrieve summary information for a subcomponent of the assessment, call the <a href="https://docs.microsoft.com/windows/desktop/api/winsatcominterfacei/nf-winsatcominterfacei-iprovidewinsatresultsinfo-getassessmentinfo">IProvideWinSATResultsInfo::GetAssessmentInfo</a> method.
     * @returns {IProvideWinSATResultsInfo} 
     * @see https://learn.microsoft.com/windows/win32/api/winsatcominterfacei/nf-winsatcominterfacei-iqueryrecentwinsatassessment-get_info
     */
    get_Info() {
        result := ComCall(8, this, "ptr*", &ppWinSATAssessmentInfo := 0, "HRESULT")
        return IProvideWinSATResultsInfo(ppWinSATAssessmentInfo)
    }

    Query(iid) {
        if (IQueryRecentWinSATAssessment.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_XML := CallbackCreate(GetMethod(implObj, "get_XML"), flags, 4)
        this.vtbl.get_Info := CallbackCreate(GetMethod(implObj, "get_Info"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_XML)
        CallbackFree(this.vtbl.get_Info)
    }
}
