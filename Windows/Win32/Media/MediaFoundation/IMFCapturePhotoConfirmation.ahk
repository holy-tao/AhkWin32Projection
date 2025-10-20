#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFCapturePhotoConfirmation extends IUnknown{
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
     * 
     * @param {Pointer<IMFAsyncCallback>} pNotificationCallback 
     * @returns {HRESULT} 
     */
    SetPhotoConfirmationCallback(pNotificationCallback) {
        result := ComCall(3, this, "ptr", pNotificationCallback, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * The SetPixelFormat function sets the pixel format of the specified device context to the format specified by the iPixelFormat index.
     * @param {Pointer<Guid>} subtype 
     * @returns {HRESULT} If the function succeeds, the return value is <b>TRUE</b>.
     * 
     * If the function fails, the return value is <b>FALSE</b>. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-setpixelformat
     */
    SetPixelFormat(subtype) {
        result := ComCall(4, this, "ptr", subtype, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * The GetPixelFormat function obtains the index of the currently selected pixel format of the specified device context.
     * @param {Pointer<Guid>} subtype 
     * @returns {HRESULT} If the function succeeds, the return value is the currently selected pixel format index of the specified device context. This is a positive, one-based index value.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-getpixelformat
     */
    GetPixelFormat(subtype) {
        result := ComCall(5, this, "ptr", subtype, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
