#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\Data\Xml\MsXml\IXMLDOMNodeList.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Retrieves details about all formal WinSAT assessments.
 * @see https://docs.microsoft.com/windows/win32/api//winsatcominterfacei/nn-winsatcominterfacei-iqueryallwinsatassessments
 * @namespace Windows.Win32.System.AssessmentTool
 * @version v4.0.30319
 */
class IQueryAllWinSATAssessments extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IQueryAllWinSATAssessments
     * @type {Guid}
     */
    static IID => Guid("{0b89ed1d-6398-4fea-87fc-567d8d19176f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AllXML"]

    /**
     * Retrieves data from the formal XML assessment documents using the specified XPath. The query is run against all formal assessments in the WinSAT data store.
     * @remarks
     * 
     * You can use this method to retrieve details of the assessment that are not available in the summary information provided through the API. For details about all the information available in an assessment, see the <a href="https://docs.microsoft.com/windows/desktop/WinSAT/winsat-schema">WinSAT Schema</a>.
     * 
     * The first formal assessment is run when you initially set up your computer. The initial assessment will remain in the data store for the life of the data store. The WinSAT data store can contain up to 100 formal assessments. When the store reaches capacity, WinSAT will delete the oldest assessment (but not the initial assessment) in the data store for each new formal assessment that is run.
     * 
     * The WinSAT data store contains only formal assessments. If you want to retrieve assessment data from ad hoc assessments, you must save the results to an XML file when you run the assessment (see the <b>-xml</b> command-line argument for details). You can then use the members of the <b>IXMLDOMDocument2</b> interface to query data from the ad hoc assessment.
     * 
     * The order in which the assessments are returned is arbitrary.
     * 
     * 
     * 
     * @param {BSTR} xPath 
     * @param {BSTR} namespaces 
     * @returns {IXMLDOMNodeList} 
     * @see https://docs.microsoft.com/windows/win32/api//winsatcominterfacei/nf-winsatcominterfacei-iqueryallwinsatassessments-get_allxml
     */
    get_AllXML(xPath, namespaces) {
        xPath := xPath is String ? BSTR.Alloc(xPath).Value : xPath
        namespaces := namespaces is String ? BSTR.Alloc(namespaces).Value : namespaces

        result := ComCall(7, this, "ptr", xPath, "ptr", namespaces, "ptr*", &ppDomNodeList := 0, "HRESULT")
        return IXMLDOMNodeList(ppDomNodeList)
    }
}
