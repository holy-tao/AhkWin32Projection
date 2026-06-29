#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\..\Data\Xml\MsXml\IXMLElement.ahk" { IXMLElement }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\IGraphBuilder.ahk" { IGraphBuilder }

/**
 * The IXMLGraphBuilder interface is used to persist a DirectShow filter graph using an XML file format.Note  Support for this interface was removed in Windows 7. New applications should not use this interface. .
 * @remarks
 * To get a pointer to this interface, call <b>CoCreateInstance</b> with the class identifier CLSID_XMLGraphBuilder.
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
 * @see https://learn.microsoft.com/windows/win32/api/amxmlgraphbuilder/nn-amxmlgraphbuilder-ixmlgraphbuilder
 * @namespace Windows.Win32.Media.DirectShow.Xml
 */
export default struct IXMLGraphBuilder extends IUnknown {
    /**
     * The interface identifier for IXMLGraphBuilder
     * @type {Guid}
     */
    static IID := Guid("{1bb05960-5fbf-11d2-a521-44df07c10000}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IXMLGraphBuilder interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        BuildFromXML     : IntPtr
        SaveToXML        : IntPtr
        BuildFromXMLFile : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IXMLGraphBuilder.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The BuildFromXML method loads a filter graph from an XML element.
     * @param {IGraphBuilder} pGraph Pointer to the Filter Graph Manager's <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-igraphbuilder">IGraphBuilder</a> interface. To create the <a href="https://docs.microsoft.com/windows/desktop/DirectShow/filter-graph-manager">Filter Graph Manager</a>, call <b>CoCreateInstance</b>. Do not add any filters to the graph before calling this method.
     * @param {IXMLElement} pxml Pointer to the <b>IXMLElement</b> interface of an XML element object. The XML element object must contain the string returned by the <a href="https://docs.microsoft.com/windows/desktop/api/amxmlgraphbuilder/nf-amxmlgraphbuilder-ixmlgraphbuilder-savetoxml">IXMLGraphBuilder::SaveToXML</a> method.
     * 
     * <div class="alert"><b>Note</b>  The <b>IXMLElement</b> interface is implemented in Microsoft XML Core Services (MSXML) version 1.0 but is not implemented in more recent versions of MSXML.</div>
     * <div> </div>
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://learn.microsoft.com/windows/win32/api/amxmlgraphbuilder/nf-amxmlgraphbuilder-ixmlgraphbuilder-buildfromxml
     */
    BuildFromXML(pGraph, pxml) {
        result := ComCall(3, this, "ptr", pGraph, "ptr", pxml, "HRESULT")
        return result
    }

    /**
     * The SaveToXML method saves a filter graph to an XML element.
     * @param {IGraphBuilder} pGraph Pointer to the Filter Graph Manager's <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-igraphbuilder">IGraphBuilder</a> interface.
     * @param {Pointer<BSTR>} pbstrxml Pointer to a <b>BSTR</b> that receives the XML element. The caller must release the string by calling <b>SysFreeString</b>.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://learn.microsoft.com/windows/win32/api/amxmlgraphbuilder/nf-amxmlgraphbuilder-ixmlgraphbuilder-savetoxml
     */
    SaveToXML(pGraph, pbstrxml) {
        result := ComCall(4, this, "ptr", pGraph, BSTR.Ptr, pbstrxml, "HRESULT")
        return result
    }

    /**
     * The BuildFromXMLFile method loads a filter graph from an XML file.
     * @param {IGraphBuilder} pGraph Pointer to the Filter Graph Manager's <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-igraphbuilder">IGraphBuilder</a> interface. To create the <a href="https://docs.microsoft.com/windows/desktop/DirectShow/filter-graph-manager">Filter Graph Manager</a>, call <b>CoCreateInstance</b>. Do not add any filters to the graph before calling this method.
     * @param {PWSTR} wszFileName Wide-character string that contains the full path name of an XML file. The XML file must contain the string returned by the <a href="https://docs.microsoft.com/windows/desktop/api/amxmlgraphbuilder/nf-amxmlgraphbuilder-ixmlgraphbuilder-savetoxml">IXMLGraphBuilder::SaveToXML</a> method.
     * @param {PWSTR} wszBaseURL Reserved. Set to <b>NULL</b>.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://learn.microsoft.com/windows/win32/api/amxmlgraphbuilder/nf-amxmlgraphbuilder-ixmlgraphbuilder-buildfromxmlfile
     */
    BuildFromXMLFile(pGraph, wszFileName, wszBaseURL) {
        wszFileName := wszFileName is String ? StrPtr(wszFileName) : wszFileName
        wszBaseURL := wszBaseURL is String ? StrPtr(wszBaseURL) : wszBaseURL

        result := ComCall(5, this, "ptr", pGraph, "ptr", wszFileName, "ptr", wszBaseURL, "HRESULT")
        return result
    }

    Query(iid) {
        if (IXMLGraphBuilder.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.BuildFromXML := CallbackCreate(GetMethod(implObj, "BuildFromXML"), flags, 3)
        this.vtbl.SaveToXML := CallbackCreate(GetMethod(implObj, "SaveToXML"), flags, 3)
        this.vtbl.BuildFromXMLFile := CallbackCreate(GetMethod(implObj, "BuildFromXMLFile"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.BuildFromXML)
        CallbackFree(this.vtbl.SaveToXML)
        CallbackFree(this.vtbl.BuildFromXMLFile)
    }
}
