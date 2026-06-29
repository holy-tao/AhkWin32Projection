#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides access to a control that can be moved, resized, or rotated.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nn-uiautomationclient-iuiautomationtransformpattern
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct IUIAutomationTransformPattern extends IUnknown {
    /**
     * The interface identifier for IUIAutomationTransformPattern
     * @type {Guid}
     */
    static IID := Guid("{a9b55844-a55d-4ef0-926d-569c16ff89bb}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUIAutomationTransformPattern interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Move                 : IntPtr
        Resize               : IntPtr
        Rotate               : IntPtr
        get_CurrentCanMove   : IntPtr
        get_CurrentCanResize : IntPtr
        get_CurrentCanRotate : IntPtr
        get_CachedCanMove    : IntPtr
        get_CachedCanResize  : IntPtr
        get_CachedCanRotate  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUIAutomationTransformPattern.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BOOL} 
     */
    CurrentCanMove {
        get => this.get_CurrentCanMove()
    }

    /**
     * @type {BOOL} 
     */
    CurrentCanResize {
        get => this.get_CurrentCanResize()
    }

    /**
     * @type {BOOL} 
     */
    CurrentCanRotate {
        get => this.get_CurrentCanRotate()
    }

    /**
     * @type {BOOL} 
     */
    CachedCanMove {
        get => this.get_CachedCanMove()
    }

    /**
     * @type {BOOL} 
     */
    CachedCanResize {
        get => this.get_CachedCanResize()
    }

    /**
     * @type {BOOL} 
     */
    CachedCanRotate {
        get => this.get_CachedCanRotate()
    }

    /**
     * Moves the UI Automation element.
     * @remarks
     * An element cannot be moved, resized or rotated such that its resulting screen location would be completely outside the coordinates of its container and inaccessible to the keyboard or mouse. For example, when a top-level window is moved completely off-screen or a child object is moved outside the boundaries of the container's viewport, the object is placed as close to the requested screen coordinates as possible with the top or left coordinates overridden to be within the container boundaries.
     * @param {Float} x Type: <b>double</b>
     * 
     * Absolute screen coordinates of the left side of the control.
     * @param {Float} y Type: <b>double</b>
     * 
     * Absolute screen coordinates of the top of the control.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtransformpattern-move
     */
    Move(x, y) {
        result := ComCall(3, this, "double", x, "double", y, "HRESULT")
        return result
    }

    /**
     * Resizes the UI Automation element.
     * @remarks
     * When called on a control that supports split panes, this method can have the side effect of resizing other contiguous panes. 
     * 
     * An object cannot be moved, resized, or rotated such that its resulting screen location would be completely outside the coordinates of its container and inaccessible to the keyboard or mouse. For example, when a top-level window is moved completely off-screen or a child object is moved outside the boundaries of the container's viewport. In these cases the object is placed as close to the requested screen coordinates as possible with the top or left coordinates overridden to be within the container boundaries.
     * @param {Float} width Type: <b>double</b>
     * 
     * The new width of the window, in pixels.
     * @param {Float} height Type: <b>double</b>
     * 
     * The new height of the window, in pixels.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtransformpattern-resize
     */
    Resize(width, height) {
        result := ComCall(4, this, "double", width, "double", height, "HRESULT")
        return result
    }

    /**
     * Rotates the UI Automation element.
     * @remarks
     * An object cannot be moved, resized, or rotated such that its resulting screen location would be completely outside the coordinates of its container and inaccessible to the keyboard or mouse. For example, when a top-level window is moved completely off-screen or a child object is moved outside the boundaries of the container's viewport, the object is placed as close to the requested screen coordinates as possible with the top or left coordinates overridden to be within the container boundaries.
     * @param {Float} degrees Type: <b>double</b>
     * 
     * The number of degrees to rotate the element. A positive number rotates clockwise; a negative number rotates counterclockwise.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtransformpattern-rotate
     */
    Rotate(degrees) {
        result := ComCall(5, this, "double", degrees, "HRESULT")
        return result
    }

    /**
     * Indicates whether the element can be moved.
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtransformpattern-get_currentcanmove
     */
    get_CurrentCanMove() {
        result := ComCall(6, this, BOOL.Ptr, &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Indicates whether the element can be resized.
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtransformpattern-get_currentcanresize
     */
    get_CurrentCanResize() {
        result := ComCall(7, this, BOOL.Ptr, &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Indicates whether the element can be rotated.
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtransformpattern-get_currentcanrotate
     */
    get_CurrentCanRotate() {
        result := ComCall(8, this, BOOL.Ptr, &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Retrieves a cached value that indicates whether the element can be moved.
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtransformpattern-get_cachedcanmove
     */
    get_CachedCanMove() {
        result := ComCall(9, this, BOOL.Ptr, &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Retrieves a cached value that indicates whether the element can be resized.
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtransformpattern-get_cachedcanresize
     */
    get_CachedCanResize() {
        result := ComCall(10, this, BOOL.Ptr, &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Retrieves a cached value that indicates whether the element can be rotated.
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtransformpattern-get_cachedcanrotate
     */
    get_CachedCanRotate() {
        result := ComCall(11, this, BOOL.Ptr, &retVal := 0, "HRESULT")
        return retVal
    }

    Query(iid) {
        if (IUIAutomationTransformPattern.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Move := CallbackCreate(GetMethod(implObj, "Move"), flags, 3)
        this.vtbl.Resize := CallbackCreate(GetMethod(implObj, "Resize"), flags, 3)
        this.vtbl.Rotate := CallbackCreate(GetMethod(implObj, "Rotate"), flags, 2)
        this.vtbl.get_CurrentCanMove := CallbackCreate(GetMethod(implObj, "get_CurrentCanMove"), flags, 2)
        this.vtbl.get_CurrentCanResize := CallbackCreate(GetMethod(implObj, "get_CurrentCanResize"), flags, 2)
        this.vtbl.get_CurrentCanRotate := CallbackCreate(GetMethod(implObj, "get_CurrentCanRotate"), flags, 2)
        this.vtbl.get_CachedCanMove := CallbackCreate(GetMethod(implObj, "get_CachedCanMove"), flags, 2)
        this.vtbl.get_CachedCanResize := CallbackCreate(GetMethod(implObj, "get_CachedCanResize"), flags, 2)
        this.vtbl.get_CachedCanRotate := CallbackCreate(GetMethod(implObj, "get_CachedCanRotate"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Move)
        CallbackFree(this.vtbl.Resize)
        CallbackFree(this.vtbl.Rotate)
        CallbackFree(this.vtbl.get_CurrentCanMove)
        CallbackFree(this.vtbl.get_CurrentCanResize)
        CallbackFree(this.vtbl.get_CurrentCanRotate)
        CallbackFree(this.vtbl.get_CachedCanMove)
        CallbackFree(this.vtbl.get_CachedCanResize)
        CallbackFree(this.vtbl.get_CachedCanRotate)
    }
}
