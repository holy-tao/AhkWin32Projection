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
     * 
     * @param {BSTR} xPath 
     * @param {BSTR} namespaces 
     * @returns {IXMLDOMNodeList} 
     * @see https://learn.microsoft.com/windows/win32/api/winsatcominterfacei/nf-winsatcominterfacei-iqueryrecentwinsatassessment-get_xml
     */
    get_XML(xPath, namespaces) {
        xPath := xPath is String ? BSTR.Alloc(xPath).Value : xPath
        namespaces := namespaces is String ? BSTR.Alloc(namespaces).Value : namespaces

        result := ComCall(7, this, "ptr", xPath, "ptr", namespaces, "ptr*", &ppDomNodeList := 0, "HRESULT")
        return IXMLDOMNodeList(ppDomNodeList)
    }

    /**
     * 
     * @returns {IProvideWinSATResultsInfo} 
     * @see https://learn.microsoft.com/windows/win32/api/winsatcominterfacei/nf-winsatcominterfacei-iqueryrecentwinsatassessment-get_info
     */
    get_Info() {
        result := ComCall(8, this, "ptr*", &ppWinSATAssessmentInfo := 0, "HRESULT")
        return IProvideWinSATResultsInfo(ppWinSATAssessmentInfo)
    }
}
