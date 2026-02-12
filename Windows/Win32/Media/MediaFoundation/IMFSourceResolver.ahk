#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Creates a media source from a URL or a byte stream.
 * @see https://learn.microsoft.com/windows/win32/api//content/mfidl/nn-mfidl-imfsourceresolver
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
     * Creates a media source or a byte stream from a URL. This method is synchronous.
     * @remarks
     * The <i>dwFlags</i> parameter must contain either the <b>MF_RESOLUTION_MEDIASOURCE</b> flag or the <b>MF_RESOLUTION_BYTESTREAM</b> flag, but should not contain both.
     * 
     * It is recommended that you do not set <b>MF_RESOLUTION_WRITE</b> on the input argument <i>dwFlags</i>  unless it is necessary for your scenario. For most use-cases, media sources do not need to be created with write capability. Creating a media source with write capability may have a lower probability of success than creating a media source without write capability. This is because there can be stricter checks on the content represented by the URL when creating a media source with write capability.
     * 
     * For local files, you can pass the file name in the <i>pwszURL</i> parameter; the <c>file:</c> scheme is not required.
     * 
     * <div class="alert"><b>Note</b>  This method cannot be called remotely.</div>
     * <div> </div>
     * @param {PWSTR} pwszURL Null-terminated string that contains the URL to resolve.
     * @param {Integer} dwFlags Bitwise OR of one or more flags. See <a href="https://docs.microsoft.com/windows/desktop/medfound/source-resolver-flags">Source Resolver Flags</a>.
     *           See remarks below.
     * @param {IPropertyStore} pProps Pointer to the <b>IPropertyStore</b> interface of a property store. The method passes the property store to the scheme handler or byte-stream handler that creates the object. The handler can use the property store to configure the object. This parameter can be <b>NULL</b>. For more information, see <a href="https://docs.microsoft.com/windows/desktop/medfound/configuring-a-media-source">Configuring a Media Source</a>.
     * @param {Pointer<Integer>} pObjectType Receives a member of the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/ne-mfidl-mf_object_type">MF_OBJECT_TYPE</a> enumeration, specifying the type of object that was created.
     * @param {Pointer<IUnknown>} ppObject Receives a pointer to the object's <b>IUnknown</b> interface. The caller must release the interface.
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
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_SOURCERESOLVER_MUTUALLY_EXCLUSIVE_FLAGS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>dwFlags</i> parameter contains mutually exclusive flags.
     *               
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_UNSUPPORTED_SCHEME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The URL scheme is not supported.
     *               
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/mfidl/nf-mfidl-imfsourceresolver-createobjectfromurl
     */
    CreateObjectFromURL(pwszURL, dwFlags, pProps, pObjectType, ppObject) {
        pwszURL := pwszURL is String ? StrPtr(pwszURL) : pwszURL

        pObjectTypeMarshal := pObjectType is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, "ptr", pwszURL, "uint", dwFlags, "ptr", pProps, pObjectTypeMarshal, pObjectType, "ptr*", ppObject, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Creates a media source from a byte stream. This method is synchronous.
     * @remarks
     * The <i>dwFlags</i> parameter must contain the <b>MF_RESOLUTION_MEDIASOURCE</b> flag and should not contain the <b>MF_RESOLUTION_BYTESTREAM</b> flag.
     * 
     * The source resolver attempts to find one or more byte-stream handlers for the byte stream, based on the file name extension of the URL, or the MIME type of the byte stream (or both). The URL is specified in the optional <i>pwszURL</i> parameter, and the MIME type may be specified in the <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-bytestream-content-type-attribute">MF_BYTESTREAM_CONTENT_TYPE</a> attribute on the byte stream. Byte-stream handlers are registered by file name extension or MIME type, or both, as described in <a href="https://docs.microsoft.com/windows/desktop/medfound/scheme-handlers-and-byte-stream-handlers">Scheme Handlers and Byte-Stream Handlers</a>. The caller should specify at least one of these values (both if possible):
     * 
     * <ul>
     * <li>Specify the URL in the <i>pwszURL</i> parameter.
     *           </li>
     * <li>Specify the MIME type by setting the <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-bytestream-content-type-attribute">MF_BYTESTREAM_CONTENT_TYPE</a> attribute on the byte stream. (This attribute might be set already when you create the byte stream, depending on how the byte stream was created.)
     *           </li>
     * </ul>
     * <div class="alert"><b>Note</b>  This method cannot be called remotely.</div>
     * <div> </div>
     * @param {IMFByteStream} pByteStream Pointer to the byte stream's <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfbytestream">IMFByteStream</a> interface.
     * @param {PWSTR} pwszURL Null-terminated string that contains the URL of the byte stream. The URL is optional and can be <b>NULL</b>. See Remarks for more information.
     * @param {Integer} dwFlags Bitwise <b>OR</b> of flags. See <a href="https://docs.microsoft.com/windows/desktop/medfound/source-resolver-flags">Source Resolver Flags</a>.
     * @param {IPropertyStore} pProps Pointer to the <b>IPropertyStore</b> interface of a property store. The method passes the property store to the byte-stream handler. The byte-stream handler can use the property store to configure the media source. This parameter can be <b>NULL</b>. For more information, see <a href="https://docs.microsoft.com/windows/desktop/medfound/configuring-a-media-source">Configuring a Media Source</a>.
     * @param {Pointer<Integer>} pObjectType Receives a member of the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/ne-mfidl-mf_object_type">MF_OBJECT_TYPE</a> enumeration, specifying the type of object that was created.
     * @param {Pointer<IUnknown>} ppObject Receives a pointer to the media source's <b>IUnknown</b> interface. The caller must release the interface.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     *           
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
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_SOURCERESOLVER_MUTUALLY_EXCLUSIVE_FLAGS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>dwFlags</i> parameter contains mutually exclusive flags.
     *               
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_UNSUPPORTED_BYTESTREAM_TYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This byte stream is not supported.
     *               
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/mfidl/nf-mfidl-imfsourceresolver-createobjectfrombytestream
     */
    CreateObjectFromByteStream(pByteStream, pwszURL, dwFlags, pProps, pObjectType, ppObject) {
        pwszURL := pwszURL is String ? StrPtr(pwszURL) : pwszURL

        pObjectTypeMarshal := pObjectType is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, "ptr", pByteStream, "ptr", pwszURL, "uint", dwFlags, "ptr", pProps, pObjectTypeMarshal, pObjectType, "ptr*", ppObject, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Begins an asynchronous request to create a media source or a byte stream from a URL.
     * @remarks
     * The <i>dwFlags</i> parameter must contain either the MF_RESOLUTION_MEDIASOURCE flag or the MF_RESOLUTION_BYTESTREAM flag, but should not contain both.
     * 
     * For local files, you can pass the file name in the <i>pwszURL</i> parameter; the <c>file:</c> scheme is not required.
     * 
     * When the operation completes, the source resolver calls the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfasynccallback-invoke">IMFAsyncCallback::Invoke</a> method. The <b>Invoke</b> method should call <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfsourceresolver-endcreateobjectfromurl">IMFSourceResolver::EndCreateObjectFromURL</a> to get a pointer to the object that was created.
     * 
     * The usage of the <i>pProps</i> parameter depends on the implementation of the media source.
     * @param {PWSTR} pwszURL Null-terminated string that contains the URL to resolve.
     * @param {Integer} dwFlags Bitwise OR of flags. See <a href="https://docs.microsoft.com/windows/desktop/medfound/source-resolver-flags">Source Resolver Flags</a>.
     * @param {IPropertyStore} pProps Pointer to the <b>IPropertyStore</b> interface of a property store. The method passes the property store to the scheme handler or byte-stream handler that creates the object. The handler can use the property store to configure the object. This parameter can be <b>NULL</b>. For more information, see <a href="https://docs.microsoft.com/windows/desktop/medfound/configuring-a-media-source">Configuring a Media Source</a>.
     * @param {IMFAsyncCallback} pCallback Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfasynccallback">IMFAsyncCallback</a> interface of a callback object. The caller must implement this interface.
     * @param {IUnknown} punkState Pointer to the <b>IUnknown</b> interface of a state object, defined by the caller. This parameter can be <b>NULL</b>. You can use this object to hold state information. The object is returned to the caller when the callback is invoked.
     * @returns {IUnknown} Receives an <b>IUnknown</b> pointer or the value <b>NULL</b>. If the value is not <b>NULL</b>, you can cancel the asynchronous operation by passing this pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfsourceresolver-cancelobjectcreation">IMFSourceResolver::CancelObjectCreation</a> method. The caller must release the interface. This parameter can be <b>NULL</b>.
     * @see https://learn.microsoft.com/windows/win32/api//content/mfidl/nf-mfidl-imfsourceresolver-begincreateobjectfromurl
     */
    BeginCreateObjectFromURL(pwszURL, dwFlags, pProps, pCallback, punkState) {
        pwszURL := pwszURL is String ? StrPtr(pwszURL) : pwszURL

        result := ComCall(5, this, "ptr", pwszURL, "uint", dwFlags, "ptr", pProps, "ptr*", &ppIUnknownCancelCookie := 0, "ptr", pCallback, "ptr", punkState, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IUnknown(ppIUnknownCancelCookie)
    }

    /**
     * Completes an asynchronous request to create an object from a URL. (IMFSourceResolver.EndCreateObjectFromURL)
     * @remarks
     * Call this method from inside your application's <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfasynccallback-invoke">IMFAsyncCallback::Invoke</a> method.
     * @param {IMFAsyncResult} pResult Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfasyncresult">IMFAsyncResult</a> interface. Pass in the same pointer that your callback object received in the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfasynccallback-invoke">Invoke</a> method.
     * @param {Pointer<Integer>} pObjectType Receives a member of the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/ne-mfidl-mf_object_type">MF_OBJECT_TYPE</a> enumeration, specifying the type of object that was created.
     * @param {Pointer<IUnknown>} ppObject Receives a pointer to the media source's <b>IUnknown</b> interface. The caller must release the interface.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     *           
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
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/mfidl/nf-mfidl-imfsourceresolver-endcreateobjectfromurl
     */
    EndCreateObjectFromURL(pResult, pObjectType, ppObject) {
        pObjectTypeMarshal := pObjectType is VarRef ? "int*" : "ptr"

        result := ComCall(6, this, "ptr", pResult, pObjectTypeMarshal, pObjectType, "ptr*", ppObject, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Begins an asynchronous request to create a media source from a byte stream. (IMFSourceResolver.BeginCreateObjectFromByteStream)
     * @remarks
     * The <i>dwFlags</i> parameter must contain the <b>MF_RESOLUTION_MEDIASOURCE</b> flag and should not contain the <b>MF_RESOLUTION_BYTESTREAM</b> flag.
     * 
     * The source resolver attempts to find one or more byte-stream handlers for the byte stream, based on the file name extension of the URL, or the MIME type of the byte stream (or both). The URL is specified in the optional <i>pwszURL</i> parameter, and the MIME type may be specified in the <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-bytestream-content-type-attribute">MF_BYTESTREAM_CONTENT_TYPE</a> attribute on the byte stream. Byte-stream handlers are registered by file name extension or MIME type, or both, as described in <a href="https://docs.microsoft.com/windows/desktop/medfound/scheme-handlers-and-byte-stream-handlers">Scheme Handlers and Byte-Stream Handlers</a>. The caller should specify at least one of these values.
     * 
     * When the operation completes, the source resolver calls the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfasynccallback-invoke">IMFAsyncCallback::Invoke</a> method. The <b>Invoke</b> method should call <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfsourceresolver-endcreateobjectfrombytestream">IMFSourceResolver::EndCreateObjectFromByteStream</a> to get a pointer to the media source.
     * @param {IMFByteStream} pByteStream A pointer to the byte stream's <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfbytestream">IMFByteStream</a> interface.
     * @param {PWSTR} pwszURL A null-terminated string that contains the original URL of the byte stream. This parameter can be <b>NULL</b>.
     * @param {Integer} dwFlags A bitwise <b>OR</b> of one or more flags. See <a href="https://docs.microsoft.com/windows/desktop/medfound/source-resolver-flags">Source Resolver Flags</a>.
     * @param {IPropertyStore} pProps A pointer to the <b>IPropertyStore</b> interface of a property store. The method passes the property store to the byte-stream handler. The byte-stream handler can use the property store to configure the media source. This parameter can be <b>NULL</b>. For more information, see <a href="https://docs.microsoft.com/windows/desktop/medfound/configuring-a-media-source">Configuring a Media Source</a>.
     * @param {IMFAsyncCallback} pCallback A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfasynccallback">IMFAsyncCallback</a> interface of a callback object. The caller must implement this interface.
     * @param {IUnknown} punkState A pointer to the <b>IUnknown</b> interface of a state object, defined by the caller. This parameter can be <b>NULL</b>. You can use this object to hold state information. The object is returned to the caller when the callback is invoked.
     * @returns {IUnknown} Receives an <b>IUnknown</b> pointer or the value <b>NULL</b>. If the value is not <b>NULL</b>, you can cancel the asynchronous operation by passing this pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfsourceresolver-cancelobjectcreation">IMFSourceResolver::CancelObjectCreation</a> method. The caller must release the interface. This parameter can be <b>NULL</b>.
     * @see https://learn.microsoft.com/windows/win32/api//content/mfidl/nf-mfidl-imfsourceresolver-begincreateobjectfrombytestream
     */
    BeginCreateObjectFromByteStream(pByteStream, pwszURL, dwFlags, pProps, pCallback, punkState) {
        pwszURL := pwszURL is String ? StrPtr(pwszURL) : pwszURL

        result := ComCall(7, this, "ptr", pByteStream, "ptr", pwszURL, "uint", dwFlags, "ptr", pProps, "ptr*", &ppIUnknownCancelCookie := 0, "ptr", pCallback, "ptr", punkState, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IUnknown(ppIUnknownCancelCookie)
    }

    /**
     * Completes an asynchronous request to create a media source from a byte stream.
     * @remarks
     * Call this method from inside your application's <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfasynccallback-invoke">IMFAsyncCallback::Invoke</a> method.
     * @param {IMFAsyncResult} pResult Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfasyncresult">IMFAsyncResult</a> interface. Pass in the same pointer that your callback object received in the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfasynccallback-invoke">Invoke</a> method.
     * @param {Pointer<Integer>} pObjectType Receives a member of the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/ne-mfidl-mf_object_type">MF_OBJECT_TYPE</a> enumeration, specifying the type of object that was created.
     * @param {Pointer<IUnknown>} ppObject Receives a pointer to the media source's <b>IUnknown</b> interface. The caller must release the interface.
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
     * The application canceled the operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/mfidl/nf-mfidl-imfsourceresolver-endcreateobjectfrombytestream
     */
    EndCreateObjectFromByteStream(pResult, pObjectType, ppObject) {
        pObjectTypeMarshal := pObjectType is VarRef ? "int*" : "ptr"

        result := ComCall(8, this, "ptr", pResult, pObjectTypeMarshal, pObjectType, "ptr*", ppObject, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Cancels an asynchronous request to create an object.
     * @remarks
     * You can use this method to cancel a previous call to <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfsourceresolver-begincreateobjectfrombytestream">BeginCreateObjectFromByteStream</a> or <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfsourceresolver-begincreateobjectfromurl">BeginCreateObjectFromURL</a>. Because these methods are asynchronous, however, they might be completed before the operation can be canceled. Therefore, your callback might still be invoked after you call this method.
     *       
     * 
     * <div class="alert"><b>Note</b>  This method cannot be called remotely.</div>
     * <div> </div>
     * @param {IUnknown} pIUnknownCancelCookie Pointer to the <b>IUnknown</b> interface that was returned in the <i>ppIUnknownCancelCookie</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfsourceresolver-begincreateobjectfrombytestream">IMFSourceResolver::BeginCreateObjectFromByteStream</a> or <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfsourceresolver-begincreateobjectfromurl">IMFSourceResolver::BeginCreateObjectFromURL</a> method.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/mfidl/nf-mfidl-imfsourceresolver-cancelobjectcreation
     */
    CancelObjectCreation(pIUnknownCancelCookie) {
        result := ComCall(9, this, "ptr", pIUnknownCancelCookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
