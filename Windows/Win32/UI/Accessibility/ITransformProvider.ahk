#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides access to controls that can be moved, resized, and/or rotated within a two-dimensional space.
 * @remarks
 * Implemented on a Microsoft UI Automation provider that must support the <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-implementingtransform">Transform</a> control pattern.
 *             
 * 
 * Support for this  control pattern is not limited to objects on the desktop. 
 *             This  control pattern must also be implemented by the children of a 
 *             container object as long as the children can be moved, resized, or rotated freely within the boundaries of the container.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nn-uiautomationcore-itransformprovider
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct ITransformProvider extends IUnknown {
    /**
     * The interface identifier for ITransformProvider
     * @type {Guid}
     */
    static IID := Guid("{6829ddc4-4f91-4ffa-b86f-bd3e2987cb4c}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITransformProvider interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Move          : IntPtr
        Resize        : IntPtr
        Rotate        : IntPtr
        get_CanMove   : IntPtr
        get_CanResize : IntPtr
        get_CanRotate : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITransformProvider.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BOOL} 
     */
    CanMove {
        get => this.get_CanMove()
    }

    /**
     * @type {BOOL} 
     */
    CanResize {
        get => this.get_CanResize()
    }

    /**
     * @type {BOOL} 
     */
    CanRotate {
        get => this.get_CanRotate()
    }

    /**
     * Moves the control.
     * @remarks
     * An object cannot be moved, resized or rotated such that its resulting screen 
     *         location would be completely outside the coordinates of its container and 
     *         inaccessible to keyboard or mouse. For example, when a top-level window is  
     *         moved completely off-screen or a child object is moved outside the boundaries 
     *         of the container's viewport. In these cases the object is placed as close to 
     *         the requested screen coordinates as possible with the top or left coordinates 
     *         overridden to be within the container boundaries.
     * @param {Float} x Type: <b>double</b>
     * 
     * The absolute screen coordinates of the left side of the control.
     * @param {Float} y Type: <b>double</b>
     * 
     * The absolute screen coordinates of the top of the control.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-itransformprovider-move
     */
    Move(x, y) {
        result := ComCall(3, this, "double", x, "double", y, "HRESULT")
        return result
    }

    /**
     * Resizes the control.
     * @remarks
     * When called on a control supporting split panes, this method might have the 
     *             side effect of resizing other contiguous panes. 
     *             
     * 
     * An object cannot be moved, resized, or rotated such that its resulting screen location 
     *             would be completely outside the coordinates of its container and inaccessible to keyboard 
     *             or mouse. For example, a top-level window moved completely off-screen or a child object 
     *             moved outside the boundaries of the container's viewport. In these cases the object is 
     *             placed as close to the requested screen coordinates as possible with the top or left 
     *             coordinates overridden to be within the container boundaries.
     * @param {Float} width Type: <b>double</b>
     * 
     * The new width of the window in pixels.
     * @param {Float} height Type: <b>double</b>
     * 
     * The new height of the window in pixels.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-itransformprovider-resize
     */
    Resize(width, height) {
        result := ComCall(4, this, "double", width, "double", height, "HRESULT")
        return result
    }

    /**
     * Rotates the control.
     * @remarks
     * An object cannot be moved, resized, or rotated such that its resulting screen location 
     *             would be completely outside the coordinates of its container and inaccessible to keyboard 
     *             or mouse. For example, a top-level window moved completely off-screen or a child object 
     *             moved outside the boundaries of the container's viewport. In these cases the object is 
     *             placed as close to the requested screen coordinates as possible with the top or left 
     *             coordinates overridden to be within the container boundaries.
     * @param {Float} degrees Type: <b>double</b>
     * 
     * The number of degrees to rotate the control. 
     * 				A positive number rotates clockwise; a negative number rotates counterclockwise.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-itransformprovider-rotate
     */
    Rotate(degrees) {
        result := ComCall(5, this, "double", degrees, "HRESULT")
        return result
    }

    /**
     * Indicates whether the control can be moved.
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-itransformprovider-get_canmove
     */
    get_CanMove() {
        result := ComCall(6, this, BOOL.Ptr, &pRetVal := 0, "HRESULT")
        return pRetVal
    }

    /**
     * Indicates whether the control can be resized.
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-itransformprovider-get_canresize
     */
    get_CanResize() {
        result := ComCall(7, this, BOOL.Ptr, &pRetVal := 0, "HRESULT")
        return pRetVal
    }

    /**
     * Indicates whether the control can be rotated.
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-itransformprovider-get_canrotate
     */
    get_CanRotate() {
        result := ComCall(8, this, BOOL.Ptr, &pRetVal := 0, "HRESULT")
        return pRetVal
    }

    Query(iid) {
        if (ITransformProvider.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Move := CallbackCreate(GetMethod(implObj, "Move"), flags, 3)
        this.vtbl.Resize := CallbackCreate(GetMethod(implObj, "Resize"), flags, 3)
        this.vtbl.Rotate := CallbackCreate(GetMethod(implObj, "Rotate"), flags, 2)
        this.vtbl.get_CanMove := CallbackCreate(GetMethod(implObj, "get_CanMove"), flags, 2)
        this.vtbl.get_CanResize := CallbackCreate(GetMethod(implObj, "get_CanResize"), flags, 2)
        this.vtbl.get_CanRotate := CallbackCreate(GetMethod(implObj, "get_CanRotate"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Move)
        CallbackFree(this.vtbl.Resize)
        CallbackFree(this.vtbl.Rotate)
        CallbackFree(this.vtbl.get_CanMove)
        CallbackFree(this.vtbl.get_CanResize)
        CallbackFree(this.vtbl.get_CanRotate)
    }
}
