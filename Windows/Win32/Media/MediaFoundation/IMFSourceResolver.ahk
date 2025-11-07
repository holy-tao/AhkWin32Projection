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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateObjectFromURL", "CreateObjectFromByteStream", "BeginCreateObjectFromURL", "EndCreateObjectFromURL", "BeginCreateObjectFromByteStream", "EndCreateObjectFromByteStream", "CancelObjectCreation"]

    /**
     * 
     * @param {PWSTR} pwszURL 
     * @param {Integer} dwFlags 
     * @param {IPropertyStore} pProps 
     * @param {Pointer<Integer>} pObjectType 
     * @param {Pointer<IUnknown>} ppObject 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfsourceresolver-createobjectfromurl
     */
    CreateObjectFromURL(pwszURL, dwFlags, pProps, pObjectType, ppObject) {
        pwszURL := pwszURL is String ? StrPtr(pwszURL) : pwszURL

        pObjectTypeMarshal := pObjectType is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, "ptr", pwszURL, "uint", dwFlags, "ptr", pProps, pObjectTypeMarshal, pObjectType, "ptr*", ppObject, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMFByteStream} pByteStream 
     * @param {PWSTR} pwszURL 
     * @param {Integer} dwFlags 
     * @param {IPropertyStore} pProps 
     * @param {Pointer<Integer>} pObjectType 
     * @param {Pointer<IUnknown>} ppObject 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfsourceresolver-createobjectfrombytestream
     */
    CreateObjectFromByteStream(pByteStream, pwszURL, dwFlags, pProps, pObjectType, ppObject) {
        pwszURL := pwszURL is String ? StrPtr(pwszURL) : pwszURL

        pObjectTypeMarshal := pObjectType is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, "ptr", pByteStream, "ptr", pwszURL, "uint", dwFlags, "ptr", pProps, pObjectTypeMarshal, pObjectType, "ptr*", ppObject, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwszURL 
     * @param {Integer} dwFlags 
     * @param {IPropertyStore} pProps 
     * @param {IMFAsyncCallback} pCallback 
     * @param {IUnknown} punkState 
     * @returns {IUnknown} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfsourceresolver-begincreateobjectfromurl
     */
    BeginCreateObjectFromURL(pwszURL, dwFlags, pProps, pCallback, punkState) {
        pwszURL := pwszURL is String ? StrPtr(pwszURL) : pwszURL

        result := ComCall(5, this, "ptr", pwszURL, "uint", dwFlags, "ptr", pProps, "ptr*", &ppIUnknownCancelCookie := 0, "ptr", pCallback, "ptr", punkState, "HRESULT")
        return IUnknown(ppIUnknownCancelCookie)
    }

    /**
     * 
     * @param {IMFAsyncResult} pResult 
     * @param {Pointer<Integer>} pObjectType 
     * @param {Pointer<IUnknown>} ppObject 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfsourceresolver-endcreateobjectfromurl
     */
    EndCreateObjectFromURL(pResult, pObjectType, ppObject) {
        pObjectTypeMarshal := pObjectType is VarRef ? "int*" : "ptr"

        result := ComCall(6, this, "ptr", pResult, pObjectTypeMarshal, pObjectType, "ptr*", ppObject, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMFByteStream} pByteStream 
     * @param {PWSTR} pwszURL 
     * @param {Integer} dwFlags 
     * @param {IPropertyStore} pProps 
     * @param {IMFAsyncCallback} pCallback 
     * @param {IUnknown} punkState 
     * @returns {IUnknown} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfsourceresolver-begincreateobjectfrombytestream
     */
    BeginCreateObjectFromByteStream(pByteStream, pwszURL, dwFlags, pProps, pCallback, punkState) {
        pwszURL := pwszURL is String ? StrPtr(pwszURL) : pwszURL

        result := ComCall(7, this, "ptr", pByteStream, "ptr", pwszURL, "uint", dwFlags, "ptr", pProps, "ptr*", &ppIUnknownCancelCookie := 0, "ptr", pCallback, "ptr", punkState, "HRESULT")
        return IUnknown(ppIUnknownCancelCookie)
    }

    /**
     * 
     * @param {IMFAsyncResult} pResult 
     * @param {Pointer<Integer>} pObjectType 
     * @param {Pointer<IUnknown>} ppObject 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfsourceresolver-endcreateobjectfrombytestream
     */
    EndCreateObjectFromByteStream(pResult, pObjectType, ppObject) {
        pObjectTypeMarshal := pObjectType is VarRef ? "int*" : "ptr"

        result := ComCall(8, this, "ptr", pResult, pObjectTypeMarshal, pObjectType, "ptr*", ppObject, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} pIUnknownCancelCookie 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfsourceresolver-cancelobjectcreation
     */
    CancelObjectCreation(pIUnknownCancelCookie) {
        result := ComCall(9, this, "ptr", pIUnknownCancelCookie, "HRESULT")
        return result
    }
}
