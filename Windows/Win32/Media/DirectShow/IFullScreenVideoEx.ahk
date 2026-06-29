#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IFullScreenVideo.ahk" { IFullScreenVideo }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\UI\WindowsAndMessaging\HACCEL.ahk" { HACCEL }

/**
 * The IFullScreenVideoEx interface is implemented on the Full Screen Renderer filter, which provides full-screen video rendering on older hardware.
 * @see https://learn.microsoft.com/windows/win32/api/amvideo/nn-amvideo-ifullscreenvideoex
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IFullScreenVideoEx extends IFullScreenVideo {
    /**
     * The interface identifier for IFullScreenVideoEx
     * @type {Guid}
     */
    static IID := Guid("{53479470-f1dd-11cf-bc42-00aa00ac74f6}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IFullScreenVideoEx interfaces
    */
    struct Vtbl extends IFullScreenVideo.Vtbl {
        SetAcceleratorTable    : IntPtr
        GetAcceleratorTable    : IntPtr
        KeepPixelAspectRatio   : IntPtr
        IsKeepPixelAspectRatio : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IFullScreenVideoEx.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The SetAcceleratorTable method specifies an accelerator table that will be used to translate keyboard messages. The Full Screen Renderer filter does not support this method.
     * @param {HWND} _hwnd Handle of the window that will receive the translated messages.
     * @param {HACCEL} _hAccel Handle to the accelerator table.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://learn.microsoft.com/windows/win32/api/amvideo/nf-amvideo-ifullscreenvideoex-setacceleratortable
     */
    SetAcceleratorTable(_hwnd, _hAccel) {
        result := ComCall(20, this, HWND, _hwnd, HACCEL, _hAccel, "HRESULT")
        return result
    }

    /**
     * The GetAcceleratorTable method retrieves the accelerator table currently being used to translate keyboard messages. The Full Screen Renderer filter does not support this method.
     * @param {Pointer<HACCEL>} phAccel Pointer to a variable that receives a handle to the accelerator table.
     * @returns {HWND} Pointer to a variable that receives a window handle. The window receives translated messages.
     * @see https://learn.microsoft.com/windows/win32/api/amvideo/nf-amvideo-ifullscreenvideoex-getacceleratortable
     */
    GetAcceleratorTable(phAccel) {
        phwnd := HWND()
        result := ComCall(21, this, HWND.Ptr, phwnd, HACCEL.Ptr, phAccel, "HRESULT")
        return phwnd
    }

    /**
     * The KeepPixelAspectRatio method specifies whether to maintain the pixel aspect ratio. The Full Screen Renderer filter does not support this method; it always maintains the pixel aspect ratio.
     * @param {Integer} KeepAspect Specifies whether to maintain the aspect ratio. The value must be OATRUE or OAFALSE.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://learn.microsoft.com/windows/win32/api/amvideo/nf-amvideo-ifullscreenvideoex-keeppixelaspectratio
     */
    KeepPixelAspectRatio(KeepAspect) {
        result := ComCall(22, this, "int", KeepAspect, "HRESULT")
        return result
    }

    /**
     * The IsKeepPixelAspectRatio method queries whether the pixel aspect ratio is maintained. The Full Screen Renderer filter does not support this method; it always maintains the pixel aspect ratio.
     * @returns {Integer} Pointer to a variable that receives the value OATRUE or OAFALSE.
     * @see https://learn.microsoft.com/windows/win32/api/amvideo/nf-amvideo-ifullscreenvideoex-iskeeppixelaspectratio
     */
    IsKeepPixelAspectRatio() {
        result := ComCall(23, this, "int*", &pKeepAspect := 0, "HRESULT")
        return pKeepAspect
    }

    Query(iid) {
        if (IFullScreenVideoEx.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetAcceleratorTable := CallbackCreate(GetMethod(implObj, "SetAcceleratorTable"), flags, 3)
        this.vtbl.GetAcceleratorTable := CallbackCreate(GetMethod(implObj, "GetAcceleratorTable"), flags, 3)
        this.vtbl.KeepPixelAspectRatio := CallbackCreate(GetMethod(implObj, "KeepPixelAspectRatio"), flags, 2)
        this.vtbl.IsKeepPixelAspectRatio := CallbackCreate(GetMethod(implObj, "IsKeepPixelAspectRatio"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetAcceleratorTable)
        CallbackFree(this.vtbl.GetAcceleratorTable)
        CallbackFree(this.vtbl.KeepPixelAspectRatio)
        CallbackFree(this.vtbl.IsKeepPixelAspectRatio)
    }
}
