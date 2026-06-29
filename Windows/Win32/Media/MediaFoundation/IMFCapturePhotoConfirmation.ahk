#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IMFAsyncCallback.ahk" { IMFAsyncCallback }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFCapturePhotoConfirmation extends IUnknown {
    /**
     * The interface identifier for IMFCapturePhotoConfirmation
     * @type {Guid}
     */
    static IID := Guid("{19f68549-ca8a-4706-a4ef-481dbc95e12c}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFCapturePhotoConfirmation interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetPhotoConfirmationCallback : IntPtr
        SetPixelFormat               : IntPtr
        GetPixelFormat               : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFCapturePhotoConfirmation.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {IMFAsyncCallback} pNotificationCallback 
     * @returns {HRESULT} 
     */
    SetPhotoConfirmationCallback(pNotificationCallback) {
        result := ComCall(3, this, "ptr", pNotificationCallback, "HRESULT")
        return result
    }

    /**
     * The SetPixelFormat function sets the pixel format of the specified device context to the format specified by the iPixelFormat index.
     * @remarks
     * If <i>hdc</i> references a window, calling the <b>SetPixelFormat</b> function also changes the pixel format of the window. Setting the pixel format of a window more than once can lead to significant complications for the Window Manager and for multithread applications, so it is not allowed. An application can only set the pixel format of a window one time. Once a window's pixel format is set, it cannot be changed.
     * 
     * You should select a pixel format in the device context before calling the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-wglcreatecontext">wglCreateContext</a> function. The <b>wglCreateContext</b> function creates a rendering context for drawing on the device in the selected pixel format of the device context.
     * 
     * An OpenGL window has its own pixel format. Because of this, only device contexts retrieved for the client area of an OpenGL window are allowed to draw into the window. As a result, an OpenGL window should be created with the WS_CLIPCHILDREN and WS_CLIPSIBLINGS styles. Additionally, the window class attribute should not include the CS_PARENTDC style.
     * @param {Guid} subtype 
     * @returns {HRESULT} If the function succeeds, the return value is <b>TRUE</b>.
     * 
     * If the function fails, the return value is <b>FALSE</b>. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/wingdi/nf-wingdi-setpixelformat
     */
    SetPixelFormat(subtype) {
        result := ComCall(4, this, Guid, subtype, "HRESULT")
        return result
    }

    /**
     * The GetPixelFormat function obtains the index of the currently selected pixel format of the specified device context.
     * @returns {Guid} 
     * @see https://learn.microsoft.com/windows/win32/api/wingdi/nf-wingdi-getpixelformat
     */
    GetPixelFormat() {
        subtype := Guid()
        result := ComCall(5, this, Guid.Ptr, subtype, "HRESULT")
        return subtype
    }

    Query(iid) {
        if (IMFCapturePhotoConfirmation.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetPhotoConfirmationCallback := CallbackCreate(GetMethod(implObj, "SetPhotoConfirmationCallback"), flags, 2)
        this.vtbl.SetPixelFormat := CallbackCreate(GetMethod(implObj, "SetPixelFormat"), flags, 2)
        this.vtbl.GetPixelFormat := CallbackCreate(GetMethod(implObj, "GetPixelFormat"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetPhotoConfirmationCallback)
        CallbackFree(this.vtbl.SetPixelFormat)
        CallbackFree(this.vtbl.GetPixelFormat)
    }
}
