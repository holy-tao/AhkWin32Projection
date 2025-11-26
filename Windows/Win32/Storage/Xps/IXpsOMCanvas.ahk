#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IXpsOMVisualCollection.ahk
#Include .\IXpsOMDictionary.ahk
#Include .\IXpsOMRemoteDictionaryResource.ahk
#Include .\IXpsOMCanvas.ahk
#Include .\IXpsOMVisual.ahk

/**
 * A group of visual elements and related properties.
 * @remarks
 * 
 * The code example that follows illustrates how to create an instance of  this interface.
 * 
 * 
 * ```cpp
 * 
 * IXpsOMCanvas    *newInterface;
 * 
 * // Note the implicit requirement that CoInitializeEx 
 * //  has previously been called from this thread.
 * 
 * hr = CoCreateInstance(
 *     __uuidof(XpsOMObjectFactory),
 *     NULL,
 *     CLSCTX_INPROC_SERVER,
 *     _uuidof(IXpsOMObjectFactory),
 *     reinterpret_cast<LPVOID*>(&xpsFactory)
 *     );
 * 
 * if (SUCCEEDED(hr))
 * {
 *     hr = xpsFactory->CreateCanvas (&newInterface);
 *     if (SUCCEEDED(hr))
 *     {
 *         // use newInterface
 * 
 *         newInterface->Release();
 *     }
 *     xpsFactory->Release();
 * }
 * else
 * {
 *     // evaluate HRESULT error returned in hr
 * }
 * 
 * ```
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nn-xpsobjectmodel-ixpsomcanvas
 * @namespace Windows.Win32.Storage.Xps
 * @version v4.0.30319
 */
class IXpsOMCanvas extends IXpsOMVisual{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXpsOMCanvas
     * @type {Guid}
     */
    static IID => Guid("{221d1452-331e-47c6-87e9-6ccefb9b5ba3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 30

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetVisuals", "GetUseAliasedEdgeMode", "SetUseAliasedEdgeMode", "GetAccessibilityShortDescription", "SetAccessibilityShortDescription", "GetAccessibilityLongDescription", "SetAccessibilityLongDescription", "GetDictionary", "GetDictionaryLocal", "SetDictionaryLocal", "GetDictionaryResource", "SetDictionaryResource", "Clone"]

    /**
     * Gets a pointer to an IXpsOMVisualCollection interface that contains a collection of the visual objects in the canvas.
     * @returns {IXpsOMVisualCollection} The collection of the visual objects in the canvas. If no visual objects are attached to the canvas, an empty collection is returned.
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomcanvas-getvisuals
     */
    GetVisuals() {
        result := ComCall(30, this, "ptr*", &visuals := 0, "HRESULT")
        return IXpsOMVisualCollection(visuals)
    }

    /**
     * Gets a Boolean value that determines whether the edges of the objects in the canvas are to be rendered using the aliased edge mode.
     * @returns {BOOL} The Boolean value that determines whether the objects in the canvas are to be rendered  using the aliased edge mode.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TRUE"></a><a id="true"></a><dl>
     * <dt><b><b>TRUE</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The edges of objects in the canvas are to be rendered without anti-aliasing using the aliased edge mode. This includes any objects in the canvas that have <i>useAliasedEdgeMode</i> set to <b>FALSE</b>.
     * 
     * In the document markup, this  corresponds  to the <b>RenderOptions.EdgeMode</b> attribute  having a value of <b>Aliased</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FALSE"></a><a id="false"></a><dl>
     * <dt><b><b>FALSE</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The edges of objects in the canvas are to be rendered in the default manner.
     * 
     * In the document markup, this corresponds  to the <b>RenderOptions.EdgeMode</b> attribute being absent.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomcanvas-getusealiasededgemode
     */
    GetUseAliasedEdgeMode() {
        result := ComCall(31, this, "int*", &useAliasedEdgeMode := 0, "HRESULT")
        return useAliasedEdgeMode
    }

    /**
     * Sets the value that determines whether the edges of objects in this canvas will be rendered using the aliased edge mode.
     * @param {BOOL} useAliasedEdgeMode The Boolean value that determines whether  the edges of child objects in this canvas will be rendered using the aliased edge mode.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TRUE"></a><a id="true"></a><dl>
     * <dt><b><b>TRUE</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The edges of objects in the canvas are to be rendered without anti-aliasing using the aliased edge mode. This includes any objects that have this value set to <b>FALSE</b>.
     * 
     * In the document markup, this  corresponds  to the <b>RenderOptions.EdgeMode</b> attribute  having the value of <b>Aliased</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FALSE"></a><a id="false"></a><dl>
     * <dt><b><b>FALSE</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The edges of objects in the canvas are to be rendered in the default manner.
     * 
     * In the document markup, this corresponds  to the <b>RenderOptions.EdgeMode</b> attribute being absent.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {HRESULT} If the method succeeds, it returns S_OK; otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomcanvas-setusealiasededgemode
     */
    SetUseAliasedEdgeMode(useAliasedEdgeMode) {
        result := ComCall(32, this, "int", useAliasedEdgeMode, "HRESULT")
        return result
    }

    /**
     * Gets a short textual description of the object's contents.
     * @returns {PWSTR} The short textual description of the object's contents. If this description is not set, a <b>NULL</b> pointer is returned.
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomcanvas-getaccessibilityshortdescription
     */
    GetAccessibilityShortDescription() {
        result := ComCall(33, this, "ptr*", &shortDescription := 0, "HRESULT")
        return shortDescription
    }

    /**
     * Sets the short textual description of the object's contents.
     * @param {PWSTR} shortDescription The short textual description of the object's contents. A <b>NULL</b> pointer clears the previously assigned text.
     * @returns {HRESULT} If the method succeeds, it returns S_OK; otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomcanvas-setaccessibilityshortdescription
     */
    SetAccessibilityShortDescription(shortDescription) {
        shortDescription := shortDescription is String ? StrPtr(shortDescription) : shortDescription

        result := ComCall(34, this, "ptr", shortDescription, "HRESULT")
        return result
    }

    /**
     * Gets the long (detailed) textual description of the object's contents.
     * @returns {PWSTR} The long (detailed) textual description of the object's contents. A <b>NULL</b> pointer is returned if this text has not been set.
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomcanvas-getaccessibilitylongdescription
     */
    GetAccessibilityLongDescription() {
        result := ComCall(35, this, "ptr*", &longDescription := 0, "HRESULT")
        return longDescription
    }

    /**
     * Sets the long (detailed) textual description of the object's contents.
     * @param {PWSTR} longDescription The long (detailed) textual description of the object's contents. A <b>NULL</b> pointer clears the previously assigned value.
     * @returns {HRESULT} If the method succeeds, it returns S_OK; otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomcanvas-setaccessibilitylongdescription
     */
    SetAccessibilityLongDescription(longDescription) {
        longDescription := longDescription is String ? StrPtr(longDescription) : longDescription

        result := ComCall(36, this, "ptr", longDescription, "HRESULT")
        return result
    }

    /**
     * Gets a pointer to the resolved IXpsOMDictionary interface of the dictionary associated with the canvas.
     * @returns {IXpsOMDictionary} A pointer to the resolved <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomdictionary">IXpsOMDictionary</a> interface of the dictionary.
     * 
     * The value that is returned in this parameter depends on which method has been most recently called to set the dictionary.
     * 
     * <table>
     * <tr>
     * <th>Most recent method called</th>
     * <th>Object returned in <i>resourceDictionary</i></th>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomcanvas-setdictionarylocal">SetDictionaryLocal</a>
     * 
     * 
     * </td>
     * <td>
     * The local dictionary  that is set by <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomcanvas-setdictionarylocal">SetDictionaryLocal</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomcanvas-setdictionaryresource">SetDictionaryResource</a>
     * 
     * 
     * </td>
     * <td>
     * The shared dictionary in the dictionary resource that is set by <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomcanvas-setdictionaryresource">SetDictionaryResource</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * Neither <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomcanvas-setdictionarylocal">SetDictionaryLocal</a> nor <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomcanvas-setdictionaryresource">SetDictionaryResource</a> has been called yet.
     * 
     * </td>
     * <td>
     * <b>NULL</b> pointer.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomcanvas-getdictionary
     */
    GetDictionary() {
        result := ComCall(37, this, "ptr*", &resourceDictionary := 0, "HRESULT")
        return IXpsOMDictionary(resourceDictionary)
    }

    /**
     * Gets a pointer to the IXpsOMDictionary interface of the local, unshared dictionary.
     * @returns {IXpsOMDictionary} The <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomdictionary">IXpsOMDictionary</a> interface pointer to the local, unshared dictionary, if one has been set. If a local dictionary has not been set or if a remote dictionary resource has been set, a <b>NULL</b> pointer is returned.
     * 
     * <table>
     * <tr>
     * <th>Most recent method called</th>
     * <th>Object returned in <i>resourceDictionary</i></th>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomcanvas-setdictionarylocal">SetDictionaryLocal</a>
     * 
     * 
     * </td>
     * <td>
     * The local dictionary that is set by <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomcanvas-setdictionarylocal">SetDictionaryLocal</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomcanvas-setdictionaryresource">SetDictionaryResource</a>
     * 
     * 
     * </td>
     * <td>
     * <b>NULL</b> pointer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * Neither <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomcanvas-setdictionarylocal">SetDictionaryLocal</a> nor <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomcanvas-setdictionaryresource">SetDictionaryResource</a> has been called yet.
     * 
     * </td>
     * <td>
     * <b>NULL</b> pointer.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomcanvas-getdictionarylocal
     */
    GetDictionaryLocal() {
        result := ComCall(38, this, "ptr*", &resourceDictionary := 0, "HRESULT")
        return IXpsOMDictionary(resourceDictionary)
    }

    /**
     * Sets the IXpsOMDictionary interface pointer of the local, unshared dictionary.
     * @param {IXpsOMDictionary} resourceDictionary The <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomdictionary">IXpsOMDictionary</a> interface of the local, unshared dictionary. A <b>NULL</b> pointer releases  any previously assigned local dictionary.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the table that follows. For information about  XPS document API return values that are not listed in this table, see <a href="/previous-versions/windows/desktop/dd372955(v=vs.85)">XPS Document Errors</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>XPS_E_NO_CUSTOM_OBJECTS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>resourceDictionary</i> does not point to a recognized interface implementation. Custom implementation of XPS Document API interfaces is not supported.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomcanvas-setdictionarylocal
     */
    SetDictionaryLocal(resourceDictionary) {
        result := ComCall(39, this, "ptr", resourceDictionary, "HRESULT")
        return result
    }

    /**
     * Gets a pointer to the IXpsOMRemoteDictionaryResource interface of the remote dictionary resource.
     * @returns {IXpsOMRemoteDictionaryResource} The <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomremotedictionaryresource">IXpsOMRemoteDictionaryResource</a> interface pointer to the remote dictionary resource, if one has been set. If a remote dictionary resource has not been set or if a local dictionary resource has been set, a <b>NULL</b> pointer is returned.
     * 
     * <table>
     * <tr>
     * <th>Most recent method called</th>
     * <th>Object returned in <i>remoteDictionaryResource</i></th>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomcanvas-setdictionarylocal">SetDictionaryLocal</a>
     * 
     * 
     * </td>
     * <td>
     * <b>NULL</b> pointer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomcanvas-setdictionaryresource">SetDictionaryResource</a>
     * 
     * 
     * </td>
     * <td>
     * The remote dictionary resource that is set by <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomcanvas-setdictionaryresource">SetDictionaryResource</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * Neither <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomcanvas-setdictionarylocal">SetDictionaryLocal</a> nor <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomcanvas-setdictionaryresource">SetDictionaryResource</a> has been called yet.
     * 
     * </td>
     * <td>
     * <b>NULL</b> pointer.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomcanvas-getdictionaryresource
     */
    GetDictionaryResource() {
        result := ComCall(40, this, "ptr*", &remoteDictionaryResource := 0, "HRESULT")
        return IXpsOMRemoteDictionaryResource(remoteDictionaryResource)
    }

    /**
     * Sets the IXpsOMRemoteDictionaryResource interface pointer of the remote dictionary resource.
     * @param {IXpsOMRemoteDictionaryResource} remoteDictionaryResource The <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomremotedictionaryresource">IXpsOMRemoteDictionaryResource</a> interface of the remote dictionary resource. A <b>NULL</b> pointer releases any previously assigned dictionary resource.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the table that follows. For information about  XPS document API return values that are not listed in this table, see <a href="/previous-versions/windows/desktop/dd372955(v=vs.85)">XPS Document Errors</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>XPS_E_NO_CUSTOM_OBJECTS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>remoteDictionaryResource</i> does not point to a recognized interface implementation. Custom implementation of XPS Document API interfaces is not supported.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomcanvas-setdictionaryresource
     */
    SetDictionaryResource(remoteDictionaryResource) {
        result := ComCall(41, this, "ptr", remoteDictionaryResource, "HRESULT")
        return result
    }

    /**
     * Makes a deep copy of the interface.
     * @returns {IXpsOMCanvas} A pointer to the copy of the interface.
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomcanvas-clone
     */
    Clone() {
        result := ComCall(42, this, "ptr*", &canvas := 0, "HRESULT")
        return IXpsOMCanvas(canvas)
    }
}
