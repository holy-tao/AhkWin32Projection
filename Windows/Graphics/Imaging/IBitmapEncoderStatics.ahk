#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include .\BitmapCodecInformation.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\BitmapEncoder.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Graphics.Imaging
 * @version WindowsRuntime 1.4
 */
class IBitmapEncoderStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBitmapEncoderStatics
     * @type {Guid}
     */
    static IID => Guid("{a74356a7-a4e4-4eb9-8e40-564de7e1ccb2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_BmpEncoderId", "get_JpegEncoderId", "get_PngEncoderId", "get_TiffEncoderId", "get_GifEncoderId", "get_JpegXREncoderId", "GetEncoderInformationEnumerator", "CreateAsync", "CreateWithEncodingOptionsAsync", "CreateForTranscodingAsync", "CreateForInPlacePropertyEncodingAsync"]

    /**
     * @type {Guid} 
     */
    BmpEncoderId {
        get => this.get_BmpEncoderId()
    }

    /**
     * @type {Guid} 
     */
    JpegEncoderId {
        get => this.get_JpegEncoderId()
    }

    /**
     * @type {Guid} 
     */
    PngEncoderId {
        get => this.get_PngEncoderId()
    }

    /**
     * @type {Guid} 
     */
    TiffEncoderId {
        get => this.get_TiffEncoderId()
    }

    /**
     * @type {Guid} 
     */
    GifEncoderId {
        get => this.get_GifEncoderId()
    }

    /**
     * @type {Guid} 
     */
    JpegXREncoderId {
        get => this.get_JpegXREncoderId()
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_BmpEncoderId() {
        value := Guid()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_JpegEncoderId() {
        value := Guid()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_PngEncoderId() {
        value := Guid()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_TiffEncoderId() {
        value := Guid()
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_GifEncoderId() {
        value := Guid()
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_JpegXREncoderId() {
        value := Guid()
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IVectorView<BitmapCodecInformation>} 
     */
    GetEncoderInformationEnumerator() {
        result := ComCall(12, this, "ptr*", &encoderInformationEnumerator := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(BitmapCodecInformation, encoderInformationEnumerator)
    }

    /**
     * Creates an asynchronous bind context for use with asynchronous monikers.
     * @remarks
     * This function automatically registers the <a href="https://docs.microsoft.com/previous-versions/windows/internet-explorer/ie-developer/platform-apis/ms775060(v=vs.85)">IBindStatusCallback</a> and <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ienumformatetc">IEnumFORMATETC</a> interfaces with the bind context. The client can specify flags from BSCO_OPTION to indicate which callback notifications the client is capable of receiving. If the client does not wish to receive certain notification, it can choose to implement those callback methods as empty function stubs (returning E_NOTIMPL), and they should not be called.
     * 
     * The <a href="https://docs.microsoft.com/previous-versions/windows/internet-explorer/ie-developer/platform-apis/ms775115(v=vs.85)">RegisterBindStatusCallback</a> function can also be used to register callback interfaces in the bind context.
     * @param {Guid} encoderId 
     * @param {IRandomAccessStream} stream 
     * @returns {IAsyncOperation<BitmapEncoder>} 
     * @see https://learn.microsoft.com/windows/win32/api//content/urlmon/nf-urlmon-createasyncbindctx
     */
    CreateAsync(encoderId, stream) {
        result := ComCall(13, this, "ptr", encoderId, "ptr", stream, "ptr*", &asyncInfo := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(BitmapEncoder, asyncInfo)
    }

    /**
     * Creates an asynchronous bind context for use with asynchronous monikers.
     * @remarks
     * This function automatically registers the <a href="https://docs.microsoft.com/previous-versions/windows/internet-explorer/ie-developer/platform-apis/ms775060(v=vs.85)">IBindStatusCallback</a> and <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ienumformatetc">IEnumFORMATETC</a> interfaces with the bind context. The client can specify flags from BSCO_OPTION to indicate which callback notifications the client is capable of receiving. If the client does not wish to receive certain notification, it can choose to implement those callback methods as empty function stubs (returning E_NOTIMPL), and they should not be called.
     * 
     * The <a href="https://docs.microsoft.com/previous-versions/windows/internet-explorer/ie-developer/platform-apis/ms775115(v=vs.85)">RegisterBindStatusCallback</a> function can also be used to register callback interfaces in the bind context.
     * @param {Guid} encoderId 
     * @param {IRandomAccessStream} stream 
     * @param {IIterable<IKeyValuePair<HSTRING, BitmapTypedValue>>} encodingOptions 
     * @returns {IAsyncOperation<BitmapEncoder>} 
     * @see https://learn.microsoft.com/windows/win32/api//content/urlmon/nf-urlmon-createasyncbindctx
     */
    CreateWithEncodingOptionsAsync(encoderId, stream, encodingOptions) {
        result := ComCall(14, this, "ptr", encoderId, "ptr", stream, "ptr", encodingOptions, "ptr*", &asyncInfo := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(BitmapEncoder, asyncInfo)
    }

    /**
     * 
     * @param {IRandomAccessStream} stream 
     * @param {BitmapDecoder} bitmapDecoder_ 
     * @returns {IAsyncOperation<BitmapEncoder>} 
     */
    CreateForTranscodingAsync(stream, bitmapDecoder_) {
        result := ComCall(15, this, "ptr", stream, "ptr", bitmapDecoder_, "ptr*", &asyncInfo := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(BitmapEncoder, asyncInfo)
    }

    /**
     * 
     * @param {BitmapDecoder} bitmapDecoder_ 
     * @returns {IAsyncOperation<BitmapEncoder>} 
     */
    CreateForInPlacePropertyEncodingAsync(bitmapDecoder_) {
        result := ComCall(16, this, "ptr", bitmapDecoder_, "ptr*", &asyncInfo := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(BitmapEncoder, asyncInfo)
    }
}
