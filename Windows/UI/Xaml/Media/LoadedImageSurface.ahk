#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ILoadedImageSurface.ahk
#Include ..\..\..\Foundation\IClosable.ahk
#Include .\ILoadedImageSurfaceStatics.ahk
#Include ..\..\..\Foundation\TypedEventHandler.ahk
#Include .\LoadedImageSurface.ahk
#Include .\LoadedImageSourceLoadCompletedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\..\WinRTEventHandler.ahk

/**
 * Represents a composition surface that an image can be downloaded, decoded and loaded onto. You can load an image using a Uniform Resource Identifier (URI) that references an image source file, or supplying a [IRandomAccessStream](../windows.storage.streams/irandomaccessstream.md).
 * @remarks
 * A **LoadedImageSurface** can be sourced from these image file formats:
 * 
 * * Joint Photographic Experts Group (JPEG)
 * * Portable Network Graphics (PNG)
 * * Bitmap (BMP)
 * * Graphics Interchange Format (GIF)
 * * Tagged Image File Format (TIFF)
 * * JPEG XR
 * * Icons (ICO)
 * 
 * > [!NOTE] **LoadedImageSurface** does not support animated GIF images, so only the first frame of an animated GIF will be shown.
 * 
 * If the image source is a stream, that stream is expected to contain an image file in one of these formats.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.loadedimagesurface
 * @namespace Windows.UI.Xaml.Media
 * @version WindowsRuntime 1.4
 */
class LoadedImageSurface extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ILoadedImageSurface

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ILoadedImageSurface.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Loads an image into a [LoadedImageSurface](loadedimagesurface.md) from the provided Uniform Resource Identifier (URI) at the natural size defined in the image source.
     * @param {Uri} uri_ The URI from which the image is loaded.
     * @param {SIZE} desiredMaxSize 
     * @returns {LoadedImageSurface} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.loadedimagesurface.startloadfromuri
     */
    static StartLoadFromUriWithSize(uri_, desiredMaxSize) {
        if (!LoadedImageSurface.HasProp("__ILoadedImageSurfaceStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.LoadedImageSurface")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ILoadedImageSurfaceStatics.IID)
            LoadedImageSurface.__ILoadedImageSurfaceStatics := ILoadedImageSurfaceStatics(factoryPtr)
        }

        return LoadedImageSurface.__ILoadedImageSurfaceStatics.StartLoadFromUriWithSize(uri_, desiredMaxSize)
    }

    /**
     * Loads an image into a [LoadedImageSurface](loadedimagesurface.md) from the provided Uniform Resource Identifier (URI) with the desired maximum size.
     * @remarks
     * By default, [LoadedImageSurface](loadedimagesurface.md) will fill up as much of the **desiredMaxSize** as possible while preserving the aspect ratio and image content
     * of the incoming source. This may result in a decodedsize that differs from the input **desiredMaxSize**
     * @param {Uri} uri_ The URI from which the image is loaded.
     * @returns {LoadedImageSurface} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.loadedimagesurface.startloadfromuri
     */
    static StartLoadFromUri(uri_) {
        if (!LoadedImageSurface.HasProp("__ILoadedImageSurfaceStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.LoadedImageSurface")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ILoadedImageSurfaceStatics.IID)
            LoadedImageSurface.__ILoadedImageSurfaceStatics := ILoadedImageSurfaceStatics(factoryPtr)
        }

        return LoadedImageSurface.__ILoadedImageSurfaceStatics.StartLoadFromUri1(uri_)
    }

    /**
     * Loads an image onto a [LoadedImageSurface](loadedimagesurface.md) from the provided [IRandomAccessStream](../windows.storage.streams/irandomaccessstream.md) at the natural size
     * defined in the image source.
     * @param {IRandomAccessStream} stream The stream from which the image is loaded.
     * @param {SIZE} desiredMaxSize 
     * @returns {LoadedImageSurface} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.loadedimagesurface.startloadfromstream
     */
    static StartLoadFromStreamWithSize(stream, desiredMaxSize) {
        if (!LoadedImageSurface.HasProp("__ILoadedImageSurfaceStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.LoadedImageSurface")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ILoadedImageSurfaceStatics.IID)
            LoadedImageSurface.__ILoadedImageSurfaceStatics := ILoadedImageSurfaceStatics(factoryPtr)
        }

        return LoadedImageSurface.__ILoadedImageSurfaceStatics.StartLoadFromStreamWithSize(stream, desiredMaxSize)
    }

    /**
     * Loads an image into a [LoadedImageSurface](loadedimagesurface.md) from the provided [IRandomAccessStream](../windows.storage.streams/irandomaccessstream.md) with the desired maximum size.
     * @remarks
     * By default, [LoadedImageSurface](loadedimagesurface.md) will fill up as much of the **desiredMaxSize** as possible while preserving the aspect ratio and image content
     * of the incoming source. This may result in a decodedsize that differs from the input **desiredMaxSize**
     * @param {IRandomAccessStream} stream The stream from which the image is loaded.
     * @returns {LoadedImageSurface} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.loadedimagesurface.startloadfromstream
     */
    static StartLoadFromStream(stream) {
        if (!LoadedImageSurface.HasProp("__ILoadedImageSurfaceStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.LoadedImageSurface")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ILoadedImageSurfaceStatics.IID)
            LoadedImageSurface.__ILoadedImageSurfaceStatics := ILoadedImageSurfaceStatics(factoryPtr)
        }

        return LoadedImageSurface.__ILoadedImageSurfaceStatics.StartLoadFromStream1(stream)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the size of the decoded image in physical pixels.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.loadedimagesurface.decodedphysicalsize
     * @type {SIZE} 
     */
    DecodedPhysicalSize {
        get => this.get_DecodedPhysicalSize()
    }

    /**
     * Gets the size of the decoded image in device independent pixels.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.loadedimagesurface.decodedsize
     * @type {SIZE} 
     */
    DecodedSize {
        get => this.get_DecodedSize()
    }

    /**
     * Gets the natural size of the image in physical pixels, which is defined in the original image source.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.loadedimagesurface.naturalsize
     * @type {SIZE} 
     */
    NaturalSize {
        get => this.get_NaturalSize()
    }

    /**
     * Occurs when the image has been downloaded, decoded and loaded to the underlying [ICompositionSurface](../windows.ui.composition/icompositionsurface.md).
     * @remarks
     * The [LoadedImageSurface](loadedimagesurface.md) instance will not have a loaded image or sizing information, until this 
     * event fires. The **LoadCompleted** event fires regardless of success or failure and the [LoadedImageSourceLoadCompletedEventArgs](loadedimagesourceloadcompletedeventargs.md)
     * can be used to determine the status.
     * 
     * The **LoadCompleted** event fires every time that the surface of an instance of **LoadedImageSurface** gets populated with an image. This includes:
     * 
     * * The first time that a **LoadedImageSurface** is initialized
     * * The device recovers from a lost state
     * * A DPI change causes a different image source to load
     * * The app recovers from a low memory state
     * 
     * Common uses of the **LoadCompleted** event are to put up a temporary image if the image source may take a long time to load or resize a visual exactly to the decoded
     * size of the **LoadedImageSurface**.
     * @type {TypedEventHandler<LoadedImageSurface, LoadedImageSourceLoadCompletedEventArgs>}
    */
    OnLoadCompleted {
        get {
            if(!this.HasProp("__OnLoadCompleted")){
                this.__OnLoadCompleted := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{0aa0c46e-1db6-5850-ae17-ec310ea3fd2d}"),
                    LoadedImageSurface,
                    LoadedImageSourceLoadCompletedEventArgs
                )
                this.__OnLoadCompletedToken := this.add_LoadCompleted(this.__OnLoadCompleted.iface)
            }
            return this.__OnLoadCompleted
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnLoadCompletedToken")) {
            this.remove_LoadCompleted(this.__OnLoadCompletedToken)
            this.__OnLoadCompleted.iface.Dispose()
        }

        this.Close()

        super.__Delete()
    }

    /**
     * 
     * @returns {SIZE} 
     */
    get_DecodedPhysicalSize() {
        if (!this.HasProp("__ILoadedImageSurface")) {
            if ((queryResult := this.QueryInterface(ILoadedImageSurface.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILoadedImageSurface := ILoadedImageSurface(outPtr)
        }

        return this.__ILoadedImageSurface.get_DecodedPhysicalSize()
    }

    /**
     * 
     * @returns {SIZE} 
     */
    get_DecodedSize() {
        if (!this.HasProp("__ILoadedImageSurface")) {
            if ((queryResult := this.QueryInterface(ILoadedImageSurface.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILoadedImageSurface := ILoadedImageSurface(outPtr)
        }

        return this.__ILoadedImageSurface.get_DecodedSize()
    }

    /**
     * 
     * @returns {SIZE} 
     */
    get_NaturalSize() {
        if (!this.HasProp("__ILoadedImageSurface")) {
            if ((queryResult := this.QueryInterface(ILoadedImageSurface.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILoadedImageSurface := ILoadedImageSurface(outPtr)
        }

        return this.__ILoadedImageSurface.get_NaturalSize()
    }

    /**
     * 
     * @param {TypedEventHandler<LoadedImageSurface, LoadedImageSourceLoadCompletedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_LoadCompleted(handler) {
        if (!this.HasProp("__ILoadedImageSurface")) {
            if ((queryResult := this.QueryInterface(ILoadedImageSurface.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILoadedImageSurface := ILoadedImageSurface(outPtr)
        }

        return this.__ILoadedImageSurface.add_LoadCompleted(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_LoadCompleted(token) {
        if (!this.HasProp("__ILoadedImageSurface")) {
            if ((queryResult := this.QueryInterface(ILoadedImageSurface.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILoadedImageSurface := ILoadedImageSurface(outPtr)
        }

        return this.__ILoadedImageSurface.remove_LoadCompleted(token)
    }

    /**
     * Disposes of the [LoadedImageSurface](loadedimagesurface.md) and associated resources.
     * @remarks
     * Calling this method will dispose the [LoadedImageSurface](loadedimagesurface.md) reference, however any brushes or surfaces created from the **LoadedImageSurface** that still have active references will 
     * continue to render unless you explicitly dispose of those as well.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.loadedimagesurface.close
     */
    Close() {
        if (!this.HasProp("__IClosable")) {
            if ((queryResult := this.QueryInterface(IClosable.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClosable := IClosable(outPtr)
        }

        return this.__IClosable.Close()
    }

;@endregion Instance Methods
}
