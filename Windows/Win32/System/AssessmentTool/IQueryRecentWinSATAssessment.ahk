#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Retrieves details about the results of the most recent formal WinSAT assessment.
 * @see https://docs.microsoft.com/windows/win32/api//winsatcominterfacei/nn-winsatcominterfacei-iqueryrecentwinsatassessment
 * @namespace Windows.Win32.System.AssessmentTool
 * @version v4.0.30319
 */
class IQueryRecentWinSATAssessment extends IDispatch{
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
     * 
     * @param {BSTR} xPath 
     * @param {BSTR} namespaces 
     * @param {Pointer<IXMLDOMNodeList>} ppDomNodeList 
     * @returns {HRESULT} 
     */
    get_XML(xPath, namespaces, ppDomNodeList) {
        xPath := xPath is String ? BSTR.Alloc(xPath).Value : xPath
        namespaces := namespaces is String ? BSTR.Alloc(namespaces).Value : namespaces

        result := ComCall(7, this, "ptr", xPath, "ptr", namespaces, "ptr", ppDomNodeList, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IProvideWinSATResultsInfo>} ppWinSATAssessmentInfo 
     * @returns {HRESULT} 
     */
    get_Info(ppWinSATAssessmentInfo) {
        result := ComCall(8, this, "ptr", ppWinSATAssessmentInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
