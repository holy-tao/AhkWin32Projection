#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\DDGAMMARAMP.ahk" { DDGAMMARAMP }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Applications use the methods of the IDirectDrawGammaControl interface to adjust the red, green, and blue gamma ramp levels of the primary surface. This section is a reference to the methods of this interface.
 * @remarks
 * The <b>IDirectDrawGammaControl</b> interface is supported by DirectDrawSurface objects. That is, you can retrieve a pointer to the <b>IDirectDrawGammaControl</b> interface by calling the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">IUnknown::QueryInterface</a> method of a DirectDrawSurface object and by specifying the IID_IDirectDrawGammaControl reference identifier in the <i>riid</i> parameter.
 * 
 * 
 * 
 * You can use the LPDIRECTDRAWGAMMACONTROL data type to declare a variable that contains a pointer to an <b>IDirectDrawGammaControl</b> interface. The Ddraw.h header file declares the data type with the following code:
 * 
 * 
 * 
 * 
 * ```
 * 
 * typedef struct IDirectDrawGammaControl    FAR *LPDIRECTDRAWGAMMACONTROL;
 * 
 * ```
 * @see https://learn.microsoft.com/windows/win32/api/ddraw/nn-ddraw-idirectdrawgammacontrol
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct IDirectDrawGammaControl extends IUnknown {
    /**
     * The interface identifier for IDirectDrawGammaControl
     * @type {Guid}
     */
    static IID := Guid("{69c11c3e-b46b-11d1-ad7a-00c04fc29b4e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDirectDrawGammaControl interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetGammaRamp : IntPtr
        SetGammaRamp : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDirectDrawGammaControl.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves the red, green, and blue gamma ramps for the primary surface.
     * @param {Integer} param0 
     * @param {Pointer<DDGAMMARAMP>} param1 
     * @returns {HRESULT} If the method succeeds, the return value is DD_OK.
     * 
     * 
     * 
     * If it fails, the method can return one of the following error values:
     * 
     * <ul>
     * <li>DDERR_EXCEPTION</li>
     * <li>DDERR_INVALIDOBJECT</li>
     * <li>DDERR_INVALIDPARAMS</li>
     * </ul>
     * @see https://learn.microsoft.com/windows/win32/api/ddraw/nf-ddraw-idirectdrawgammacontrol-getgammaramp
     */
    GetGammaRamp(param0, param1) {
        result := ComCall(3, this, "uint", param0, DDGAMMARAMP.Ptr, param1, "HRESULT")
        return result
    }

    /**
     * Sets the red, green, and blue gamma ramps for the primary surface.
     * @remarks
     * Not all systems support gamma calibration. To determine whether gamma calibration is supported, call <a href="https://docs.microsoft.com/windows/desktop/api/ddraw/nf-ddraw-idirectdraw7-getcaps">IDirectDraw7::GetCaps</a> and examine the <b>dwCaps2</b> member of the associated <a href="https://docs.microsoft.com/windows/desktop/api/ddraw/ns-ddraw-ddcaps_dx3">DDCAPS</a> structure after the method returns. If the DDCAPS2_CANCALIBRATEGAMMA capability flag is present, gamma calibration is supported.
     * 
     * 
     * 
     * Calibrating gamma ramps incurs some processing overhead and should not be used frequently.
     * 
     * Including the DDSGR_CALIBRATE flag in the <i>dwFlags</i> parameter when running on computers that do not support gamma calibration does not cause this method to fail. The method succeeds and sets new gamma ramp values without calibration.
     * @param {Integer} param0 
     * @param {Pointer<DDGAMMARAMP>} param1 
     * @returns {HRESULT} If the method succeeds, the return value is DD_OK.
     * 
     * 
     * 
     * If it fails, the method can return one of the following error values:
     * 
     * <ul>
     * <li>DDERR_EXCEPTION</li>
     * <li>DDERR_INVALIDOBJECT</li>
     * <li>DDERR_INVALIDPARAMS</li>
     * <li>DDERR_OUTOFMEMORY</li>
     * </ul>
     * @see https://learn.microsoft.com/windows/win32/api/ddraw/nf-ddraw-idirectdrawgammacontrol-setgammaramp
     */
    SetGammaRamp(param0, param1) {
        result := ComCall(4, this, "uint", param0, DDGAMMARAMP.Ptr, param1, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDirectDrawGammaControl.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetGammaRamp := CallbackCreate(GetMethod(implObj, "GetGammaRamp"), flags, 3)
        this.vtbl.SetGammaRamp := CallbackCreate(GetMethod(implObj, "SetGammaRamp"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetGammaRamp)
        CallbackFree(this.vtbl.SetGammaRamp)
    }
}
