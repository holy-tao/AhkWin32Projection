#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
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
     * 
     * @param {BSTR} xPath 
     * @param {BSTR} namespaces 
     * @param {Pointer<IXMLDOMNodeList>} ppDomNodeList 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsatcominterfacei/nf-winsatcominterfacei-iqueryallwinsatassessments-get_allxml
     */
    get_AllXML(xPath, namespaces, ppDomNodeList) {
        xPath := xPath is String ? BSTR.Alloc(xPath).Value : xPath
        namespaces := namespaces is String ? BSTR.Alloc(namespaces).Value : namespaces

        result := ComCall(7, this, "ptr", xPath, "ptr", namespaces, "ptr*", ppDomNodeList, "HRESULT")
        return result
    }
}
