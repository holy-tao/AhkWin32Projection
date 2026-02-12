#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFCapturePhotoConfirmation extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFCapturePhotoConfirmation
     * @type {Guid}
     */
    static IID => Guid("{19f68549-ca8a-4706-a4ef-481dbc95e12c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetPhotoConfirmationCallback", "SetPixelFormat", "GetPixelFormat"]

    /**
     * 
     * @param {IMFAsyncCallback} pNotificationCallback 
     * @returns {HRESULT} 
     */
    SetPhotoConfirmationCallback(pNotificationCallback) {
        result := ComCall(3, this, "ptr", pNotificationCallback, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/api//content/wingdi/nf-wingdi-setpixelformat
     */
    SetPixelFormat(subtype) {
        result := ComCall(4, this, "ptr", subtype, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The GetPixelFormat function obtains the index of the currently selected pixel format of the specified device context.
     * @returns {Guid} 
     * @see https://learn.microsoft.com/windows/win32/api//content/wingdi/nf-wingdi-getpixelformat
     */
    GetPixelFormat() {
        subtype := Guid()
        result := ComCall(5, this, "ptr", subtype, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return subtype
    }
}
