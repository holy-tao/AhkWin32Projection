#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Creates a media source from a byte stream.
 * @remarks
 * Applications do not use this interface directly. This interface is exposed by byte-stream handlers, which are used by the source resolver. When the byte-stream handler is given a byte stream, it parses the stream and creates a media source. Byte-stream handlers are registered by file name extension or MIME type.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nn-mfidl-imfbytestreamhandler
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFByteStreamHandler extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFByteStreamHandler
     * @type {Guid}
     */
    static IID => Guid("{bb420aa4-765b-4a1f-91fe-d6a8a143924c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["BeginCreateObject", "EndCreateObject", "CancelObjectCreation", "GetMaxNumberOfBytesRequiredForResolution"]

    /**
     * Begins an asynchronous request to create a media source from a byte stream. (IMFByteStreamHandler.BeginCreateObject)
     * @remarks
     * The <i>dwFlags</i> parameter must contain the MF_RESOLUTION_MEDIASOURCE flag and should not contain the MF_RESOLUTION_BYTESTREAM flag.
     * 
     * The byte-stream handler is responsible for parsing the stream and validating the contents. If the stream is not valid or the byte stream handler cannot parse the stream, the handler should return a failure code. The byte stream is not guaranteed to match the type of stream that the byte handler is designed to parse.
     * 
     * If the <i>pwszURL</i> parameter is not <b>NULL</b>, the byte-stream handler might use the URL during the resolution process. (For example, it might use the file name extension, if present.) Also, the byte stream might contain the <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-bytestream-content-type-attribute">MF_BYTESTREAM_CONTENT_TYPE</a> attribute, specifying the MIME type.
     * 
     * When the operation completes, the byte-stream handler calls the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfasynccallback-invoke">IMFAsyncCallback::Invoke</a> method. The <b>Invoke</b> method should call <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfbytestreamhandler-endcreateobject">IMFByteStreamHandler::EndCreateObject</a> to get a pointer to the media source.
     * @param {IMFByteStream} pByteStream Pointer to the byte stream's <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfbytestream">IMFByteStream</a> interface.
     * @param {PWSTR} pwszURL String that contains the original URL of the byte stream. This parameter can be <b>NULL</b>.
     * @param {Integer} dwFlags Bitwise OR of zero or more flags. See <a href="https://docs.microsoft.com/windows/desktop/medfound/source-resolver-flags">Source Resolver Flags</a>.
     * @param {IPropertyStore} pProps Pointer to the <b>IPropertyStore</b> interface of a property store. The byte-stream handler can use this property store to configure the object. This parameter can be <b>NULL</b>. For more information, see <a href="https://docs.microsoft.com/windows/desktop/medfound/configuring-a-media-source">Configuring a Media Source</a>.
     * @param {IMFAsyncCallback} pCallback Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfasynccallback">IMFAsyncCallback</a> interface of a callback object. The caller must implement this interface.
     * @param {IUnknown} punkState Pointer to the <b>IUnknown</b> interface of a state object, defined by the caller. This parameter can be <b>NULL</b>. You can use this object to hold state information. The object is returned to the caller when the callback is invoked.
     * @returns {IUnknown} Receives an <b>IUnknown</b> pointer or the value <b>NULL</b>. If the value is not <b>NULL</b>, you can cancel the asynchronous operation by passing this pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfbytestreamhandler-cancelobjectcreation">IMFByteStreamHandler::CancelObjectCreation</a> method. The caller must release the interface. This parameter can be <b>NULL</b>.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfbytestreamhandler-begincreateobject
     */
    BeginCreateObject(pByteStream, pwszURL, dwFlags, pProps, pCallback, punkState) {
        pwszURL := pwszURL is String ? StrPtr(pwszURL) : pwszURL

        result := ComCall(3, this, "ptr", pByteStream, "ptr", pwszURL, "uint", dwFlags, "ptr", pProps, "ptr*", &ppIUnknownCancelCookie := 0, "ptr", pCallback, "ptr", punkState, "HRESULT")
        return IUnknown(ppIUnknownCancelCookie)
    }

    /**
     * Completes an asynchronous request to create a media source.
     * @remarks
     * Call this method from inside the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfasynccallback-invoke">IMFAsyncCallback::Invoke</a> method.
     * @param {IMFAsyncResult} pResult Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfasyncresult">IMFAsyncResult</a> interface. Pass in the same pointer that your callback object received in the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfasynccallback-invoke">Invoke</a> method.
     * @param {Pointer<Integer>} pObjectType Receives a member of the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/ne-mfidl-mf_object_type">MF_OBJECT_TYPE</a> enumeration, specifying the type of object that was created.
     * @param {Pointer<IUnknown>} ppObject Receives a pointer to the <b>IUnknown</b> interface of the media source. The caller must release the interface.
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
     * The operation was canceled. See <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfbytestreamhandler-cancelobjectcreation">IMFByteStreamHandler::CancelObjectCreation</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_CANNOT_PARSE_BYTESTREAM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unable to parse the byte stream.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfbytestreamhandler-endcreateobject
     */
    EndCreateObject(pResult, pObjectType, ppObject) {
        pObjectTypeMarshal := pObjectType is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, "ptr", pResult, pObjectTypeMarshal, pObjectType, "ptr*", ppObject, "HRESULT")
        return result
    }

    /**
     * Cancels the current request to create a media source.
     * @remarks
     * You can use this method to cancel a previous call to <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfbytestreamhandler-begincreateobject">BeginCreateObject</a>. Because that method is asynchronous, however, it might be completed before the operation can be canceled. Therefore, your callback might still be invoked after you call this method.
     * @param {IUnknown} pIUnknownCancelCookie Pointer to the <b>IUnknown</b> interface that was returned in the <i>ppIUnknownCancelCookie</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfbytestreamhandler-begincreateobject">IMFByteStreamHandler::BeginCreateObject</a> method.
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
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfbytestreamhandler-cancelobjectcreation
     */
    CancelObjectCreation(pIUnknownCancelCookie) {
        result := ComCall(5, this, "ptr", pIUnknownCancelCookie, "HRESULT")
        return result
    }

    /**
     * Retrieves the maximum number of bytes needed to create the media source or determine that the byte stream handler cannot parse this stream.
     * @returns {Integer} Receives the maximum number of bytes that are required.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfbytestreamhandler-getmaxnumberofbytesrequiredforresolution
     */
    GetMaxNumberOfBytesRequiredForResolution() {
        result := ComCall(6, this, "uint*", &pqwBytes := 0, "HRESULT")
        return pqwBytes
    }
}
