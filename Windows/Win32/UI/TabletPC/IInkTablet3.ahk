#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

/**
 * Enables multitouch querying for input.
 * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nn-msinkaut-iinktablet3
 * @namespace Windows.Win32.UI.TabletPC
 */
export default struct IInkTablet3 extends IDispatch {
    /**
     * The interface identifier for IInkTablet3
     * @type {Guid}
     */
    static IID := Guid("{7e313997-1327-41dd-8ca9-79f24be17250}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IInkTablet3 interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_IsMultiTouch   : IntPtr
        get_MaximumCursors : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IInkTablet3.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    IsMultiTouch {
        get => this.get_IsMultiTouch()
    }

    /**
     * @type {Integer} 
     */
    MaximumCursors {
        get => this.get_MaximumCursors()
    }

    /**
     * Gets a value that indicates whether an input device supports multitouch.
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinktablet3-get_ismultitouch
     */
    get_IsMultiTouch() {
        result := ComCall(7, this, VARIANT_BOOL.Ptr, &pIsMultiTouch := 0, "HRESULT")
        return pIsMultiTouch
    }

    /**
     * Gets the maximum number of cursors that a tablet device supports.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinktablet3-get_maximumcursors
     */
    get_MaximumCursors() {
        result := ComCall(8, this, "uint*", &pMaximumCursors := 0, "HRESULT")
        return pMaximumCursors
    }

    Query(iid) {
        if (IInkTablet3.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_IsMultiTouch := CallbackCreate(GetMethod(implObj, "get_IsMultiTouch"), flags, 2)
        this.vtbl.get_MaximumCursors := CallbackCreate(GetMethod(implObj, "get_MaximumCursors"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_IsMultiTouch)
        CallbackFree(this.vtbl.get_MaximumCursors)
    }
}
