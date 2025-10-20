#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Creates a media source from a URL or a byte stream.
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/nn-mfidl-imfsourceresolver
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFSourceResolver extends IUnknown{
    /**
     * The interface identifier for IMFSourceResolver
     * @type {Guid}
     */
    static IID => Guid("{fbe5a32d-a497-4b61-bb85-97b1a848a6e3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {PWSTR} pwszURL 
     * @param {Integer} dwFlags 
     * @param {Pointer<IPropertyStore>} pProps 
     * @param {Pointer<Int32>} pObjectType 
     * @param {Pointer<IUnknown>} ppObject 
     * @returns {HRESULT} 
     */
    CreateObjectFromURL(pwszURL, dwFlags, pProps, pObjectType, ppObject) {
        pwszURL := pwszURL is String ? StrPtr(pwszURL) : pwszURL

        result := ComCall(3, this, "ptr", pwszURL, "uint", dwFlags, "ptr", pProps, "int*", pObjectType, "ptr", ppObject, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMFByteStream>} pByteStream 
     * @param {PWSTR} pwszURL 
     * @param {Integer} dwFlags 
     * @param {Pointer<IPropertyStore>} pProps 
     * @param {Pointer<Int32>} pObjectType 
     * @param {Pointer<IUnknown>} ppObject 
     * @returns {HRESULT} 
     */
    CreateObjectFromByteStream(pByteStream, pwszURL, dwFlags, pProps, pObjectType, ppObject) {
        pwszURL := pwszURL is String ? StrPtr(pwszURL) : pwszURL

        result := ComCall(4, this, "ptr", pByteStream, "ptr", pwszURL, "uint", dwFlags, "ptr", pProps, "int*", pObjectType, "ptr", ppObject, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pwszURL 
     * @param {Integer} dwFlags 
     * @param {Pointer<IPropertyStore>} pProps 
     * @param {Pointer<IUnknown>} ppIUnknownCancelCookie 
     * @param {Pointer<IMFAsyncCallback>} pCallback 
     * @param {Pointer<IUnknown>} punkState 
     * @returns {HRESULT} 
     */
    BeginCreateObjectFromURL(pwszURL, dwFlags, pProps, ppIUnknownCancelCookie, pCallback, punkState) {
        pwszURL := pwszURL is String ? StrPtr(pwszURL) : pwszURL

        result := ComCall(5, this, "ptr", pwszURL, "uint", dwFlags, "ptr", pProps, "ptr", ppIUnknownCancelCookie, "ptr", pCallback, "ptr", punkState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMFAsyncResult>} pResult 
     * @param {Pointer<Int32>} pObjectType 
     * @param {Pointer<IUnknown>} ppObject 
     * @returns {HRESULT} 
     */
    EndCreateObjectFromURL(pResult, pObjectType, ppObject) {
        result := ComCall(6, this, "ptr", pResult, "int*", pObjectType, "ptr", ppObject, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMFByteStream>} pByteStream 
     * @param {PWSTR} pwszURL 
     * @param {Integer} dwFlags 
     * @param {Pointer<IPropertyStore>} pProps 
     * @param {Pointer<IUnknown>} ppIUnknownCancelCookie 
     * @param {Pointer<IMFAsyncCallback>} pCallback 
     * @param {Pointer<IUnknown>} punkState 
     * @returns {HRESULT} 
     */
    BeginCreateObjectFromByteStream(pByteStream, pwszURL, dwFlags, pProps, ppIUnknownCancelCookie, pCallback, punkState) {
        pwszURL := pwszURL is String ? StrPtr(pwszURL) : pwszURL

        result := ComCall(7, this, "ptr", pByteStream, "ptr", pwszURL, "uint", dwFlags, "ptr", pProps, "ptr", ppIUnknownCancelCookie, "ptr", pCallback, "ptr", punkState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMFAsyncResult>} pResult 
     * @param {Pointer<Int32>} pObjectType 
     * @param {Pointer<IUnknown>} ppObject 
     * @returns {HRESULT} 
     */
    EndCreateObjectFromByteStream(pResult, pObjectType, ppObject) {
        result := ComCall(8, this, "ptr", pResult, "int*", pObjectType, "ptr", ppObject, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} pIUnknownCancelCookie 
     * @returns {HRESULT} 
     */
    CancelObjectCreation(pIUnknownCancelCookie) {
        result := ComCall(9, this, "ptr", pIUnknownCancelCookie, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
