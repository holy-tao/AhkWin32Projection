#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\RECT.ahk" { RECT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Encapsulates content inside a viewport, where content represents a visual surface clipped inside the viewport.
 * @remarks
 * The system provides an implementation of <b>IDirectManipulationContent</b>.
 * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/nn-directmanipulation-idirectmanipulationcontent
 * @namespace Windows.Win32.Graphics.DirectManipulation
 */
export default struct IDirectManipulationContent extends IUnknown {
    /**
     * The interface identifier for IDirectManipulationContent
     * @type {Guid}
     */
    static IID := Guid("{b89962cb-3d89-442b-bb58-5098fa0f9f16}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDirectManipulationContent interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetContentRect       : IntPtr
        SetContentRect       : IntPtr
        GetViewport          : IntPtr
        GetTag               : IntPtr
        SetTag               : IntPtr
        GetOutputTransform   : IntPtr
        GetContentTransform  : IntPtr
        SyncContentTransform : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDirectManipulationContent.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves the bounding rectangle of the content, relative to the bounding rectangle of the viewport (if defined).
     * @remarks
     * If the bounding rectangle  has not been set using <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/nf-directmanipulation-idirectmanipulationcontent-setcontentrect">SetContentRect</a>, then <a href="https://docs.microsoft.com/windows/desktop/UIAnimation/uianimation-error-codes">UI_E_VALUE_NOT_SET</a> is returned. However, the actual content rectangle is (-<a href="https://docs.microsoft.com/previous-versions/ms858507(v=msdn.10)">FLT_MAX</a>, -<a href="https://docs.microsoft.com/previous-versions/ms858507(v=msdn.10)">FLT_MAX</a>, <a href="https://docs.microsoft.com/previous-versions/ms858507(v=msdn.10)">FLT_MAX</a>, <a href="https://docs.microsoft.com/previous-versions/ms858507(v=msdn.10)">FLT_MAX</a>).
     * @returns {RECT} The bounding rectangle of the content.
     * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/nf-directmanipulation-idirectmanipulationcontent-getcontentrect
     */
    GetContentRect() {
        contentSize := RECT()
        result := ComCall(3, this, RECT.Ptr, contentSize, "HRESULT")
        return contentSize
    }

    /**
     * Specifies the bounding rectangle of the content, relative to its viewport.
     * @remarks
     * The default bounding rectangle is (-<a href="https://docs.microsoft.com/previous-versions/ms858507(v=msdn.10)">FLT_MAX</a>, -<a href="https://docs.microsoft.com/previous-versions/ms858507(v=msdn.10)">FLT_MAX</a>, <a href="https://docs.microsoft.com/previous-versions/ms858507(v=msdn.10)">FLT_MAX</a>, <a href="https://docs.microsoft.com/previous-versions/ms858507(v=msdn.10)">FLT_MAX</a>).
     * @param {Pointer<RECT>} contentSize The bounding rectangle of the content.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/nf-directmanipulation-idirectmanipulationcontent-setcontentrect
     */
    SetContentRect(contentSize) {
        result := ComCall(4, this, RECT.Ptr, contentSize, "HRESULT")
        return result
    }

    /**
     * Retrieves the viewport that contains the content.
     * @param {Pointer<Guid>} riid A reference to the identifier of the interface to use.
     * @returns {Pointer<Void>} The viewport object.
     * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/nf-directmanipulation-idirectmanipulationcontent-getviewport
     */
    GetViewport(riid) {
        result := ComCall(5, this, Guid.Ptr, riid, "ptr*", &_object := 0, "HRESULT")
        return _object
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
     * @param {Pointer<Pointer<Void>>} _object The tag object.
     * @param {Pointer<Integer>} id The ID portion of the tag.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/nf-directmanipulation-idirectmanipulationcontent-gettag
     */
    GetTag(riid, _object, id) {
        _objectMarshal := _object is VarRef ? "ptr*" : "ptr"
        idMarshal := id is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, Guid.Ptr, riid, _objectMarshal, _object, idMarshal, id, "HRESULT")
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
     * @param {IUnknown} _object The object portion of the tag.
     * @param {Integer} id The ID portion of the tag.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/nf-directmanipulation-idirectmanipulationcontent-settag
     */
    SetTag(_object, id) {
        result := ComCall(7, this, "ptr", _object, "uint", id, "HRESULT")
        return result
    }

    /**
     * Gets the final transform applied to the content.
     * @remarks
     * This transform might contain the other custom curves applied during manipulation and inertia.
     * 
     * This transform contains both the content transform and the sync transform set with <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/nf-directmanipulation-idirectmanipulationcontent-synccontenttransform">SyncContentTransform</a>.
     * @param {Integer} pointCount The size of the transform matrix. This value is always 6, because a 3x2 matrix is used for all direct manipulation transforms.
     * @returns {Float} The transform matrix.
     * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/nf-directmanipulation-idirectmanipulationcontent-getoutputtransform
     */
    GetOutputTransform(pointCount) {
        result := ComCall(8, this, "float*", &_matrix := 0, "uint", pointCount, "HRESULT")
        return _matrix
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
     * @returns {Float} The transform matrix.
     * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/nf-directmanipulation-idirectmanipulationcontent-getcontenttransform
     */
    GetContentTransform(pointCount) {
        result := ComCall(9, this, "float*", &_matrix := 0, "uint", pointCount, "HRESULT")
        return _matrix
    }

    /**
     * Modifies the content transform while maintaining the output transform.
     * @remarks
     * This method will fail if the viewport state is <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/ne-directmanipulation-directmanipulation_status">DIRECTMANIPULATION_RUNNING</a>, <b>DIRECTMANIPULATION_INERTIA</b> or <b>DIRECTMANIPULATION_SUSPENDED</b>.
     * 
     * This method is useful when the application wants to apply transforms on top of the content transforms at the end of a manipulation, while preserving the visual output transform of the content.
     * @param {Pointer<Float>} _matrix The transform matrix.
     * @param {Integer} pointCount The size of the transform matrix. This value is always 6, because a 3x2 matrix is used for all direct manipulation transforms.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/nf-directmanipulation-idirectmanipulationcontent-synccontenttransform
     */
    SyncContentTransform(_matrix, pointCount) {
        _matrixMarshal := _matrix is VarRef ? "float*" : "ptr"

        result := ComCall(10, this, _matrixMarshal, _matrix, "uint", pointCount, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDirectManipulationContent.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetContentRect := CallbackCreate(GetMethod(implObj, "GetContentRect"), flags, 2)
        this.vtbl.SetContentRect := CallbackCreate(GetMethod(implObj, "SetContentRect"), flags, 2)
        this.vtbl.GetViewport := CallbackCreate(GetMethod(implObj, "GetViewport"), flags, 3)
        this.vtbl.GetTag := CallbackCreate(GetMethod(implObj, "GetTag"), flags, 4)
        this.vtbl.SetTag := CallbackCreate(GetMethod(implObj, "SetTag"), flags, 3)
        this.vtbl.GetOutputTransform := CallbackCreate(GetMethod(implObj, "GetOutputTransform"), flags, 3)
        this.vtbl.GetContentTransform := CallbackCreate(GetMethod(implObj, "GetContentTransform"), flags, 3)
        this.vtbl.SyncContentTransform := CallbackCreate(GetMethod(implObj, "SyncContentTransform"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetContentRect)
        CallbackFree(this.vtbl.SetContentRect)
        CallbackFree(this.vtbl.GetViewport)
        CallbackFree(this.vtbl.GetTag)
        CallbackFree(this.vtbl.SetTag)
        CallbackFree(this.vtbl.GetOutputTransform)
        CallbackFree(this.vtbl.GetContentTransform)
        CallbackFree(this.vtbl.SyncContentTransform)
    }
}
