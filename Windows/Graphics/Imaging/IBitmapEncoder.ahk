#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\BitmapCodecInformation.ahk
#Include .\BitmapProperties.ahk
#Include .\BitmapTransform.ahk
#Include ..\..\Foundation\IAsyncAction.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Graphics.Imaging
 * @version WindowsRuntime 1.4
 */
class IBitmapEncoder extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBitmapEncoder
     * @type {Guid}
     */
    static IID => Guid("{2bc468e3-e1f8-4b54-95e8-32919551ce62}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_EncoderInformation", "get_BitmapProperties", "get_BitmapContainerProperties", "get_IsThumbnailGenerated", "put_IsThumbnailGenerated", "get_GeneratedThumbnailWidth", "put_GeneratedThumbnailWidth", "get_GeneratedThumbnailHeight", "put_GeneratedThumbnailHeight", "get_BitmapTransform", "SetPixelData", "GoToNextFrameAsync", "GoToNextFrameWithEncodingOptionsAsync", "FlushAsync"]

    /**
     * @type {BitmapCodecInformation} 
     */
    EncoderInformation {
        get => this.get_EncoderInformation()
    }

    /**
     * @type {BitmapProperties} 
     */
    BitmapProperties {
        get => this.get_BitmapProperties()
    }

    /**
     * @type {BitmapProperties} 
     */
    BitmapContainerProperties {
        get => this.get_BitmapContainerProperties()
    }

    /**
     * @type {Boolean} 
     */
    IsThumbnailGenerated {
        get => this.get_IsThumbnailGenerated()
        set => this.put_IsThumbnailGenerated(value)
    }

    /**
     * @type {Integer} 
     */
    GeneratedThumbnailWidth {
        get => this.get_GeneratedThumbnailWidth()
        set => this.put_GeneratedThumbnailWidth(value)
    }

    /**
     * @type {Integer} 
     */
    GeneratedThumbnailHeight {
        get => this.get_GeneratedThumbnailHeight()
        set => this.put_GeneratedThumbnailHeight(value)
    }

    /**
     * @type {BitmapTransform} 
     */
    BitmapTransform {
        get => this.get_BitmapTransform()
    }

    /**
     * 
     * @returns {BitmapCodecInformation} 
     */
    get_EncoderInformation() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return BitmapCodecInformation(value)
    }

    /**
     * 
     * @returns {BitmapProperties} 
     */
    get_BitmapProperties() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return BitmapProperties(value)
    }

    /**
     * 
     * @returns {BitmapProperties} 
     */
    get_BitmapContainerProperties() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return BitmapProperties(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsThumbnailGenerated() {
        result := ComCall(9, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsThumbnailGenerated(value) {
        result := ComCall(10, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_GeneratedThumbnailWidth() {
        result := ComCall(11, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_GeneratedThumbnailWidth(value) {
        result := ComCall(12, this, "uint", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_GeneratedThumbnailHeight() {
        result := ComCall(13, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_GeneratedThumbnailHeight(value) {
        result := ComCall(14, this, "uint", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {BitmapTransform} 
     */
    get_BitmapTransform() {
        result := ComCall(15, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return BitmapTransform(value)
    }

    /**
     * 
     * @param {Integer} pixelFormat 
     * @param {Integer} alphaMode 
     * @param {Integer} width 
     * @param {Integer} height 
     * @param {Float} dpiX 
     * @param {Float} dpiY 
     * @param {Integer} pixels_length 
     * @param {Pointer<Integer>} pixels 
     * @returns {HRESULT} 
     */
    SetPixelData(pixelFormat, alphaMode, width, height, dpiX, dpiY, pixels_length, pixels) {
        pixelsMarshal := pixels is VarRef ? "char*" : "ptr"

        result := ComCall(16, this, "int", pixelFormat, "int", alphaMode, "uint", width, "uint", height, "double", dpiX, "double", dpiY, "uint", pixels_length, pixelsMarshal, pixels, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IAsyncAction} 
     */
    GoToNextFrameAsync() {
        result := ComCall(17, this, "ptr*", &asyncInfo := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(asyncInfo)
    }

    /**
     * 
     * @param {IIterable<IKeyValuePair<HSTRING, BitmapTypedValue>>} encodingOptions 
     * @returns {IAsyncAction} 
     */
    GoToNextFrameWithEncodingOptionsAsync(encodingOptions) {
        result := ComCall(18, this, "ptr", encodingOptions, "ptr*", &asyncInfo := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(asyncInfo)
    }

    /**
     * 
     * @returns {IAsyncAction} 
     */
    FlushAsync() {
        result := ComCall(19, this, "ptr*", &asyncInfo := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(asyncInfo)
    }
}
