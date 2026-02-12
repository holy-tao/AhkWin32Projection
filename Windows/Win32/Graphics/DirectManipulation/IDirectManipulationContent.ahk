#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\RECT.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Encapsulates content inside a viewport, where content represents a visual surface clipped inside the viewport.
 * @remarks
 * The system provides an implementation of <b>IDirectManipulationContent</b>.
 * @see https://learn.microsoft.com/windows/win32/api//content/directmanipulation/nn-directmanipulation-idirectmanipulationcontent
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
     * @remarks
     * If the bounding rectangle  has not been set using <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/nf-directmanipulation-idirectmanipulationcontent-setcontentrect">SetContentRect</a>, then <a href="https://docs.microsoft.com/windows/desktop/UIAnimation/uianimation-error-codes">UI_E_VALUE_NOT_SET</a> is returned. However, the actual content rectangle is (-<a href="https://docs.microsoft.com/previous-versions/ms858507(v=msdn.10)">FLT_MAX</a>, -<a href="https://docs.microsoft.com/previous-versions/ms858507(v=msdn.10)">FLT_MAX</a>, <a href="https://docs.microsoft.com/previous-versions/ms858507(v=msdn.10)">FLT_MAX</a>, <a href="https://docs.microsoft.com/previous-versions/ms858507(v=msdn.10)">FLT_MAX</a>).
     * @returns {RECT} The bounding rectangle of the content.
     * @see https://learn.microsoft.com/windows/win32/api//content/directmanipulation/nf-directmanipulation-idirectmanipulationcontent-getcontentrect
     */
    GetContentRect() {
        contentSize := RECT()
        result := ComCall(3, this, "ptr", contentSize, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return contentSize
    }

    /**
     * Specifies the bounding rectangle of the content, relative to its viewport.
     * @remarks
     * The default bounding rectangle is (-<a href="https://docs.microsoft.com/previous-versions/ms858507(v=msdn.10)">FLT_MAX</a>, -<a href="https://docs.microsoft.com/previous-versions/ms858507(v=msdn.10)">FLT_MAX</a>, <a href="https://docs.microsoft.com/previous-versions/ms858507(v=msdn.10)">FLT_MAX</a>, <a href="https://docs.microsoft.com/previous-versions/ms858507(v=msdn.10)">FLT_MAX</a>).
     * @param {Pointer<RECT>} contentSize The bounding rectangle of the content.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/directmanipulation/nf-directmanipulation-idirectmanipulationcontent-setcontentrect
     */
    SetContentRect(contentSize) {
        result := ComCall(4, this, "ptr", contentSize, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves the viewport that contains the content.
     * @param {Pointer<Guid>} riid A reference to the identifier of the interface to use.
     * @returns {Pointer<Pointer<Void>>} 
     * @see https://learn.microsoft.com/windows/win32/api//content/directmanipulation/nf-directmanipulation-idirectmanipulationcontent-getviewport
     */
    GetViewport(riid) {
        result := ComCall(5, this, "ptr", riid, "ptr*", &object_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return object_
    }

    /**
     * Retrieves the tag object set on this content.
     * @remarks
     * <b>GetTag</b> and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/nf-directmanipulation-idirectmanipulationcontent-settag">SetTag</a> are useful for associating an external COM object with the content without an external mapping between the two. They can also be used to pass information to callbacks generated for the content.
     * 
     * <b>GetTag</b> queries the tag value for the specified interface and returns a pointer to that interface.
     * 
     * A tag is a pairing of an integer ID (<i>id</i>) with a Component Object Model (COM) object (<i>object</i>). It can be used by an app to identify a motion.
     * The parameters are optional, so that the method can return both parts of the tag, the identifier portion, or the tag object.
     * @param {Pointer<Guid>} riid A reference to the identifier of the interface to use. The tag object typically implements this interface.
     * @param {Pointer<Pointer<Pointer<Void>>>} object_ The tag object.
     * @param {Pointer<Integer>} id The ID portion of the tag.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/directmanipulation/nf-directmanipulation-idirectmanipulationcontent-gettag
     */
    GetTag(riid, object_, id) {
        object_Marshal := object_ is VarRef ? "ptr*" : "ptr"
        idMarshal := id is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, "ptr", riid, object_Marshal, object_, idMarshal, id, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Specifies the tag object for the content.
     * @remarks
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/nf-directmanipulation-idirectmanipulationcontent-gettag">GetTag</a> and <b>SetTag</b> are useful for associating an external COM object with the content without an external mapping between the two. They can also be used to pass information to callbacks generated for the content.
     * 
     * A tag is a pairing of an integer ID  (<i>id</i>) with a Component Object Model (COM) object (<i>object</i>). It can be used by an app to store and retrieve an arbitrary object associated with the content.
     * 
     * The <i>object</i> parameter is optional, so that the method can set just the identifier portion.
     * @param {IUnknown} object_ The object portion of the tag.
     * @param {Integer} id The ID portion of the tag.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/directmanipulation/nf-directmanipulation-idirectmanipulationcontent-settag
     */
    SetTag(object_, id) {
        result := ComCall(7, this, "ptr", object_, "uint", id, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Gets the final transform applied to the content.
     * @remarks
     * This transform might contain the other custom curves applied during manipulation and inertia.
     * 
     * This transform contains both the content transform and the sync transform set with <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/nf-directmanipulation-idirectmanipulationcontent-synccontenttransform">SyncContentTransform</a>.
     * @param {Integer} pointCount The size of the transform matrix. This value is always 6, because a 3x2 matrix is used for all direct manipulation transforms.
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api//content/directmanipulation/nf-directmanipulation-idirectmanipulationcontent-getoutputtransform
     */
    GetOutputTransform(pointCount) {
        result := ComCall(8, this, "float*", &matrix_ := 0, "uint", pointCount, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return matrix_
    }

    /**
     * Retrieves the transform applied to the content.
     * @remarks
     * This transform contains the default overpan and bounce curves during manipulation and inertia.
     * 
     * This transform does not contain the sync transform set with <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/nf-directmanipulation-idirectmanipulationcontent-synccontenttransform">SyncContentTransform</a>.
     * 
     * 
     * 
     * When this method returns, the format of <i>matrix</i> is:
     * 
     * <i>matrix</i>
     * <i>matrix</i>
     * <i>matrix</i>
     * <i>matrix</i>
     * <i>matrix</i>
     * <i>matrix</i>
     * @param {Integer} pointCount The size of the transform matrix. This value is always 6, because a 3x2 matrix is used for all direct manipulation transforms.
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api//content/directmanipulation/nf-directmanipulation-idirectmanipulationcontent-getcontenttransform
     */
    GetContentTransform(pointCount) {
        result := ComCall(9, this, "float*", &matrix_ := 0, "uint", pointCount, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return matrix_
    }

    /**
     * Modifies the content transform while maintaining the output transform.
     * @remarks
     * This method will fail if the viewport state is <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/ne-directmanipulation-directmanipulation_status">DIRECTMANIPULATION_RUNNING</a>, <b>DIRECTMANIPULATION_INERTIA</b> or <b>DIRECTMANIPULATION_SUSPENDED</b>.
     * 
     * This method is useful when the application wants to apply transforms on top of the content transforms at the end of a manipulation, while preserving the visual output transform of the content.
     * @param {Pointer<Float>} matrix_ The transform matrix.
     * @param {Integer} pointCount The size of the transform matrix. This value is always 6, because a 3x2 matrix is used for all direct manipulation transforms.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/directmanipulation/nf-directmanipulation-idirectmanipulationcontent-synccontenttransform
     */
    SyncContentTransform(matrix_, pointCount) {
        matrix_Marshal := matrix_ is VarRef ? "float*" : "ptr"

        result := ComCall(10, this, matrix_Marshal, matrix_, "uint", pointCount, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
