#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\DDCOLORCONTROL.ahk" { DDCOLORCONTROL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Applications use the methods of the IDirectDrawColorControl interface to get and set color controls.
 * @remarks
 * You can use the LPDIRECTDRAWCOLORCONTROL data type to declare a variable that contains a pointer to an <b>IDirectDrawColorControl</b> interface. The Ddraw.h header file declares this data type with the following code:
 * 
 * 
 * 
 * 
 * ```
 * 
 * typedef struct IDirectDrawColorControl    FAR *LPDIRECTDRAWCOLORCONTROL;
 * 
 * ```
 * @see https://learn.microsoft.com/windows/win32/api/ddraw/nn-ddraw-idirectdrawcolorcontrol
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct IDirectDrawColorControl extends IUnknown {
    /**
     * The interface identifier for IDirectDrawColorControl
     * @type {Guid}
     */
    static IID := Guid("{4b9f0ee0-0d7e-11d0-9b06-00a0c903a3b8}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDirectDrawColorControl interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetColorControls : IntPtr
        SetColorControls : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDirectDrawColorControl.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves the current color-control settings that are associated with an overlay or a primary surface.
     * @remarks
     * The <b>dwFlags</b> member of the <a href="https://docs.microsoft.com/previous-versions/windows/hardware/drivers/ff549237(v=vs.85)">DDCOLORCONTROL</a> structure indicates which of the color-control options are supported.
     * @param {Pointer<DDCOLORCONTROL>} param0 
     * @returns {HRESULT} If the method succeeds, the return value is DD_OK.
     * 
     * 
     * 
     * If it fails, the method can return one of the following error values:
     * 
     * <ul>
     * <li>DDERR_INVALIDOBJECT</li>
     * <li>DDERR_INVALIDPARAMS</li>
     * <li>DDERR_UNSUPPORTED</li>
     * </ul>
     * @see https://learn.microsoft.com/windows/win32/api/ddraw/nf-ddraw-idirectdrawcolorcontrol-getcolorcontrols
     */
    GetColorControls(param0) {
        result := ComCall(3, this, DDCOLORCONTROL.Ptr, param0, "HRESULT")
        return result
    }

    /**
     * Sets the color-control options for an overlay or a primary surface.
     * @param {Pointer<DDCOLORCONTROL>} param0 
     * @returns {HRESULT} If the method succeeds, the return value is DD_OK.
     * 
     * If it fails, the method can return one of the following error values:
     * 
     * <ul>
     * <li>DDERR_INVALIDOBJECT</li>
     * <li>DDERR_INVALIDPARAMS</li>
     * <li>DDERR_UNSUPPORTED</li>
     * </ul>
     * @see https://learn.microsoft.com/windows/win32/api/ddraw/nf-ddraw-idirectdrawcolorcontrol-setcolorcontrols
     */
    SetColorControls(param0) {
        result := ComCall(4, this, DDCOLORCONTROL.Ptr, param0, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDirectDrawColorControl.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetColorControls := CallbackCreate(GetMethod(implObj, "GetColorControls"), flags, 2)
        this.vtbl.SetColorControls := CallbackCreate(GetMethod(implObj, "SetColorControls"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetColorControls)
        CallbackFree(this.vtbl.SetColorControls)
    }
}
