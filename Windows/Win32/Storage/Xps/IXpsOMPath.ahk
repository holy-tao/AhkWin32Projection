#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IXpsOMGeometry.ahk
#Include .\IXpsOMBrush.ahk
#Include .\IXpsOMDashCollection.ahk
#Include .\IXpsOMPath.ahk
#Include .\IXpsOMVisual.ahk

/**
 * Describes a non-text visual item.
 * @remarks
 * 
 * The code example that follows illustrates how to create an instance of  this interface.
 * 
 * 
 * ```cpp
 * 
 * IXpsOMPath    *newInterface;
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
 *     hr = xpsFactory->CreatePath (&newInterface);
 * 
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
 * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nn-xpsobjectmodel-ixpsompath
 * @namespace Windows.Win32.Storage.Xps
 * @version v4.0.30319
 */
class IXpsOMPath extends IXpsOMVisual{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXpsOMPath
     * @type {Guid}
     */
    static IID => Guid("{37d38bb6-3ee9-4110-9312-14b194163337}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 30

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetGeometry", "GetGeometryLocal", "SetGeometryLocal", "GetGeometryLookup", "SetGeometryLookup", "GetAccessibilityShortDescription", "SetAccessibilityShortDescription", "GetAccessibilityLongDescription", "SetAccessibilityLongDescription", "GetSnapsToPixels", "SetSnapsToPixels", "GetStrokeBrush", "GetStrokeBrushLocal", "SetStrokeBrushLocal", "GetStrokeBrushLookup", "SetStrokeBrushLookup", "GetStrokeDashes", "GetStrokeDashCap", "SetStrokeDashCap", "GetStrokeDashOffset", "SetStrokeDashOffset", "GetStrokeStartLineCap", "SetStrokeStartLineCap", "GetStrokeEndLineCap", "SetStrokeEndLineCap", "GetStrokeLineJoin", "SetStrokeLineJoin", "GetStrokeMiterLimit", "SetStrokeMiterLimit", "GetStrokeThickness", "SetStrokeThickness", "GetFillBrush", "GetFillBrushLocal", "SetFillBrushLocal", "GetFillBrushLookup", "SetFillBrushLookup", "Clone"]

    /**
     * Gets a pointer to the path's IXpsOMGeometry interface, which describes the resolved fill area for this path.
     * @returns {IXpsOMGeometry} A pointer to the path's <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomgeometry">IXpsOMGeometry</a> interface, which describes the  resolved fill area for this path. If a geometry has not been set, a <b>NULL</b> pointer is returned.
     * 
     * The value that is returned in this parameter depends on which method has most recently been called to set the geometry.
     * 
     * <table>
     * <tr>
     * <th>Most recent method called</th>
     * <th>Object that is returned in <i>geometry</i></th>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompath-setgeometrylocal">SetGeometryLocal</a>
     * 
     * 
     * </td>
     * <td>
     * The local geometry that is set by <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompath-setgeometrylocal">SetGeometryLocal</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompath-setgeometrylookup">SetGeometryLookup</a>
     * 
     * 
     * </td>
     * <td>
     * The shared geometry retrieved, with a lookup key that matches the key that is set by <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompath-setgeometrylookup">SetGeometryLookup</a>, from the resource directory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * Neither <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompath-setgeometrylocal">SetGeometryLocal</a> nor <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompath-setgeometrylookup">SetGeometryLookup</a> has been called yet.
     * 
     * </td>
     * <td>
     * <b>NULL</b> pointer.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsompath-getgeometry
     */
    GetGeometry() {
        result := ComCall(30, this, "ptr*", &geometry := 0, "HRESULT")
        return IXpsOMGeometry(geometry)
    }

    /**
     * Gets the local, unshared geometry of the resolved fill area for this path.
     * @returns {IXpsOMGeometry} The local, unshared geometry of the  resolved fill area for this path. If a geometry lookup key has been set or if a local geometry has not been set, a <b>NULL</b> pointer is returned.
     * 
     * <table>
     * <tr>
     * <th>Most recent method called</th>
     * <th>Object that is returned in <i>geometry</i></th>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompath-setgeometrylocal">SetGeometryLocal</a>
     * 
     * 
     * </td>
     * <td>
     * The local geometry that is set by <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompath-setgeometrylocal">SetGeometryLocal</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompath-setgeometrylookup">SetGeometryLookup</a>
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
     * Neither <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompath-setgeometrylocal">SetGeometryLocal</a> nor <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompath-setgeometrylookup">SetGeometryLookup</a> has been called yet.
     * 
     * </td>
     * <td>
     * <b>NULL</b> pointer.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsompath-getgeometrylocal
     */
    GetGeometryLocal() {
        result := ComCall(31, this, "ptr*", &geometry := 0, "HRESULT")
        return IXpsOMGeometry(geometry)
    }

    /**
     * Sets the pointer to the local, unshared IXpsOMGeometry interface that contains the geometry of the resolved fill area to be set for this path.
     * @param {IXpsOMGeometry} geometry The pointer to the local, unshared <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomgeometry">IXpsOMGeometry</a> interface that contains the  geometry of the resolved fill area to be set for this path.
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
     * <i>geometry</i> does not point to a recognized interface implementation. Custom implementation of XPS Document API interfaces is not supported.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsompath-setgeometrylocal
     */
    SetGeometryLocal(geometry) {
        result := ComCall(32, this, "ptr", geometry, "HRESULT")
        return result
    }

    /**
     * Gets the lookup key of a shared geometry object that is stored in a resource dictionary and that describes the resolved fill area for this path.
     * @returns {PWSTR} The lookup key of the geometry object that describes the  resolved fill area for this path. If a geometry lookup key has not been set or if a local geometry has been set, a <b>NULL</b> pointer is returned.
     * 
     * <table>
     * <tr>
     * <th>Most recent method called</th>
     * <th>String that is returned in <i>lookup</i></th>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompath-setgeometrylocal">SetGeometryLocal</a>
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
     * <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompath-setgeometrylookup">SetGeometryLookup</a>
     * 
     * 
     * </td>
     * <td>
     * The lookup key that is set by <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompath-setgeometrylookup">SetGeometryLookup</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * Neither <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompath-setgeometrylocal">SetGeometryLocal</a> nor <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompath-setgeometrylookup">SetGeometryLookup</a> has been called yet.
     * 
     * </td>
     * <td>
     * <b>NULL</b> pointer.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsompath-getgeometrylookup
     */
    GetGeometryLookup() {
        result := ComCall(33, this, "ptr*", &lookup := 0, "HRESULT")
        return lookup
    }

    /**
     * Sets the lookup key name of a shared geometry in a resource dictionary.
     * @param {PWSTR} lookup The lookup key name of a shared geometry in a resource dictionary.
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
     * <dt><b>XPS_E_INVALID_RESOURCE_KEY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * According to the <a href="https://www.ecma-international.org/activities/XML%20Paper%20Specification/XPS%20Standard%20WD%201.6.pdf">XML Paper Specification</a>, the value of <i>lookup</i> is not a valid lookup key string.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>XPS_E_INVALID_LOOKUP_TYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The lookup key name in <i>lookup</i> references an object that is not a geometry.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>XPS_E_LOOKUP_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No object could be found with a key name that matched the value passed in <i>lookup</i>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsompath-setgeometrylookup
     */
    SetGeometryLookup(lookup) {
        lookup := lookup is String ? StrPtr(lookup) : lookup

        result := ComCall(34, this, "ptr", lookup, "HRESULT")
        return result
    }

    /**
     * Gets the short textual description of the object's contents.
     * @returns {PWSTR} The short textual description of the object's contents. If this text has not been set, a <b>NULL</b> pointer will be returned.
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsompath-getaccessibilityshortdescription
     */
    GetAccessibilityShortDescription() {
        result := ComCall(35, this, "ptr*", &shortDescription := 0, "HRESULT")
        return shortDescription
    }

    /**
     * Sets the short textual description of the object's contents.
     * @param {PWSTR} shortDescription The  short textual description of the object's contents.
     * @returns {HRESULT} If the method succeeds, it returns S_OK; otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsompath-setaccessibilityshortdescription
     */
    SetAccessibilityShortDescription(shortDescription) {
        shortDescription := shortDescription is String ? StrPtr(shortDescription) : shortDescription

        result := ComCall(36, this, "ptr", shortDescription, "HRESULT")
        return result
    }

    /**
     * Gets the long (detailed) textual description of the object's contents.
     * @returns {PWSTR} The detailed textual description of the object's contents. If this text has not been set, a <b>NULL</b> pointer will be returned.
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsompath-getaccessibilitylongdescription
     */
    GetAccessibilityLongDescription() {
        result := ComCall(37, this, "ptr*", &longDescription := 0, "HRESULT")
        return longDescription
    }

    /**
     * Sets the long (detailed) textual description of the object's contents.
     * @param {PWSTR} longDescription The detailed textual description of the object's contents.
     * @returns {HRESULT} If the method succeeds, it returns S_OK; otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsompath-setaccessibilitylongdescription
     */
    SetAccessibilityLongDescription(longDescription) {
        longDescription := longDescription is String ? StrPtr(longDescription) : longDescription

        result := ComCall(38, this, "ptr", longDescription, "HRESULT")
        return result
    }

    /**
     * Gets a Boolean value that indicates whether the path is to be snapped to device pixels when the path is rendered.
     * @returns {BOOL} A Boolean value that indicates whether the path is to be snapped to device pixels when the path is rendered. The following table describes the values possible  for this parameter.
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
     * The path is to be snapped to device pixels.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FALSE"></a><a id="false"></a><dl>
     * <dt><b><b>FALSE</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The path is not to be snapped to device pixels.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsompath-getsnapstopixels
     */
    GetSnapsToPixels() {
        result := ComCall(39, this, "int*", &snapsToPixels := 0, "HRESULT")
        return snapsToPixels
    }

    /**
     * Sets a Boolean value that indicates whether the path will be snapped to device pixels when that path is being rendered.
     * @param {BOOL} snapsToPixels A Boolean value that indicates whether to snap the path to the device pixels when that path is being rendered. The following table describes the values possible for this parameter.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TRUE"></a><a id="true"></a><dl>
     * <dt><b>TRUE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Snap the path to the device pixels.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FALSE"></a><a id="false"></a><dl>
     * <dt><b>FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Do not snap the path to the device pixels.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {HRESULT} If the method succeeds, it returns S_OK; otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsompath-setsnapstopixels
     */
    SetSnapsToPixels(snapsToPixels) {
        result := ComCall(40, this, "int", snapsToPixels, "HRESULT")
        return result
    }

    /**
     * Gets a pointer to the resolved IXpsOMBrush interface that contains the stroke brush that has been set for the path.
     * @returns {IXpsOMBrush} The stroke brush that has been set for the path. If a stroke brush has not been set, a <b>NULL</b> pointer is returned.
     * 
     * The value that is returned in this parameter depends on which method has most recently been called to set the brush.
     * 
     * <table>
     * <tr>
     * <th>Most recent method called</th>
     * <th>Object that is returned in <i>brush</i></th>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompath-setstrokebrushlocal">SetStrokeBrushLocal</a>
     * 
     * 
     * </td>
     * <td>
     * The local brush that is set by <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompath-setstrokebrushlocal">SetStrokeBrushLocal</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompath-setstrokebrushlookup">SetStrokeBrushLookup</a>
     * 
     * 
     * </td>
     * <td>
     * The shared brush retrieved, with a lookup key that matches the key that is set by <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompath-setstrokebrushlookup">SetStrokeBrushLookup</a>, from the resource directory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * Neither <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompath-setstrokebrushlocal">SetStrokeBrushLocal</a> nor <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompath-setstrokebrushlookup">SetStrokeBrushLookup</a> has been called yet.
     * 
     * </td>
     * <td>
     * <b>NULL</b> pointer.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsompath-getstrokebrush
     */
    GetStrokeBrush() {
        result := ComCall(41, this, "ptr*", &brush := 0, "HRESULT")
        return IXpsOMBrush(brush)
    }

    /**
     * Gets a pointer to the local, unshared IXpsOMBrush interface that contains the stroke brush for the path.
     * @returns {IXpsOMBrush} The local, unshared <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsombrush">IXpsOMBrush</a> interface that contains the stroke brush for the path. If a stroke brush lookup key has been set or if a local stroke brush has not been set, a <b>NULL</b> pointer is returned.
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Most recent method called</th>
     * <th>Object that is returned in <i>brush</i></th>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompath-setstrokebrushlocal">SetStrokeBrushLocal</a>
     * 
     * 
     * </td>
     * <td>
     * The local brush that is set by <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompath-setstrokebrushlocal">SetStrokeBrushLocal</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompath-setstrokebrushlookup">SetStrokeBrushLookup</a>
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
     * Neither <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompath-setstrokebrushlocal">SetStrokeBrushLocal</a> nor <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompath-setstrokebrushlookup">SetStrokeBrushLookup</a> has been called yet.
     * 
     * </td>
     * <td>
     * <b>NULL</b> pointer.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsompath-getstrokebrushlocal
     */
    GetStrokeBrushLocal() {
        result := ComCall(42, this, "ptr*", &brush := 0, "HRESULT")
        return IXpsOMBrush(brush)
    }

    /**
     * Sets a pointer to a local, unshared IXpsOMBrush interface to be used as a stroke brush.
     * @param {IXpsOMBrush} brush A pointer to a local, unshared <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsombrush">IXpsOMBrush</a> interface to be used as a stroke brush.
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
     * <i>brush</i> does not point to a recognized interface implementation. Custom implementation of XPS Document API interfaces is not supported.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsompath-setstrokebrushlocal
     */
    SetStrokeBrushLocal(brush) {
        result := ComCall(43, this, "ptr", brush, "HRESULT")
        return result
    }

    /**
     * Gets the lookup key of the brush that is stored in a resource dictionary and is to be used as the stroke brush for the path.
     * @returns {PWSTR} The lookup key of a brush that is stored in a resource dictionary. If a stroke brush lookup key has not been set or if a local stroke brush has been set, a <b>NULL</b> pointer is returned.
     * 
     * <table>
     * <tr>
     * <th>Most recent method called</th>
     * <th>String that is returned in <i>lookup</i></th>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompath-setstrokebrushlocal">SetStrokeBrushLocal</a>
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
     * <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompath-setstrokebrushlookup">SetStrokeBrushLookup</a>
     * 
     * 
     * </td>
     * <td>
     * The lookup key that is set by <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompath-setstrokebrushlookup">SetStrokeBrushLookup</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * Neither <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompath-setstrokebrushlocal">SetStrokeBrushLocal</a> nor <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompath-setstrokebrushlookup">SetStrokeBrushLookup</a> has been called yet.
     * 
     * </td>
     * <td>
     * <b>NULL</b> pointer.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsompath-getstrokebrushlookup
     */
    GetStrokeBrushLookup() {
        result := ComCall(44, this, "ptr*", &lookup := 0, "HRESULT")
        return lookup
    }

    /**
     * Sets the lookup key name of a shared brush to be used as the stroke brush.
     * @param {PWSTR} lookup The lookup key name of a shared brush to be used as the  stroke brush for the path.
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
     * <dt><b>XPS_E_INVALID_RESOURCE_KEY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * According to the <a href="https://www.ecma-international.org/activities/XML%20Paper%20Specification/XPS%20Standard%20WD%201.6.pdf">XML Paper Specification</a>, the value of <i>lookup</i> is not a valid lookup key string.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>XPS_E_INVALID_LOOKUP_TYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The lookup key name in <i>lookup</i> references an object that is not a brush.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>XPS_E_LOOKUP_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No object could be found with a key name that matched the value passed in <i>lookup</i>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsompath-setstrokebrushlookup
     */
    SetStrokeBrushLookup(lookup) {
        lookup := lookup is String ? StrPtr(lookup) : lookup

        result := ComCall(45, this, "ptr", lookup, "HRESULT")
        return result
    }

    /**
     * Gets a pointer to the IXpsOMDashCollection interface that contains the XPS_DASH structures that define the dash pattern of the stroke.
     * @returns {IXpsOMDashCollection} A pointer to the <a href="https://docs.microsoft.com/windows/win32/api/xpsobjectmodel/ns-xpsobjectmodel-xps_dash">IXpsOMDashCollection</a> interface that contains the <a href="https://docs.microsoft.com/windows/win32/api/xpsobjectmodel/ns-xpsobjectmodel-xps_dash">XPS_DASH</a> structures that  define the dash pattern of the stroke.
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsompath-getstrokedashes
     */
    GetStrokeDashes() {
        result := ComCall(46, this, "ptr*", &strokeDashes := 0, "HRESULT")
        return IXpsOMDashCollection(strokeDashes)
    }

    /**
     * Gets the style of the end cap to be used on the stroke dash.
     * @returns {Integer} The <a href="https://docs.microsoft.com/windows/win32/api/xpsobjectmodel/ne-xpsobjectmodel-xps_dash_cap">XPS_DASH_CAP</a> value that describes the  style of the end cap to be used on the stroke dash.
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsompath-getstrokedashcap
     */
    GetStrokeDashCap() {
        result := ComCall(47, this, "int*", &strokeDashCap := 0, "HRESULT")
        return strokeDashCap
    }

    /**
     * Sets the style of the stroke's dash cap.
     * @param {Integer} strokeDashCap The <a href="https://docs.microsoft.com/windows/win32/api/xpsobjectmodel/ne-xpsobjectmodel-xps_dash_cap">XPS_DASH_CAP</a> value to be set.
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
     * <dt><b>E_INVALIDARG </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>strokeDashCap</i> was not a valid <a href="/windows/win32/api/xpsobjectmodel/ne-xpsobjectmodel-xps_dash_cap">XPS_DASH_CAP</a> value.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsompath-setstrokedashcap
     */
    SetStrokeDashCap(strokeDashCap) {
        result := ComCall(48, this, "int", strokeDashCap, "HRESULT")
        return result
    }

    /**
     * Gets the offset from the origin of the stroke to the starting point of the dash array pattern.
     * @returns {Float} The offset value; specified in multiples of the stroke thickness.
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsompath-getstrokedashoffset
     */
    GetStrokeDashOffset() {
        result := ComCall(49, this, "float*", &strokeDashOffset := 0, "HRESULT")
        return strokeDashOffset
    }

    /**
     * Sets the offset from the origin of the stroke to the starting point of the dash array pattern.
     * @param {Float} strokeDashOffset The offset value to be set.
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
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>strokeDashOffset</i> is not a valid offset value.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsompath-setstrokedashoffset
     */
    SetStrokeDashOffset(strokeDashOffset) {
        result := ComCall(50, this, "float", strokeDashOffset, "HRESULT")
        return result
    }

    /**
     * Gets the style of the line cap at the start of the stroke line.
     * @returns {Integer} The <a href="https://docs.microsoft.com/windows/win32/api/xpsobjectmodel/ne-xpsobjectmodel-xps_line_cap">XPS_LINE_CAP</a> value that indicates the style of the  line cap at the start of the stroke line.
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsompath-getstrokestartlinecap
     */
    GetStrokeStartLineCap() {
        result := ComCall(51, this, "int*", &strokeStartLineCap := 0, "HRESULT")
        return strokeStartLineCap
    }

    /**
     * Sets the style of the stroke's line cap at the start of the stroke line.
     * @param {Integer} strokeStartLineCap The <a href="https://docs.microsoft.com/windows/win32/api/xpsobjectmodel/ne-xpsobjectmodel-xps_line_cap">XPS_LINE_CAP</a> value to be set.
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
     * <dt><b>E_INVALIDARG </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>strokeStartLineCap</i> is not a valid <a href="/windows/win32/api/xpsobjectmodel/ne-xpsobjectmodel-xps_line_cap">XPS_LINE_CAP</a> value.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsompath-setstrokestartlinecap
     */
    SetStrokeStartLineCap(strokeStartLineCap) {
        result := ComCall(52, this, "int", strokeStartLineCap, "HRESULT")
        return result
    }

    /**
     * Gets the style of the stroke line's end cap.
     * @returns {Integer} The <a href="https://docs.microsoft.com/windows/win32/api/xpsobjectmodel/ne-xpsobjectmodel-xps_line_cap">XPS_LINE_CAP</a> value that specifies the style of the stroke line's end cap.
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsompath-getstrokeendlinecap
     */
    GetStrokeEndLineCap() {
        result := ComCall(53, this, "int*", &strokeEndLineCap := 0, "HRESULT")
        return strokeEndLineCap
    }

    /**
     * Sets the style of the stroke line's end cap.
     * @param {Integer} strokeEndLineCap The <a href="https://docs.microsoft.com/windows/win32/api/xpsobjectmodel/ne-xpsobjectmodel-xps_line_cap">XPS_LINE_CAP</a> value to be  set.
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
     * <dt><b>E_INVALIDARG </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>strokeEndLineCap</i> is not a valid <a href="/windows/win32/api/xpsobjectmodel/ne-xpsobjectmodel-xps_line_cap">XPS_LINE_CAP</a> value.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsompath-setstrokeendlinecap
     */
    SetStrokeEndLineCap(strokeEndLineCap) {
        result := ComCall(54, this, "int", strokeEndLineCap, "HRESULT")
        return result
    }

    /**
     * Gets the style for joining stroke lines.
     * @returns {Integer} The <a href="https://docs.microsoft.com/windows/win32/api/xpsobjectmodel/ne-xpsobjectmodel-xps_line_join">XPS_LINE_JOIN</a> value of the line join style of the stroke.
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsompath-getstrokelinejoin
     */
    GetStrokeLineJoin() {
        result := ComCall(55, this, "int*", &strokeLineJoin := 0, "HRESULT")
        return strokeLineJoin
    }

    /**
     * Sets the style for joining stroke lines.
     * @param {Integer} strokeLineJoin The <a href="https://docs.microsoft.com/windows/win32/api/xpsobjectmodel/ne-xpsobjectmodel-xps_line_join">XPS_LINE_JOIN</a> value to be set.
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
     * <dt><b>E_INVALIDARG </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>strokeLineJoin</i> is not a valid <a href="/windows/win32/api/xpsobjectmodel/ne-xpsobjectmodel-xps_line_join">XPS_LINE_JOIN</a> value.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsompath-setstrokelinejoin
     */
    SetStrokeLineJoin(strokeLineJoin) {
        result := ComCall(56, this, "int", strokeLineJoin, "HRESULT")
        return result
    }

    /**
     * Gets the miter limit value that is set for the stroke.
     * @returns {Float} The miter limit value that is set for the stroke.
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsompath-getstrokemiterlimit
     */
    GetStrokeMiterLimit() {
        result := ComCall(57, this, "float*", &strokeMiterLimit := 0, "HRESULT")
        return strokeMiterLimit
    }

    /**
     * Sets the miter limit of the path.
     * @param {Float} strokeMiterLimit The miter limit value to be set. The value must be 1.0 or greater.
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
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A value that was passed in <i>strokeMiterLimit</i> was not valid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsompath-setstrokemiterlimit
     */
    SetStrokeMiterLimit(strokeMiterLimit) {
        result := ComCall(58, this, "float", strokeMiterLimit, "HRESULT")
        return result
    }

    /**
     * Gets the stroke thickness.
     * @returns {Float} The stroke thickness value.
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsompath-getstrokethickness
     */
    GetStrokeThickness() {
        result := ComCall(59, this, "float*", &strokeThickness := 0, "HRESULT")
        return strokeThickness
    }

    /**
     * Sets the stroke thickness.
     * @param {Float} strokeThickness The stroke thickness value to be set; must be 0.0 or greater.
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
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A value that was passed in <i>strokeThickness</i> was not valid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsompath-setstrokethickness
     */
    SetStrokeThickness(strokeThickness) {
        result := ComCall(60, this, "float", strokeThickness, "HRESULT")
        return result
    }

    /**
     * Gets a pointer to the resolved IXpsOMBrush interface that contains the fill brush for the path.
     * @returns {IXpsOMBrush} A pointer to the resolved <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsombrush">IXpsOMBrush</a> interface that contains the fill brush for the path. If a fill brush has not been set, a <b>NULL</b> pointer is returned.
     * 
     * The value that is returned in this parameter depends on which method has most recently been called to set the brush.
     * 
     * <table>
     * <tr>
     * <th>Most recent method called</th>
     * <th>Object that is returned in <i>brush</i></th>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompath-setfillbrushlocal">SetFillBrushLocal</a>
     * 
     * 
     * </td>
     * <td>
     * The local brush that is set by <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompath-setfillbrushlocal">SetFillBrushLocal</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompath-setfillbrushlookup">SetFillBrushLookup</a>
     * 
     * 
     * </td>
     * <td>
     * The shared brush retrieved, with a lookup key that matches the key that is set by <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompath-setfillbrushlookup">SetFillBrushLookup</a>, from the resource directory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * Neither <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompath-setfillbrushlocal">SetFillBrushLocal</a> nor <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompath-setfillbrushlookup">SetFillBrushLookup</a> has been called yet.
     * 
     * </td>
     * <td>
     * <b>NULL</b> pointer.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsompath-getfillbrush
     */
    GetFillBrush() {
        result := ComCall(61, this, "ptr*", &brush := 0, "HRESULT")
        return IXpsOMBrush(brush)
    }

    /**
     * Gets a pointer to the local, unshared IXpsOMBrush interface that contains the fill brush for the path.
     * @returns {IXpsOMBrush} A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsombrush">IXpsOMBrush</a> interface to be used as the local, unshared fill brush for the path. If a fill brush lookup key has been set or if a local fill brush has not been set, a <b>NULL</b> pointer is returned.
     * 
     * The value that is returned in this parameter depends on which method has most recently been called to set the brush.
     * 
     * <table>
     * <tr>
     * <th>Most recent method called</th>
     * <th>Object that is returned in <i>brush</i></th>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompath-setfillbrushlocal">SetFillBrushLocal</a>
     * 
     * 
     * </td>
     * <td>
     * The local brush that is set by <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompath-setfillbrushlocal">SetFillBrushLocal</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompath-setfillbrushlookup">SetFillBrushLookup</a>
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
     * Neither <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompath-setfillbrushlocal">SetFillBrushLocal</a> nor <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompath-setfillbrushlookup">SetFillBrushLookup</a> has been called yet.
     * 
     * </td>
     * <td>
     * <b>NULL</b> pointer.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsompath-getfillbrushlocal
     */
    GetFillBrushLocal() {
        result := ComCall(62, this, "ptr*", &brush := 0, "HRESULT")
        return IXpsOMBrush(brush)
    }

    /**
     * Sets the pointer to the local, unshared IXpsOMBrush interface to be used as the fill brush.
     * @param {IXpsOMBrush} brush A pointer to the local, unshared <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsombrush">IXpsOMBrush</a> interface to be used as the fill brush.
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
     * <i>brush</i> does not point to a recognized interface implementation. Custom implementation of XPS Document API interfaces is not supported.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsompath-setfillbrushlocal
     */
    SetFillBrushLocal(brush) {
        result := ComCall(63, this, "ptr", brush, "HRESULT")
        return result
    }

    /**
     * Gets the lookup key of the brush that is stored in a resource dictionary and used as the fill brush for the path.
     * @returns {PWSTR} The lookup key for the fill brush that is stored in a resource dictionary. If the lookup key has not been set or if a local fill brush has been set, a <b>NULL</b> pointer is returned.
     * 
     * <table>
     * <tr>
     * <th>Most recent method called</th>
     * <th>String that is returned in <i>lookup</i></th>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompath-setfillbrushlocal">SetFillBrushLocal</a>
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
     * <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompath-setfillbrushlookup">SetFillBrushLookup</a>
     * 
     * 
     * </td>
     * <td>
     * The lookup key that is set by <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompath-setfillbrushlookup">SetFillBrushLookup</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * Neither <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompath-setfillbrushlocal">SetFillBrushLocal</a> nor <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompath-setfillbrushlookup">SetFillBrushLookup</a> has been called yet.
     * 
     * </td>
     * <td>
     * <b>NULL</b> pointer.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsompath-getfillbrushlookup
     */
    GetFillBrushLookup() {
        result := ComCall(64, this, "ptr*", &lookup := 0, "HRESULT")
        return lookup
    }

    /**
     * Sets the lookup key name of a shared brush in a resource dictionary, to be used as the fill brush.
     * @param {PWSTR} lookup The key name of the brush in a resource dictionary, to be used as the fill brush.
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
     * <dt><b>XPS_E_INVALID_RESOURCE_KEY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * According to the <a href="https://www.ecma-international.org/activities/XML%20Paper%20Specification/XPS%20Standard%20WD%201.6.pdf">XML Paper Specification</a>, the value of <i>lookup</i> is not a valid lookup key string.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>XPS_E_INVALID_LOOKUP_TYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The lookup key name in <i>lookup</i> references an object that is not a brush.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>XPS_E_LOOKUP_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No object could be found with a key name that matched the value passed in <i>lookup</i>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsompath-setfillbrushlookup
     */
    SetFillBrushLookup(lookup) {
        lookup := lookup is String ? StrPtr(lookup) : lookup

        result := ComCall(65, this, "ptr", lookup, "HRESULT")
        return result
    }

    /**
     * Makes a deep copy of the interface.
     * @returns {IXpsOMPath} A pointer to the copy of the interface.
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsompath-clone
     */
    Clone() {
        result := ComCall(66, this, "ptr*", &path := 0, "HRESULT")
        return IXpsOMPath(path)
    }
}
