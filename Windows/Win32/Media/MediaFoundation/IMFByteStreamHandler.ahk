#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Creates a media source from a byte stream.
 * @remarks
 * 
  * Applications do not use this interface directly. This interface is exposed by byte-stream handlers, which are used by the source resolver. When the byte-stream handler is given a byte stream, it parses the stream and creates a media source. Byte-stream handlers are registered by file name extension or MIME type.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/nn-mfidl-imfbytestreamhandler
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFByteStreamHandler extends IUnknown{
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
    BeginCreateObject(pByteStream, pwszURL, dwFlags, pProps, ppIUnknownCancelCookie, pCallback, punkState) {
        pwszURL := pwszURL is String ? StrPtr(pwszURL) : pwszURL

        result := ComCall(3, this, "ptr", pByteStream, "ptr", pwszURL, "uint", dwFlags, "ptr", pProps, "ptr", ppIUnknownCancelCookie, "ptr", pCallback, "ptr", punkState, "int")
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
    EndCreateObject(pResult, pObjectType, ppObject) {
        result := ComCall(4, this, "ptr", pResult, "int*", pObjectType, "ptr", ppObject, "int")
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
        result := ComCall(5, this, "ptr", pIUnknownCancelCookie, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt64>} pqwBytes 
     * @returns {HRESULT} 
     */
    GetMaxNumberOfBytesRequiredForResolution(pqwBytes) {
        result := ComCall(6, this, "uint*", pqwBytes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
