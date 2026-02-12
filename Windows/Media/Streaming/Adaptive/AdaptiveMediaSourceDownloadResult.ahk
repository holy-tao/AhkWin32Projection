#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAdaptiveMediaSourceDownloadResult.ahk
#Include .\IAdaptiveMediaSourceDownloadResult2.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents the results of a resource download operation.
 * @remarks
 * Obtain an instance of this class from the [Result](adaptivemediasourcedownloadrequestedeventargs_result.md) property of the [AdaptiveMediaSourceDownloadRequestedEventArgs](adaptivemediasourcedownloadrequestedeventargs.md) object passed to the handler for the [DownloadRequested](adaptivemediasource_downloadrequested.md) event.
 * @see https://learn.microsoft.com/uwp/api/windows.media.streaming.adaptive.adaptivemediasourcedownloadresult
 * @namespace Windows.Media.Streaming.Adaptive
 * @version WindowsRuntime 1.4
 */
class AdaptiveMediaSourceDownloadResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAdaptiveMediaSourceDownloadResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAdaptiveMediaSourceDownloadResult.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the Uniform Resource Identifier (URI) of the downloaded resource.
     * @see https://learn.microsoft.com/uwp/api/windows.media.streaming.adaptive.adaptivemediasourcedownloadresult.resourceuri
     * @type {Uri} 
     */
    ResourceUri {
        get => this.get_ResourceUri()
        set => this.put_ResourceUri(value)
    }

    /**
     * Gets or sets an input stream containing the downloaded resource.
     * @see https://learn.microsoft.com/uwp/api/windows.media.streaming.adaptive.adaptivemediasourcedownloadresult.inputstream
     * @type {IInputStream} 
     */
    InputStream {
        get => this.get_InputStream()
        set => this.put_InputStream(value)
    }

    /**
     * Gets or sets a buffer containing the downloaded resource.
     * @see https://learn.microsoft.com/uwp/api/windows.media.streaming.adaptive.adaptivemediasourcedownloadresult.buffer
     * @type {IBuffer} 
     */
    Buffer {
        get => this.get_Buffer()
        set => this.put_Buffer(value)
    }

    /**
     * Gets or sets a string that identifies the MIME content type of the downloaded resource.
     * @see https://learn.microsoft.com/uwp/api/windows.media.streaming.adaptive.adaptivemediasourcedownloadresult.contenttype
     * @type {HSTRING} 
     */
    ContentType {
        get => this.get_ContentType()
        set => this.put_ContentType(value)
    }

    /**
     * Gets or sets an integer value that represents extended status information about the resource download operation.
     * @see https://learn.microsoft.com/uwp/api/windows.media.streaming.adaptive.adaptivemediasourcedownloadresult.extendedstatus
     * @type {Integer} 
     */
    ExtendedStatus {
        get => this.get_ExtendedStatus()
        set => this.put_ExtendedStatus(value)
    }

    /**
     * Gets or sets the requested byte range offset of the resource to be downloaded.
     * @remarks
     * If a non-null, non-zero value is specified for the [ResourceByteRangeLength](adaptivemediasourcedownloadresult_resourcebyterangelength.md) property, the value of **ResourceByteRangeOffset** is used to issue a byte range request to the Http server hosting the resource.
     * @see https://learn.microsoft.com/uwp/api/windows.media.streaming.adaptive.adaptivemediasourcedownloadresult.resourcebyterangeoffset
     * @type {IReference<Integer>} 
     */
    ResourceByteRangeOffset {
        get => this.get_ResourceByteRangeOffset()
        set => this.put_ResourceByteRangeOffset(value)
    }

    /**
     * Gets or sets the requested byte range of the resource to be downloaded.
     * @remarks
     * If this value is set to null, no byte range request is issued and the entire resource will be downloaded. Setting the byte range length to zero is not allowed. If a non-null, non-zero value is specified, then the system will use the value, along with any value specified for the [ResourceByteRangeOffset](adaptivemediasourcedownloadresult_resourcebyterangeoffset.md) property, to issue a byte range request to the Http server hosting the resource.
     * @see https://learn.microsoft.com/uwp/api/windows.media.streaming.adaptive.adaptivemediasourcedownloadresult.resourcebyterangelength
     * @type {IReference<Integer>} 
     */
    ResourceByteRangeLength {
        get => this.get_ResourceByteRangeLength()
        set => this.put_ResourceByteRangeLength(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_ResourceUri() {
        if (!this.HasProp("__IAdaptiveMediaSourceDownloadResult")) {
            if ((queryResult := this.QueryInterface(IAdaptiveMediaSourceDownloadResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdaptiveMediaSourceDownloadResult := IAdaptiveMediaSourceDownloadResult(outPtr)
        }

        return this.__IAdaptiveMediaSourceDownloadResult.get_ResourceUri()
    }

    /**
     * 
     * @param {Uri} value 
     * @returns {HRESULT} 
     */
    put_ResourceUri(value) {
        if (!this.HasProp("__IAdaptiveMediaSourceDownloadResult")) {
            if ((queryResult := this.QueryInterface(IAdaptiveMediaSourceDownloadResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdaptiveMediaSourceDownloadResult := IAdaptiveMediaSourceDownloadResult(outPtr)
        }

        return this.__IAdaptiveMediaSourceDownloadResult.put_ResourceUri(value)
    }

    /**
     * 
     * @returns {IInputStream} 
     */
    get_InputStream() {
        if (!this.HasProp("__IAdaptiveMediaSourceDownloadResult")) {
            if ((queryResult := this.QueryInterface(IAdaptiveMediaSourceDownloadResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdaptiveMediaSourceDownloadResult := IAdaptiveMediaSourceDownloadResult(outPtr)
        }

        return this.__IAdaptiveMediaSourceDownloadResult.get_InputStream()
    }

    /**
     * 
     * @param {IInputStream} value 
     * @returns {HRESULT} 
     */
    put_InputStream(value) {
        if (!this.HasProp("__IAdaptiveMediaSourceDownloadResult")) {
            if ((queryResult := this.QueryInterface(IAdaptiveMediaSourceDownloadResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdaptiveMediaSourceDownloadResult := IAdaptiveMediaSourceDownloadResult(outPtr)
        }

        return this.__IAdaptiveMediaSourceDownloadResult.put_InputStream(value)
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    get_Buffer() {
        if (!this.HasProp("__IAdaptiveMediaSourceDownloadResult")) {
            if ((queryResult := this.QueryInterface(IAdaptiveMediaSourceDownloadResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdaptiveMediaSourceDownloadResult := IAdaptiveMediaSourceDownloadResult(outPtr)
        }

        return this.__IAdaptiveMediaSourceDownloadResult.get_Buffer()
    }

    /**
     * 
     * @param {IBuffer} value 
     * @returns {HRESULT} 
     */
    put_Buffer(value) {
        if (!this.HasProp("__IAdaptiveMediaSourceDownloadResult")) {
            if ((queryResult := this.QueryInterface(IAdaptiveMediaSourceDownloadResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdaptiveMediaSourceDownloadResult := IAdaptiveMediaSourceDownloadResult(outPtr)
        }

        return this.__IAdaptiveMediaSourceDownloadResult.put_Buffer(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ContentType() {
        if (!this.HasProp("__IAdaptiveMediaSourceDownloadResult")) {
            if ((queryResult := this.QueryInterface(IAdaptiveMediaSourceDownloadResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdaptiveMediaSourceDownloadResult := IAdaptiveMediaSourceDownloadResult(outPtr)
        }

        return this.__IAdaptiveMediaSourceDownloadResult.get_ContentType()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_ContentType(value) {
        if (!this.HasProp("__IAdaptiveMediaSourceDownloadResult")) {
            if ((queryResult := this.QueryInterface(IAdaptiveMediaSourceDownloadResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdaptiveMediaSourceDownloadResult := IAdaptiveMediaSourceDownloadResult(outPtr)
        }

        return this.__IAdaptiveMediaSourceDownloadResult.put_ContentType(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ExtendedStatus() {
        if (!this.HasProp("__IAdaptiveMediaSourceDownloadResult")) {
            if ((queryResult := this.QueryInterface(IAdaptiveMediaSourceDownloadResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdaptiveMediaSourceDownloadResult := IAdaptiveMediaSourceDownloadResult(outPtr)
        }

        return this.__IAdaptiveMediaSourceDownloadResult.get_ExtendedStatus()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ExtendedStatus(value) {
        if (!this.HasProp("__IAdaptiveMediaSourceDownloadResult")) {
            if ((queryResult := this.QueryInterface(IAdaptiveMediaSourceDownloadResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdaptiveMediaSourceDownloadResult := IAdaptiveMediaSourceDownloadResult(outPtr)
        }

        return this.__IAdaptiveMediaSourceDownloadResult.put_ExtendedStatus(value)
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_ResourceByteRangeOffset() {
        if (!this.HasProp("__IAdaptiveMediaSourceDownloadResult2")) {
            if ((queryResult := this.QueryInterface(IAdaptiveMediaSourceDownloadResult2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdaptiveMediaSourceDownloadResult2 := IAdaptiveMediaSourceDownloadResult2(outPtr)
        }

        return this.__IAdaptiveMediaSourceDownloadResult2.get_ResourceByteRangeOffset()
    }

    /**
     * 
     * @param {IReference<Integer>} value 
     * @returns {HRESULT} 
     */
    put_ResourceByteRangeOffset(value) {
        if (!this.HasProp("__IAdaptiveMediaSourceDownloadResult2")) {
            if ((queryResult := this.QueryInterface(IAdaptiveMediaSourceDownloadResult2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdaptiveMediaSourceDownloadResult2 := IAdaptiveMediaSourceDownloadResult2(outPtr)
        }

        return this.__IAdaptiveMediaSourceDownloadResult2.put_ResourceByteRangeOffset(value)
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_ResourceByteRangeLength() {
        if (!this.HasProp("__IAdaptiveMediaSourceDownloadResult2")) {
            if ((queryResult := this.QueryInterface(IAdaptiveMediaSourceDownloadResult2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdaptiveMediaSourceDownloadResult2 := IAdaptiveMediaSourceDownloadResult2(outPtr)
        }

        return this.__IAdaptiveMediaSourceDownloadResult2.get_ResourceByteRangeLength()
    }

    /**
     * 
     * @param {IReference<Integer>} value 
     * @returns {HRESULT} 
     */
    put_ResourceByteRangeLength(value) {
        if (!this.HasProp("__IAdaptiveMediaSourceDownloadResult2")) {
            if ((queryResult := this.QueryInterface(IAdaptiveMediaSourceDownloadResult2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdaptiveMediaSourceDownloadResult2 := IAdaptiveMediaSourceDownloadResult2(outPtr)
        }

        return this.__IAdaptiveMediaSourceDownloadResult2.put_ResourceByteRangeLength(value)
    }

;@endregion Instance Methods
}
