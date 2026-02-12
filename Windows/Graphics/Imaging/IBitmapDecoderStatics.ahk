#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include .\BitmapCodecInformation.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\BitmapDecoder.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Graphics.Imaging
 * @version WindowsRuntime 1.4
 */
class IBitmapDecoderStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBitmapDecoderStatics
     * @type {Guid}
     */
    static IID => Guid("{438ccb26-bcef-4e95-bad6-23a822e58d01}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_BmpDecoderId", "get_JpegDecoderId", "get_PngDecoderId", "get_TiffDecoderId", "get_GifDecoderId", "get_JpegXRDecoderId", "get_IcoDecoderId", "GetDecoderInformationEnumerator", "CreateAsync", "CreateWithIdAsync"]

    /**
     * @type {Guid} 
     */
    BmpDecoderId {
        get => this.get_BmpDecoderId()
    }

    /**
     * @type {Guid} 
     */
    JpegDecoderId {
        get => this.get_JpegDecoderId()
    }

    /**
     * @type {Guid} 
     */
    PngDecoderId {
        get => this.get_PngDecoderId()
    }

    /**
     * @type {Guid} 
     */
    TiffDecoderId {
        get => this.get_TiffDecoderId()
    }

    /**
     * @type {Guid} 
     */
    GifDecoderId {
        get => this.get_GifDecoderId()
    }

    /**
     * @type {Guid} 
     */
    JpegXRDecoderId {
        get => this.get_JpegXRDecoderId()
    }

    /**
     * @type {Guid} 
     */
    IcoDecoderId {
        get => this.get_IcoDecoderId()
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_BmpDecoderId() {
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
    get_JpegDecoderId() {
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
    get_PngDecoderId() {
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
    get_TiffDecoderId() {
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
    get_GifDecoderId() {
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
    get_JpegXRDecoderId() {
        value := Guid()
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_IcoDecoderId() {
        value := Guid()
        result := ComCall(12, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IVectorView<BitmapCodecInformation>} 
     */
    GetDecoderInformationEnumerator() {
        result := ComCall(13, this, "ptr*", &decoderInformationEnumerator := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(BitmapCodecInformation, decoderInformationEnumerator)
    }

    /**
     * Creates an asynchronous bind context for use with asynchronous monikers.
     * @remarks
     * This function automatically registers the <a href="https://docs.microsoft.com/previous-versions/windows/internet-explorer/ie-developer/platform-apis/ms775060(v=vs.85)">IBindStatusCallback</a> and <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ienumformatetc">IEnumFORMATETC</a> interfaces with the bind context. The client can specify flags from BSCO_OPTION to indicate which callback notifications the client is capable of receiving. If the client does not wish to receive certain notification, it can choose to implement those callback methods as empty function stubs (returning E_NOTIMPL), and they should not be called.
     * 
     * The <a href="https://docs.microsoft.com/previous-versions/windows/internet-explorer/ie-developer/platform-apis/ms775115(v=vs.85)">RegisterBindStatusCallback</a> function can also be used to register callback interfaces in the bind context.
     * @param {IRandomAccessStream} stream 
     * @returns {IAsyncOperation<BitmapDecoder>} 
     * @see https://learn.microsoft.com/windows/win32/api//content/urlmon/nf-urlmon-createasyncbindctx
     */
    CreateAsync(stream) {
        result := ComCall(14, this, "ptr", stream, "ptr*", &asyncInfo := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(BitmapDecoder, asyncInfo)
    }

    /**
     * Creates an asynchronous bind context for use with asynchronous monikers.
     * @remarks
     * This function automatically registers the <a href="https://docs.microsoft.com/previous-versions/windows/internet-explorer/ie-developer/platform-apis/ms775060(v=vs.85)">IBindStatusCallback</a> and <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ienumformatetc">IEnumFORMATETC</a> interfaces with the bind context. The client can specify flags from BSCO_OPTION to indicate which callback notifications the client is capable of receiving. If the client does not wish to receive certain notification, it can choose to implement those callback methods as empty function stubs (returning E_NOTIMPL), and they should not be called.
     * 
     * The <a href="https://docs.microsoft.com/previous-versions/windows/internet-explorer/ie-developer/platform-apis/ms775115(v=vs.85)">RegisterBindStatusCallback</a> function can also be used to register callback interfaces in the bind context.
     * @param {Guid} decoderId 
     * @param {IRandomAccessStream} stream 
     * @returns {IAsyncOperation<BitmapDecoder>} 
     * @see https://learn.microsoft.com/windows/win32/api//content/urlmon/nf-urlmon-createasyncbindctx
     */
    CreateWithIdAsync(decoderId, stream) {
        result := ComCall(15, this, "ptr", decoderId, "ptr", stream, "ptr*", &asyncInfo := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(BitmapDecoder, asyncInfo)
    }
}
