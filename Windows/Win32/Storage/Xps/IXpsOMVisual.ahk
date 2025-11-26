#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IXpsOMMatrixTransform.ahk
#Include .\IXpsOMGeometry.ahk
#Include .\IXpsOMBrush.ahk
#Include ..\..\System\Com\IUri.ahk
#Include .\IXpsOMShareable.ahk

/**
 * The base interface for path, canvas, and glyph interfaces.
 * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nn-xpsobjectmodel-ixpsomvisual
 * @namespace Windows.Win32.Storage.Xps
 * @version v4.0.30319
 */
class IXpsOMVisual extends IXpsOMShareable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXpsOMVisual
     * @type {Guid}
     */
    static IID => Guid("{bc3e7333-fb0b-4af3-a819-0b4eaad0d2fd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 5

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetTransform", "GetTransformLocal", "SetTransformLocal", "GetTransformLookup", "SetTransformLookup", "GetClipGeometry", "GetClipGeometryLocal", "SetClipGeometryLocal", "GetClipGeometryLookup", "SetClipGeometryLookup", "GetOpacity", "SetOpacity", "GetOpacityMaskBrush", "GetOpacityMaskBrushLocal", "SetOpacityMaskBrushLocal", "GetOpacityMaskBrushLookup", "SetOpacityMaskBrushLookup", "GetName", "SetName", "GetIsHyperlinkTarget", "SetIsHyperlinkTarget", "GetHyperlinkNavigateUri", "SetHyperlinkNavigateUri", "GetLanguage", "SetLanguage"]

    /**
     * Gets a pointer to the IXpsOMMatrixTransform interface that contains the visual's resolved matrix transform.
     * @returns {IXpsOMMatrixTransform} A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsommatrixtransform">IXpsOMMatrixTransform</a> interface that contains the visual's resolved matrix transform. If  a matrix transform has not been set, a <b>NULL</b> pointer is returned.
     * 
     * The value that is returned in this parameter depends on which method has most recently been called to set the transform.
     * 
     * <table>
     * <tr>
     * <th>Most recent method called</th>
     * <th>Object that is returned in <i>matrixTransform</i></th>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomvisual-settransformlocal">SetTransformLocal</a>
     * 
     * 
     * </td>
     * <td>
     * The local transform that is set by <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomvisual-settransformlocal">SetTransformLocal</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomvisual-settransformlookup">SetTransformLookup</a>
     * 
     * 
     * </td>
     * <td>
     * The shared transform that gets retrieved, with a lookup key that matches the key that is set by <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomvisual-settransformlookup">SetTransformLookup</a>, from the resource directory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * Neither <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomvisual-settransformlocal">SetTransformLocal</a> nor <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomvisual-settransformlookup">SetTransformLookup</a> has been called yet.
     * 
     * </td>
     * <td>
     * <b>NULL</b> pointer.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomvisual-gettransform
     */
    GetTransform() {
        result := ComCall(5, this, "ptr*", &matrixTransform := 0, "HRESULT")
        return IXpsOMMatrixTransform(matrixTransform)
    }

    /**
     * Gets a pointer to the IXpsOMMatrixTransform interface that contains the local, unshared, resolved matrix transform for the visual.
     * @returns {IXpsOMMatrixTransform} A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsommatrixtransform">IXpsOMMatrixTransform</a> interface  that contains the local, unshared, resolved matrix transform for the visual.  If a matrix transform lookup key has not been set, or if a local matrix transform has  been set, a <b>NULL</b> pointer is returned.
     * 
     * <table>
     * <tr>
     * <th>Most recent method called</th>
     * <th>Object that is returned in <i>matrixTransform</i></th>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomvisual-settransformlocal">SetTransformLocal</a>
     * 
     * 
     * </td>
     * <td>
     * The local transform that is set by <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomvisual-settransformlocal">SetTransformLocal</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomvisual-settransformlookup">SetTransformLookup</a>
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
     * Neither <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomvisual-settransformlocal">SetTransformLocal</a> nor <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomvisual-settransformlookup">SetTransformLookup</a> has been called yet.
     * 
     * </td>
     * <td>
     * <b>NULL</b> pointer.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomvisual-gettransformlocal
     */
    GetTransformLocal() {
        result := ComCall(6, this, "ptr*", &matrixTransform := 0, "HRESULT")
        return IXpsOMMatrixTransform(matrixTransform)
    }

    /**
     * Sets the local, unshared matrix transform.
     * @param {IXpsOMMatrixTransform} matrixTransform A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsommatrixtransform">IXpsOMMatrixTransform</a> interface to be set as the local, unshared matrix transform. A <b>NULL</b> pointer releases the previously assigned transform.
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
     * <i>matrixTransform</i> does not point to a recognized interface implementation. Custom implementation of XPS Document API interfaces is not supported.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomvisual-settransformlocal
     */
    SetTransformLocal(matrixTransform) {
        result := ComCall(7, this, "ptr", matrixTransform, "HRESULT")
        return result
    }

    /**
     * Gets the lookup key name of the IXpsOMMatrixTransform interface in a resource dictionary that contains the resolved matrix transform for the visual.
     * @returns {PWSTR} The lookup key name for the <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsommatrixtransform">IXpsOMMatrixTransform</a> interface in a resource dictionary that contains the resolved matrix transform for the visual. If a matrix transform lookup key has not been set, or if a local matrix transform has  been set, a <b>NULL</b> pointer is returned.
     * 
     * <table>
     * <tr>
     * <th>Most recent method called</th>
     * <th>Object that is returned in <i>key</i></th>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomvisual-settransformlocal">SetTransformLocal</a>
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
     * <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomvisual-settransformlookup">SetTransformLookup</a>
     * 
     * 
     * </td>
     * <td>
     * The lookup key that is set by <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomvisual-settransformlookup">SetTransformLookup</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * Neither <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomvisual-settransformlocal">SetTransformLocal</a> nor <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomvisual-settransformlookup">SetTransformLookup</a> has been called yet.
     * 
     * </td>
     * <td>
     * <b>NULL</b> pointer.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomvisual-gettransformlookup
     */
    GetTransformLookup() {
        result := ComCall(8, this, "ptr*", &key := 0, "HRESULT")
        return key
    }

    /**
     * Sets the lookup key name of a shared matrix transform in a resource dictionary.
     * @param {PWSTR} key The lookup key name of the matrix transform in the dictionary.
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
     * The lookup key name in <i>key</i> references an object that is not a geometry.
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
     * No object could be found with a key name that matched the value passed in <i>key</i>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomvisual-settransformlookup
     */
    SetTransformLookup(key) {
        key := key is String ? StrPtr(key) : key

        result := ComCall(9, this, "ptr", key, "HRESULT")
        return result
    }

    /**
     * Gets a pointer to the IXpsOMGeometry interface that contains the resolved geometry of the visual's clipping region.
     * @returns {IXpsOMGeometry} A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomgeometry">IXpsOMGeometry</a> interface that contains the resolved geometry of the visual's clipping region. If  the clip geometry has not been set, a <b>NULL</b> pointer is returned.
     * 
     * The value that is returned in this parameter depends on which method has most recently been called to set the geometry.
     * 
     * <table>
     * <tr>
     * <th>Most recent method called</th>
     * <th>Object that is returned in <i>clipGeometry</i></th>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomvisual-setclipgeometrylocal">SetClipGeometryLocal</a>
     * 
     * 
     * </td>
     * <td>
     * The local clip geometry that is set by <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomvisual-setclipgeometrylocal">SetClipGeometryLocal</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomvisual-setclipgeometrylookup">SetClipGeometryLookup</a>
     * 
     * 
     * </td>
     * <td>
     * The shared clip geometry that gets retrieved, with a lookup key that matches the key that is set by <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomvisual-setclipgeometrylookup">SetClipGeometryLookup</a>, from the resource directory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * Neither <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomvisual-setclipgeometrylocal">SetClipGeometryLocal</a> nor <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomvisual-setclipgeometrylookup">SetClipGeometryLookup</a> has been called yet.
     * 
     * </td>
     * <td>
     * <b>NULL</b> pointer.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomvisual-getclipgeometry
     */
    GetClipGeometry() {
        result := ComCall(10, this, "ptr*", &clipGeometry := 0, "HRESULT")
        return IXpsOMGeometry(clipGeometry)
    }

    /**
     * Gets a pointer to the IXpsOMGeometry interface that contains the local, unshared geometry of the visual's clipping region.
     * @returns {IXpsOMGeometry} A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomgeometry">IXpsOMGeometry</a> interface that contains the local, unshared geometry of the visual's clipping region. If a clip geometry lookup key has been set, or if a local clip geometry has not been set, a <b>NULL</b> pointer is returned.
     * 
     * <table>
     * <tr>
     * <th>Most recent method called</th>
     * <th>Object that is returned in <i>clipGeometry</i></th>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomvisual-setclipgeometrylocal">SetClipGeometryLocal</a>
     * 
     * 
     * </td>
     * <td>
     * The local clip geometry that is set by <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomvisual-setclipgeometrylocal">SetClipGeometryLocal</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomvisual-setclipgeometrylookup">SetClipGeometryLookup</a>
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
     * Neither <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomvisual-setclipgeometrylocal">SetClipGeometryLocal</a> nor <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomvisual-setclipgeometrylookup">SetClipGeometryLookup</a> has been called yet.
     * 
     * </td>
     * <td>
     * <b>NULL</b> pointer.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomvisual-getclipgeometrylocal
     */
    GetClipGeometryLocal() {
        result := ComCall(11, this, "ptr*", &clipGeometry := 0, "HRESULT")
        return IXpsOMGeometry(clipGeometry)
    }

    /**
     * Sets the local, unshared clipping region for the visual.
     * @param {IXpsOMGeometry} clipGeometry A pointer to the  <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomgeometry">IXpsOMGeometry</a> interface to be set as the local, unshared clipping region for the visual. A <b>NULL</b> pointer releases the previously assigned geometry interface.
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
     * <i>clipGeometry</i> does not point to a recognized interface implementation. Custom implementation of XPS Document API interfaces is not supported.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomvisual-setclipgeometrylocal
     */
    SetClipGeometryLocal(clipGeometry) {
        result := ComCall(12, this, "ptr", clipGeometry, "HRESULT")
        return result
    }

    /**
     * Gets the lookup key for the IXpsOMGeometry interface in a resource dictionary that contains the visual's clipping region.
     * @returns {PWSTR} The lookup key for the <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomgeometry">IXpsOMGeometry</a> interface in a resource dictionary that contains the visual's clipping region. If a lookup key for the  clip geometry  has not been set, or if a local clip geometry has  been set, a <b>NULL</b> pointer is returned.
     * 
     * <table>
     * <tr>
     * <th>Most recent method called</th>
     * <th>Lookup key string that is returned in <i>key</i></th>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomvisual-setclipgeometrylocal">SetClipGeometryLocal</a>
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
     * <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomvisual-setclipgeometrylookup">SetClipGeometryLookup</a>
     * 
     * 
     * </td>
     * <td>
     * The lookup key that is set by <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomvisual-setclipgeometrylookup">SetClipGeometryLookup</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * Neither <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomvisual-setclipgeometrylocal">SetClipGeometryLocal</a> nor <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomvisual-setclipgeometrylookup">SetClipGeometryLookup</a> has been called yet.
     * 
     * </td>
     * <td>
     * <b>NULL</b> pointer.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomvisual-getclipgeometrylookup
     */
    GetClipGeometryLookup() {
        result := ComCall(13, this, "ptr*", &key := 0, "HRESULT")
        return key
    }

    /**
     * Sets the lookup key name of a shared clip geometry in a resource dictionary.
     * @param {PWSTR} key The lookup key name of the clip geometry in the dictionary. A <b>NULL</b> pointer clears the previously assigned key name.
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
     * The lookup key name in <i>key</i> references an object that is not a geometry.
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
     * No object could be found with a key name that matched the value passed in <i>key</i>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomvisual-setclipgeometrylookup
     */
    SetClipGeometryLookup(key) {
        key := key is String ? StrPtr(key) : key

        result := ComCall(14, this, "ptr", key, "HRESULT")
        return result
    }

    /**
     * Gets the opacity value of this visual.
     * @returns {Float} The opacity value.
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomvisual-getopacity
     */
    GetOpacity() {
        result := ComCall(15, this, "float*", &opacity := 0, "HRESULT")
        return opacity
    }

    /**
     * Sets the opacity value of the visual.
     * @param {Float} opacity The opacity value to be set for the visual. 
     * 
     * The range of allowed values for this parameter is 0.0  to 1.0; with 0.0 the visual is completely transparent, and with 1.0 it is completely opaque.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the table that follows. For information about  XPS document API return values that are not listed in this table, see <a href="/previous-versions/windows/desktop/dd372955(v=vs.85)">XPS Document Errors</a>.
     *           
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
     * <i>opacity</i> contains a value that is not allowed.
     *               
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomvisual-setopacity
     */
    SetOpacity(opacity) {
        result := ComCall(16, this, "float", opacity, "HRESULT")
        return result
    }

    /**
     * Gets a pointer to the IXpsOMBrush interface of the visual's opacity mask brush.
     * @returns {IXpsOMBrush} A pointer to the  <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsombrush">IXpsOMBrush</a> interface of the visual's opacity mask brush. If  an opacity mask  brush has not been set for this visual, a <b>NULL</b> pointer is returned.
     * 
     * The value that is returned in this parameter depends on which method has most recently been called to set the brush.
     * 
     * <table>
     * <tr>
     * <th>Most recent method called</th>
     * <th>Object that is returned in <i>opacityMaskBrush</i></th>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomvisual-setopacitymaskbrushlocal">SetOpacityMaskBrushLocal</a>
     * 
     * 
     * </td>
     * <td>
     * The local opacity mask brush that is set by <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomvisual-setopacitymaskbrushlocal">SetOpacityMaskBrushLocal</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomvisual-setopacitymaskbrushlookup">SetOpacityMaskBrushLookup</a>
     * 
     * 
     * </td>
     * <td>
     * The shared opacity mask brush that gets retrieved, with a lookup key that matches the key that is set by <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomvisual-setopacitymaskbrushlookup">SetOpacityMaskBrushLookup</a>, from the resource directory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * Neither <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomvisual-setopacitymaskbrushlocal">SetOpacityMaskBrushLocal</a> nor <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomvisual-setopacitymaskbrushlookup">SetOpacityMaskBrushLookup</a> has been called yet.
     * 
     * </td>
     * <td>
     * <b>NULL</b> pointer.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomvisual-getopacitymaskbrush
     */
    GetOpacityMaskBrush() {
        result := ComCall(17, this, "ptr*", &opacityMaskBrush := 0, "HRESULT")
        return IXpsOMBrush(opacityMaskBrush)
    }

    /**
     * Gets the local, unshared opacity mask brush for the visual.
     * @returns {IXpsOMBrush} A pointer to the  <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsombrush">IXpsOMBrush</a> interface of the visual's opacity mask brush. If an opacity mask brush lookup key has been set, or if a local opacity mask brush has not been set, a <b>NULL</b> pointer is returned.
     * 
     * <table>
     * <tr>
     * <th>Most recent method called</th>
     * <th>Object that is returned in <i>opacityMaskBrush</i></th>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomvisual-setopacitymaskbrushlocal">SetOpacityMaskBrushLocal</a>
     * 
     * 
     * </td>
     * <td>
     * The local opacity mask brush that is set by <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomvisual-setopacitymaskbrushlocal">SetOpacityMaskBrushLocal</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomvisual-setopacitymaskbrushlookup">SetOpacityMaskBrushLookup</a>
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
     * Neither <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomvisual-setopacitymaskbrushlocal">SetOpacityMaskBrushLocal</a> nor <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomvisual-setopacitymaskbrushlookup">SetOpacityMaskBrushLookup</a> has been called yet.
     * 
     * </td>
     * <td>
     * <b>NULL</b> pointer.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomvisual-getopacitymaskbrushlocal
     */
    GetOpacityMaskBrushLocal() {
        result := ComCall(18, this, "ptr*", &opacityMaskBrush := 0, "HRESULT")
        return IXpsOMBrush(opacityMaskBrush)
    }

    /**
     * Sets the IXpsOMBrush interface pointer as the local, unshared opacity mask brush.
     * @param {IXpsOMBrush} opacityMaskBrush A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsombrush">IXpsOMBrush</a> interface to be set as the local, unshared opacity mask brush. A <b>NULL</b> pointer clears the previously assigned opacity mask brush.
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
     * <i>opacityMaskBrush</i> does not point to a recognized interface implementation. Custom implementation of XPS Document API interfaces is not supported.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomvisual-setopacitymaskbrushlocal
     */
    SetOpacityMaskBrushLocal(opacityMaskBrush) {
        result := ComCall(19, this, "ptr", opacityMaskBrush, "HRESULT")
        return result
    }

    /**
     * Gets the name of the lookup key of the shared opacity mask brush in a resource dictionary.
     * @returns {PWSTR} The name of the lookup key  of the shared opacity mask brush in a resource dictionary. If the lookup key of an opacity mask brush  has not been set, or if a local opacity mask brush has been set, a <b>NULL</b> pointer is returned.
     * 
     * <table>
     * <tr>
     * <th>Most recent method called</th>
     * <th>Object that is returned in <i>key</i></th>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomvisual-setopacitymaskbrushlocal">SetOpacityMaskBrushLocal</a>
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
     * <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomvisual-setopacitymaskbrushlookup">SetOpacityMaskBrushLookup</a>
     * 
     * 
     * </td>
     * <td>
     * The lookup key that is set by <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomvisual-setopacitymaskbrushlookup">SetOpacityMaskBrushLookup</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * Neither <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomvisual-setopacitymaskbrushlocal">SetOpacityMaskBrushLocal</a> nor <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomvisual-setopacitymaskbrushlookup">SetOpacityMaskBrushLookup</a> has been called yet.
     * 
     * </td>
     * <td>
     * <b>NULL</b> pointer.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomvisual-getopacitymaskbrushlookup
     */
    GetOpacityMaskBrushLookup() {
        result := ComCall(20, this, "ptr*", &key := 0, "HRESULT")
        return key
    }

    /**
     * Sets the lookup key name of a shared opacity mask brush in a resource dictionary.
     * @param {PWSTR} key The lookup key name of the opacity mask brush in the dictionary.  A <b>NULL</b> pointer clears the previously assigned key name.
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
     * The lookup key name in <i>key</i> references an object that is not a geometry.
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
     * No object could be found with a key name that matched the value passed in <i>key</i>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomvisual-setopacitymaskbrushlookup
     */
    SetOpacityMaskBrushLookup(key) {
        key := key is String ? StrPtr(key) : key

        result := ComCall(21, this, "ptr", key, "HRESULT")
        return result
    }

    /**
     * Gets the Name property of the visual.
     * @returns {PWSTR} The <b>Name</b> property string. If  the <b>Name</b> property has not been set, a <b>NULL</b> pointer is returned.
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomvisual-getname
     */
    GetName() {
        result := ComCall(22, this, "ptr*", &name := 0, "HRESULT")
        return name
    }

    /**
     * Sets the Name property of the visual.
     * @param {PWSTR} name The name of the visual. A <b>NULL</b> pointer clears the <b>Name</b> property.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the table that follows. For information about  XPS document API return values that are not listed in this table, see <a href="/previous-versions/windows/desktop/dd372955(v=vs.85)">XPS Document Errors</a>.
     *           
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
     * <dt><b>XPS_E_INVALID_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * According to the <a href="https://www.ecma-international.org/activities/XML%20Paper%20Specification/XPS%20Standard%20WD%201.6.pdf">XML Paper Specification</a>, the string that is passed in <i>name</i>  is not a valid name.
     *               
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomvisual-setname
     */
    SetName(name) {
        name := name is String ? StrPtr(name) : name

        result := ComCall(23, this, "ptr", name, "HRESULT")
        return result
    }

    /**
     * Gets a value that indicates whether the visual is the target of a hyperlink.
     * @returns {BOOL} The Boolean value that indicates whether the visual is the target of a hyperlink.
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
     * The visual is the target of a hyperlink.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FALSE"></a><a id="false"></a><dl>
     * <dt><b><b>FALSE</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The visual is not the target of a hyperlink.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomvisual-getishyperlinktarget
     */
    GetIsHyperlinkTarget() {
        result := ComCall(24, this, "int*", &isHyperlink := 0, "HRESULT")
        return isHyperlink
    }

    /**
     * Specifies whether the visual is the target of a hyperlink.
     * @param {BOOL} isHyperlink The Boolean value that specifies whether the visual is the target of a hyperlink.
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
     * The visual is the target of a hyperlink.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FALSE"></a><a id="false"></a><dl>
     * <dt><b><b>FALSE</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The visual is not the target of a hyperlink.
     * 
     * </td>
     * </tr>
     * </table>
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
     * <dt><b>XPS_E_MISSING_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The page has not been named. The hyperlink target status can only be set if the page has a name.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomvisual-setishyperlinktarget
     */
    SetIsHyperlinkTarget(isHyperlink) {
        result := ComCall(25, this, "int", isHyperlink, "HRESULT")
        return result
    }

    /**
     * Gets a pointer to the IUri interface to which this visual object links.
     * @returns {IUri} A pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/internet-explorer/ie-developer/platform-apis/ms775038(v=vs.85)">IUri</a> interface that contains the destination URI for the link. 
     * 				If  a URI has not been set for this object, a <b>NULL</b> pointer is returned.
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomvisual-gethyperlinknavigateuri
     */
    GetHyperlinkNavigateUri() {
        result := ComCall(26, this, "ptr*", &hyperlinkUri := 0, "HRESULT")
        return IUri(hyperlinkUri)
    }

    /**
     * Sets the destination URI of the visual's hyperlink.
     * @param {IUri} hyperlinkUri The <a href="https://docs.microsoft.com/previous-versions/windows/internet-explorer/ie-developer/platform-apis/ms775038(v=vs.85)">IUri</a> interface that contains the destination URI of the visual's hyperlink.
     * @returns {HRESULT} If the method succeeds, it returns S_OK; otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomvisual-sethyperlinknavigateuri
     */
    SetHyperlinkNavigateUri(hyperlinkUri) {
        result := ComCall(27, this, "ptr", hyperlinkUri, "HRESULT")
        return result
    }

    /**
     * Gets the Language property of the visual and of its contents.
     * @returns {PWSTR} The language string that specifies the language of the page. If a language has not been set, a <b>NULL</b> pointer is returned.
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomvisual-getlanguage
     */
    GetLanguage() {
        result := ComCall(28, this, "ptr*", &language := 0, "HRESULT")
        return language
    }

    /**
     * Sets the Language property of the visual.
     * @param {PWSTR} language The language string that specifies the language of the visual and of its contents. A <b>NULL</b> pointer clears the   <b>Language</b> property.
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
     * <dt><b>XPS_E_INVALID_LANGUAGE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     *  The value of <i>language</i> is formatted incorrectly or specifies a language that is not valid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomvisual-setlanguage
     */
    SetLanguage(language) {
        language := language is String ? StrPtr(language) : language

        result := ComCall(29, this, "ptr", language, "HRESULT")
        return result
    }
}
