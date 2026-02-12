#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPerceptionVideoFrameAllocator.ahk
#Include ..\..\..\Foundation\IClosable.ahk
#Include .\IPerceptionVideoFrameAllocatorFactory.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * An allocator that can create PerceptionFrames directly which can be written into or copied from Windows::Media::VideoFrame into a PerceptionFrame.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.provider.perceptionvideoframeallocator
 * @namespace Windows.Devices.Perception.Provider
 * @version WindowsRuntime 1.4
 */
class PerceptionVideoFrameAllocator extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPerceptionVideoFrameAllocator

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPerceptionVideoFrameAllocator.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Initializes a new PerceptionVideoFrameAllocator with the required properties for use by the IPerceptionFrameProvider to create PerceptionFrames published via PerceptionFrameProviderManagerService::PublishFrameForProvider.
     * @param {Integer} maxOutstandingFrameCountForWrite This is the number of buffers in flight required by the FrameProvider to produce its * frames at framerate. The suggestion is at least 2.
     * @param {Integer} format The Windows::Graphics::Imaging::BitmapPixelFormat describing the format of the bytes of the frame.
     * @param {SIZE} resolution The resolution in pixels of the frame.
     * @param {Integer} alpha The Windows::Graphics::Imaging::BitmapAlphaMode describing how transparency is handled in the pixels.
     * @returns {PerceptionVideoFrameAllocator} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.provider.perceptionvideoframeallocator.#ctor
     */
    static Create(maxOutstandingFrameCountForWrite, format, resolution, alpha) {
        if (!PerceptionVideoFrameAllocator.HasProp("__IPerceptionVideoFrameAllocatorFactory")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Perception.Provider.PerceptionVideoFrameAllocator")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPerceptionVideoFrameAllocatorFactory.IID)
            PerceptionVideoFrameAllocator.__IPerceptionVideoFrameAllocatorFactory := IPerceptionVideoFrameAllocatorFactory(factoryPtr)
        }

        return PerceptionVideoFrameAllocator.__IPerceptionVideoFrameAllocatorFactory.Create(maxOutstandingFrameCountForWrite, format, resolution, alpha)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        this.Close()

        super.__Delete()
    }

    /**
     * Creates an empty PerceptionFrame with the properties specified when creating the PerceptionVideoFrameAllocator.
     * @returns {PerceptionFrame} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.provider.perceptionvideoframeallocator.allocateframe
     */
    AllocateFrame() {
        if (!this.HasProp("__IPerceptionVideoFrameAllocator")) {
            if ((queryResult := this.QueryInterface(IPerceptionVideoFrameAllocator.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionVideoFrameAllocator := IPerceptionVideoFrameAllocator(outPtr)
        }

        return this.__IPerceptionVideoFrameAllocator.AllocateFrame()
    }

    /**
     * Creates a deep copy of the video FrameProvider with the bytes already filled in with the resulting PerceptionFrame.
     * @param {VideoFrame} frame_ The input frame from which to copy the pixel data.
     * @returns {PerceptionFrame} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.provider.perceptionvideoframeallocator.copyfromvideoframe
     */
    CopyFromVideoFrame(frame_) {
        if (!this.HasProp("__IPerceptionVideoFrameAllocator")) {
            if ((queryResult := this.QueryInterface(IPerceptionVideoFrameAllocator.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionVideoFrameAllocator := IPerceptionVideoFrameAllocator(outPtr)
        }

        return this.__IPerceptionVideoFrameAllocator.CopyFromVideoFrame(frame_)
    }

    /**
     * Releases system resources that are exposed by a Windows Runtime object.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.provider.perceptionvideoframeallocator.close
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
