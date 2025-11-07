#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * The IXMLGraphBuilder interface is used to persist a DirectShow filter graph using an XML file format.Note  Support for this interface was removed in Windows 7. New applications should not use this interface. .
 * @remarks
 * 
 *  To get a pointer to this interface, call <b>CoCreateInstance</b> with the class identifier CLSID_XMLGraphBuilder.
 * 
 * The recommended way to save and load a filter graph is to use the GraphEdit file format:
 * 
 * <ul>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/DirectShow/saving-a-filter-graph-to-a-graphedit-file">Saving a Filter Graph to a GraphEdit File</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/DirectShow/loading-a-graphedit-file-programmatically">Loading a GraphEdit File Programmatically</a>
 * </li>
 * </ul>
 * Generally, you should persist a filter graph only for testing purposes and not for production. There is no consistently reliable way to reload a filter graph from a file, because the user's hardware and software configurations can change between sessions. Therefore, except for testing, an application should always build a filter graph programmatically.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//amxmlgraphbuilder/nn-amxmlgraphbuilder-ixmlgraphbuilder
 * @namespace Windows.Win32.Media.DirectShow.Xml
 * @version v4.0.30319
 */
class IXMLGraphBuilder extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXMLGraphBuilder
     * @type {Guid}
     */
    static IID => Guid("{1bb05960-5fbf-11d2-a521-44df07c10000}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["BuildFromXML", "SaveToXML", "BuildFromXMLFile"]

    /**
     * 
     * @param {IGraphBuilder} pGraph 
     * @param {IXMLElement} pxml 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/amxmlgraphbuilder/nf-amxmlgraphbuilder-ixmlgraphbuilder-buildfromxml
     */
    BuildFromXML(pGraph, pxml) {
        result := ComCall(3, this, "ptr", pGraph, "ptr", pxml, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IGraphBuilder} pGraph 
     * @param {Pointer<BSTR>} pbstrxml 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/amxmlgraphbuilder/nf-amxmlgraphbuilder-ixmlgraphbuilder-savetoxml
     */
    SaveToXML(pGraph, pbstrxml) {
        result := ComCall(4, this, "ptr", pGraph, "ptr", pbstrxml, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IGraphBuilder} pGraph 
     * @param {PWSTR} wszFileName 
     * @param {PWSTR} wszBaseURL 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/amxmlgraphbuilder/nf-amxmlgraphbuilder-ixmlgraphbuilder-buildfromxmlfile
     */
    BuildFromXMLFile(pGraph, wszFileName, wszBaseURL) {
        wszFileName := wszFileName is String ? StrPtr(wszFileName) : wszFileName
        wszBaseURL := wszBaseURL is String ? StrPtr(wszBaseURL) : wszBaseURL

        result := ComCall(5, this, "ptr", pGraph, "ptr", wszFileName, "ptr", wszBaseURL, "HRESULT")
        return result
    }
}
