#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Creates a media source or a byte stream from a URL.
 * @remarks
 * 
 * Applications do not use this interface. This interface is exposed by scheme handlers, which are used by the source resolver. A scheme handler is designed to parse one type of URL scheme. When the scheme handler is given a URL, it parses the resource that is located at that URL and creates either a media source or a byte stream.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/nn-mfidl-imfschemehandler
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFSchemeHandler extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFSchemeHandler
     * @type {Guid}
     */
    static IID => Guid("{6d4c7b74-52a0-4bb7-b0db-55f29f47a668}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["BeginCreateObject", "EndCreateObject", "CancelObjectCreation"]

    /**
     * 
     * @param {PWSTR} pwszURL 
     * @param {Integer} dwFlags 
     * @param {IPropertyStore} pProps 
     * @param {IMFAsyncCallback} pCallback 
     * @param {IUnknown} punkState 
     * @returns {IUnknown} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfschemehandler-begincreateobject
     */
    BeginCreateObject(pwszURL, dwFlags, pProps, pCallback, punkState) {
        pwszURL := pwszURL is String ? StrPtr(pwszURL) : pwszURL

        result := ComCall(3, this, "ptr", pwszURL, "uint", dwFlags, "ptr", pProps, "ptr*", &ppIUnknownCancelCookie := 0, "ptr", pCallback, "ptr", punkState, "HRESULT")
        return IUnknown(ppIUnknownCancelCookie)
    }

    /**
     * 
     * @param {IMFAsyncResult} pResult 
     * @param {Pointer<Integer>} pObjectType 
     * @param {Pointer<IUnknown>} ppObject 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfschemehandler-endcreateobject
     */
    EndCreateObject(pResult, pObjectType, ppObject) {
        pObjectTypeMarshal := pObjectType is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, "ptr", pResult, pObjectTypeMarshal, pObjectType, "ptr*", ppObject, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} pIUnknownCancelCookie 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfschemehandler-cancelobjectcreation
     */
    CancelObjectCreation(pIUnknownCancelCookie) {
        result := ComCall(5, this, "ptr", pIUnknownCancelCookie, "HRESULT")
        return result
    }
}
