#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include ..\MediaProperties\VideoEncodingProperties.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * The interface you implement to create a custom video effect.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.effects.ibasicvideoeffect
 * @namespace Windows.Media.Effects
 * @version WindowsRuntime 1.4
 */
class IBasicVideoEffect extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBasicVideoEffect
     * @type {Guid}
     */
    static IID => Guid("{8262c7ef-b360-40be-949b-2ff42ff35693}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsReadOnly", "get_SupportedMemoryTypes", "get_TimeIndependent", "get_SupportedEncodingProperties", "SetEncodingProperties", "ProcessFrame", "Close", "DiscardQueuedFrames"]

    /**
     * Gets a value indicating whether the video effect will modify the contents of the input frame.
     * @remarks
     * When IBasicVideoEffect.IsReadOnly is set to true, the system automatically copies the frame data directly from the input frame to the output frame before [ProcessFrame](ibasicvideoeffect_processframe_1753355935.md) is called. This allows an effect that analyzes the input data, but does not modify it, to skip the creation of the output frame data.
     * @see https://learn.microsoft.com/uwp/api/windows.media.effects.ibasicvideoeffect.isreadonly
     * @type {Boolean} 
     */
    IsReadOnly {
        get => this.get_IsReadOnly()
    }

    /**
     * Gets a value that indicates whether the custom video effect supports the use of GPU memory or CPU memory.
     * @remarks
     * If you specify [MediaMemoryTypes.GpuAndCpu](mediamemorytypes.md) when setting the memory type for your effect, the system will use either GPU or system memory, whichever is more efficient for the pipeline. When using this value, you must check in the [ProcessFrame](ibasicvideoeffect_processframe_1753355935.md) method to see whether the [SoftwareBitmap](../windows.graphics.imaging/softwarebitmap.md) or [IDirect3DSurface](../windows.graphics.directx.direct3d11/idirect3dsurface.md) passed into the method contains data and then process the frame accordingly.
     * @see https://learn.microsoft.com/uwp/api/windows.media.effects.ibasicvideoeffect.supportedmemorytypes
     * @type {Integer} 
     */
    SupportedMemoryTypes {
        get => this.get_SupportedMemoryTypes()
    }

    /**
     * Gets a value that indicates whether the custom video effect is time independent.
     * @see https://learn.microsoft.com/uwp/api/windows.media.effects.ibasicvideoeffect.timeindependent
     * @type {Boolean} 
     */
    TimeIndependent {
        get => this.get_TimeIndependent()
    }

    /**
     * Gets the encoding properties supported by the custom video effect.
     * @remarks
     * If you return an empty list of [VideoEncodingProperties](../windows.media.mediaproperties/videoencodingproperties.md) objects from **SupportedEncodingProperties**, the system will default to ARGB32 encoding.
     * @see https://learn.microsoft.com/uwp/api/windows.media.effects.ibasicvideoeffect.supportedencodingproperties
     * @type {IVectorView<VideoEncodingProperties>} 
     */
    SupportedEncodingProperties {
        get => this.get_SupportedEncodingProperties()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsReadOnly() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SupportedMemoryTypes() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_TimeIndependent() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IVectorView<VideoEncodingProperties>} 
     */
    get_SupportedEncodingProperties() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(VideoEncodingProperties, value)
    }

    /**
     * Called to set the encoding properties of a custom video effect.
     * @param {VideoEncodingProperties} encodingProperties The encoding properties.
     * @param {IDirect3DDevice} device The Microsoft Direct3D device that can be used to create resources based on the media format described by the encoding properties.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.effects.ibasicvideoeffect.setencodingproperties
     */
    SetEncodingProperties(encodingProperties, device) {
        result := ComCall(10, this, "ptr", encodingProperties, "ptr", device, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Called when frames are available for processing by a custom video effect.
     * @param {ProcessVideoFrameContext} context_ The context object that provides the input and output frames for the process operation.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.effects.ibasicvideoeffect.processframe
     */
    ProcessFrame(context_) {
        result := ComCall(11, this, "ptr", context_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Called when the video effect should close and clean up allocated resources.
     * @param {Integer} reason The reason the effect was closed.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.effects.ibasicvideoeffect.close
     */
    Close(reason) {
        result := ComCall(12, this, "int", reason, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Called to allow video effect implementations optionally discard any stored state related to frames that have already been received.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.effects.ibasicvideoeffect.discardqueuedframes
     */
    DiscardQueuedFrames() {
        result := ComCall(13, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
