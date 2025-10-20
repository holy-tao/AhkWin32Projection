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
     * 
     * @param {BSTR} xPath 
     * @param {BSTR} namespaces 
     * @param {Pointer<IXMLDOMNodeList>} ppDomNodeList 
     * @returns {HRESULT} 
     */
    get_AllXML(xPath, namespaces, ppDomNodeList) {
        xPath := xPath is String ? BSTR.Alloc(xPath).Value : xPath
        namespaces := namespaces is String ? BSTR.Alloc(namespaces).Value : namespaces

        result := ComCall(7, this, "ptr", xPath, "ptr", namespaces, "ptr", ppDomNodeList, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
