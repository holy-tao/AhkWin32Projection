#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\RECT.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Encapsulates content inside a viewport, where content represents a visual surface clipped inside the viewport.
 * @remarks
 * 
 * The system provides an implementation of <b>IDirectManipulationContent</b>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//directmanipulation/nn-directmanipulation-idirectmanipulationcontent
 * @namespace Windows.Win32.Graphics.DirectManipulation
 * @version v4.0.30319
 */
class IDirectManipulationContent extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDirectManipulationContent
     * @type {Guid}
     */
    static IID => Guid("{b89962cb-3d89-442b-bb58-5098fa0f9f16}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetContentRect", "SetContentRect", "GetViewport", "GetTag", "SetTag", "GetOutputTransform", "GetContentTransform", "SyncContentTransform"]

    /**
     * Retrieves the bounding rectangle of the content, relative to the bounding rectangle of the viewport (if defined).
     * @returns {RECT} The bounding rectangle of the content.
     * @see https://docs.microsoft.com/windows/win32/api//directmanipulation/nf-directmanipulation-idirectmanipulationcontent-getcontentrect
     */
    GetContentRect() {
        contentSize := RECT()
        result := ComCall(3, this, "ptr", contentSize, "HRESULT")
        return contentSize
    }

    /**
     * Specifies the bounding rectangle of the content, relative to its viewport.
     * @param {Pointer<RECT>} contentSize The bounding rectangle of the content.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//directmanipulation/nf-directmanipulation-idirectmanipulationcontent-setcontentrect
     */
    SetContentRect(contentSize) {
        result := ComCall(4, this, "ptr", contentSize, "HRESULT")
        return result
    }

    /**
     * Retrieves the viewport that contains the content.
     * @param {Pointer<Guid>} riid A reference to the identifier of the interface to use.
     * @returns {Pointer<Void>} The viewport object.
     * @see https://docs.microsoft.com/windows/win32/api//directmanipulation/nf-directmanipulation-idirectmanipulationcontent-getviewport
     */
    GetViewport(riid) {
        result := ComCall(5, this, "ptr", riid, "ptr*", &object := 0, "HRESULT")
        return object
    }

    /**
     * Retrieves the tag object set on this content.
     * @param {Pointer<Guid>} riid A reference to the identifier of the interface to use. The tag object typically implements this interface.
     * @param {Pointer<Pointer<Void>>} object The tag object.
     * @param {Pointer<Integer>} id The ID portion of the tag.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//directmanipulation/nf-directmanipulation-idirectmanipulationcontent-gettag
     */
    GetTag(riid, object, id) {
        objectMarshal := object is VarRef ? "ptr*" : "ptr"
        idMarshal := id is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, "ptr", riid, objectMarshal, object, idMarshal, id, "HRESULT")
        return result
    }

    /**
     * Specifies the tag object for the content.
     * @param {IUnknown} object The object portion of the tag.
     * @param {Integer} id The ID portion of the tag.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//directmanipulation/nf-directmanipulation-idirectmanipulationcontent-settag
     */
    SetTag(object, id) {
        result := ComCall(7, this, "ptr", object, "uint", id, "HRESULT")
        return result
    }

    /**
     * Gets the final transform applied to the content.
     * @param {Integer} pointCount The size of the transform matrix. This value is always 6, because a 3x2 matrix is used for all direct manipulation transforms.
     * @returns {Float} The transform matrix.
     * @see https://docs.microsoft.com/windows/win32/api//directmanipulation/nf-directmanipulation-idirectmanipulationcontent-getoutputtransform
     */
    GetOutputTransform(pointCount) {
        result := ComCall(8, this, "float*", &matrix := 0, "uint", pointCount, "HRESULT")
        return matrix
    }

    /**
     * Retrieves the transform applied to the content.
     * @param {Integer} pointCount The size of the transform matrix. This value is always 6, because a 3x2 matrix is used for all direct manipulation transforms.
     * @returns {Float} The transform matrix.
     * @see https://docs.microsoft.com/windows/win32/api//directmanipulation/nf-directmanipulation-idirectmanipulationcontent-getcontenttransform
     */
    GetContentTransform(pointCount) {
        result := ComCall(9, this, "float*", &matrix := 0, "uint", pointCount, "HRESULT")
        return matrix
    }

    /**
     * Modifies the content transform while maintaining the output transform.
     * @param {Pointer<Float>} matrix The transform matrix.
     * @param {Integer} pointCount The size of the transform matrix. This value is always 6, because a 3x2 matrix is used for all direct manipulation transforms.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//directmanipulation/nf-directmanipulation-idirectmanipulationcontent-synccontenttransform
     */
    SyncContentTransform(matrix, pointCount) {
        matrixMarshal := matrix is VarRef ? "float*" : "ptr"

        result := ComCall(10, this, matrixMarshal, matrix, "uint", pointCount, "HRESULT")
        return result
    }
}
