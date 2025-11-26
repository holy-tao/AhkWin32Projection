#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\Data\Xml\MsXml\IXMLDOMNodeList.ahk
#Include .\IProvideWinSATResultsInfo.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Retrieves details about the results of the most recent formal WinSAT assessment.
 * @see https://docs.microsoft.com/windows/win32/api//winsatcominterfacei/nn-winsatcominterfacei-iqueryrecentwinsatassessment
 * @namespace Windows.Win32.System.AssessmentTool
 * @version v4.0.30319
 */
class IQueryRecentWinSATAssessment extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IQueryRecentWinSATAssessment
     * @type {Guid}
     */
    static IID => Guid("{f8ad5d1f-3b47-4bdc-9375-7c6b1da4eca7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_XML", "get_Info"]

    /**
     * @type {IProvideWinSATResultsInfo} 
     */
    Info {
        get => this.get_Info()
    }

    /**
     * Retrieves data from the XML assessment document by using the specified XPath. The query is run against the most recent formal assessment in the WinSAT data store.
     * @remarks
     * 
     * You can use this method to retrieve details of the assessment that are not available in the summary information provided through the API. For details about all the information available in an assessment, see the <a href="https://docs.microsoft.com/windows/desktop/WinSAT/winsat-schema">WinSAT Schema</a>.
     * 
     * The first formal assessment is run when you initially set up your computer. The initial assessment will remain in the data store for the life of the data store. The WinSAT data store can contain up to 100 formal assessments. When the store reaches capacity, WinSAT will delete the oldest assessment (but not the initial assessment) in the data store for each new formal assessment that is run.
     * 
     * The WinSAT data store contains only formal assessments. If you want to retrieve assessment data from ad hoc assessments, you must save the results to an XML file when you run the assessment (see the <b>-xml</b> command-line argument for details). You can then use the members of the <b>IXMLDOMDocument2</b> interface to query data from the ad hoc assessment.
     * 
     * To retrieve summary information about the assessment, call the <a href="https://docs.microsoft.com/windows/desktop/api/winsatcominterfacei/nf-winsatcominterfacei-iqueryrecentwinsatassessment-get_info">IQueryRecentWinSATAssessment::get_Info</a> method. To retrieve summary information for a subcomponent of the assessment, call the <a href="https://docs.microsoft.com/windows/desktop/api/winsatcominterfacei/nf-winsatcominterfacei-iprovidewinsatresultsinfo-getassessmentinfo">IProvideWinSATResultsInfo::GetAssessmentInfo</a> method.
     * 
     * 
     * 
     * @param {BSTR} xPath 
     * @param {BSTR} namespaces 
     * @returns {IXMLDOMNodeList} 
     * @see https://docs.microsoft.com/windows/win32/api//winsatcominterfacei/nf-winsatcominterfacei-iqueryrecentwinsatassessment-get_xml
     */
    get_XML(xPath, namespaces) {
        xPath := xPath is String ? BSTR.Alloc(xPath).Value : xPath
        namespaces := namespaces is String ? BSTR.Alloc(namespaces).Value : namespaces

        result := ComCall(7, this, "ptr", xPath, "ptr", namespaces, "ptr*", &ppDomNodeList := 0, "HRESULT")
        return IXMLDOMNodeList(ppDomNodeList)
    }

    /**
     * Retrieves an interface that provides information about the results of the most recent formal assessment, for example, the base score and the date that the assessment was run.
     * @remarks
     * 
     * To retrieve summary information for a subcomponent of the assessment, call the <a href="https://docs.microsoft.com/windows/desktop/api/winsatcominterfacei/nf-winsatcominterfacei-iprovidewinsatresultsinfo-getassessmentinfo">IProvideWinSATResultsInfo::GetAssessmentInfo</a> method.
     * 
     * 
     * 
     * @returns {IProvideWinSATResultsInfo} 
     * @see https://docs.microsoft.com/windows/win32/api//winsatcominterfacei/nf-winsatcominterfacei-iqueryrecentwinsatassessment-get_info
     */
    get_Info() {
        result := ComCall(8, this, "ptr*", &ppWinSATAssessmentInfo := 0, "HRESULT")
        return IProvideWinSATResultsInfo(ppWinSATAssessmentInfo)
    }
}
