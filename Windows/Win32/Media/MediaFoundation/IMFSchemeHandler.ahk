#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Creates a media source or a byte stream from a URL.
 * @remarks
 * Applications do not use this interface. This interface is exposed by scheme handlers, which are used by the source resolver. A scheme handler is designed to parse one type of URL scheme. When the scheme handler is given a URL, it parses the resource that is located at that URL and creates either a media source or a byte stream.
 * @see https://learn.microsoft.com/windows/win32/api//content/mfidl/nn-mfidl-imfschemehandler
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
     * Begins an asynchronous request to create an object from a URL.When the Source Resolver creates a media source from a URL, it passes the request to a scheme handler.
     * @remarks
     * The <i>dwFlags</i> parameter must contain the <b>MF_RESOLUTION_MEDIASOURCE</b> flag or the <b>MF_RESOLUTION_BYTESTREAM</b> flag. If the <b>MF_RESOLUTION_MEDIASOURCE</b> flag is set, the scheme handler might create the media source directly from the URL, or it might create a byte stream. The type of object is returned in the <i>pObjectType</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfschemehandler-endcreateobject">IMFSchemeHandler::EndCreateObject</a> method. If the scheme handler returns a byte stream, the source resolver will pass the byte stream to a byte-stream handler, which will create the media source from the byte stream.
     * 
     * If the <b>MF_RESOLUTION_BYTESTREAM</b> flag is set, the scheme handler will attempt to create a byte stream from the URL. However, if the scheme handler is designed to create a media source directly, rather than a byte stream, the method will fail.
     * 
     * The following table summarizes the behavior of these two flags when passed to this method:
     * 
     * <table>
     * <tr>
     * <th>Flag</th>
     * <th>Object created</th>
     * </tr>
     * <tr>
     * <td><b>MF_RESOLUTION_MEDIASOURCE</b></td>
     * <td>Media source or byte stream</td>
     * </tr>
     * <tr>
     * <td><b>MF_RESOLUTION_BYTESTREAM</b></td>
     * <td>Byte stream</td>
     * </tr>
     * </table>
     *  
     * 
     * The <b>MF_RESOLUTION_MEDIASOURCE</b> and <b>MF_RESOLUTION_BYTESTREAM</b> flags can be combined, although in this case it is redundant.
     * 
     * When the operation completes, the scheme handler calls the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfasynccallback-invoke">IMFAsyncCallback::Invoke</a> method. The Invoke method should call <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfschemehandler-endcreateobject">IMFSchemeHandler::EndCreateObject</a> to get a pointer to the created object.
     * @param {PWSTR} pwszURL A null-terminated string that contains the URL to resolve.
     * @param {Integer} dwFlags A bitwise <b>OR</b> of one or more flags. See <a href="https://docs.microsoft.com/windows/desktop/medfound/source-resolver-flags">Source Resolver Flags</a>.
     * @param {IPropertyStore} pProps A pointer to the <b>IPropertyStore</b> interface of a property store. The scheme handler can use this property store to configure the object. This parameter can be <b>NULL</b>. For more information, see <a href="https://docs.microsoft.com/windows/desktop/medfound/configuring-a-media-source">Configuring a Media Source</a>.
     * @param {IMFAsyncCallback} pCallback A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfasynccallback">IMFAsyncCallback</a> interface of a callback object. The caller must implement this interface.
     * @param {IUnknown} punkState A pointer to the <b>IUnknown</b> interface of a state object, defined by the caller. This parameter can be <b>NULL</b>. You can use this object to hold state information. The object is returned to the caller when the callback is invoked.
     * @returns {IUnknown} Receives an <b>IUnknown</b> pointer or the value <b>NULL</b>. If the value is not <b>NULL</b>, you can cancel the asynchronous operation by passing this pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfschemehandler-cancelobjectcreation">IMFSchemeHandler::CancelObjectCreation</a> method. The caller must release the interface. This parameter can be <b>NULL</b>, in which case the <b>IUnknown</b> pointer is not returned to the caller.
     * @see https://learn.microsoft.com/windows/win32/api//content/mfidl/nf-mfidl-imfschemehandler-begincreateobject
     */
    BeginCreateObject(pwszURL, dwFlags, pProps, pCallback, punkState) {
        pwszURL := pwszURL is String ? StrPtr(pwszURL) : pwszURL

        result := ComCall(3, this, "ptr", pwszURL, "uint", dwFlags, "ptr", pProps, "ptr*", &ppIUnknownCancelCookie := 0, "ptr", pCallback, "ptr", punkState, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IUnknown(ppIUnknownCancelCookie)
    }

    /**
     * Completes an asynchronous request to create an object from a URL. (IMFSchemeHandler.EndCreateObject)
     * @remarks
     * Call this method from inside the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfasynccallback-invoke">IMFAsyncCallback::Invoke</a> method.
     * @param {IMFAsyncResult} pResult Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfasyncresult">IMFAsyncResult</a> interface. Pass in the same pointer that your callback object received in the Invoke method.
     * @param {Pointer<Integer>} pObjectType Receives a member of the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/ne-mfidl-mf_object_type">MF_OBJECT_TYPE</a> enumeration, specifying the type of object that was created.
     * @param {Pointer<IUnknown>} ppObject Receives a pointer to the <b>IUnknown</b> interface of the object. The caller must release the interface.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ABORT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was canceled.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/mfidl/nf-mfidl-imfschemehandler-endcreateobject
     */
    EndCreateObject(pResult, pObjectType, ppObject) {
        pObjectTypeMarshal := pObjectType is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, "ptr", pResult, pObjectTypeMarshal, pObjectType, "ptr*", ppObject, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Cancels the current request to create an object from a URL.
     * @remarks
     * You can use this method to cancel a previous call to <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfschemehandler-begincreateobject">BeginCreateObject</a>. Because that method is asynchronous, however, it might be completed before the operation can be canceled. Therefore, your callback might still be invoked after you call this method.
     * 
     * The operation cannot be canceled if <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfschemehandler-begincreateobject">BeginCreateObject</a> returns <b>NULL</b> in the <i>ppIUnknownCancelCookie</i> parameter.
     * @param {IUnknown} pIUnknownCancelCookie Pointer to the <b>IUnknown</b> interface that was returned in the <i>ppIUnknownCancelCookie</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfschemehandler-begincreateobject">IMFSchemeHandler::BeginCreateObject</a> method.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/mfidl/nf-mfidl-imfschemehandler-cancelobjectcreation
     */
    CancelObjectCreation(pIUnknownCancelCookie) {
        result := ComCall(5, this, "ptr", pIUnknownCancelCookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
