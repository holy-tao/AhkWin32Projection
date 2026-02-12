#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * The interface you implement to create a custom video compositor.
 * @remarks
 * 1. In a Windows Runtime Component project, derive a public sealed class from this interface (see example below).
 * 2. Use the full class name in a [MediaOverlayLayer](/uwp/api/windows.media.editing.mediaoverlaylayer) constructor.  
 * 
 *     var propertySet = new PropertySet
 *     {
 *         ["Feather"] = true,
 *         ["Tolerance"] = 0.2f,
 *         ["Color"] = Colors.Blue
 *     };
 * 
 *     var compositorDefinition = new VideoCompositorDefinition(
 *         "Effects.ChromaKeyVideoCompositor",
 *         propertySet);
 * 
 *     var mediaOverlayLayer = new MediaOverlayLayer(compositorDefinition);
 * @see https://learn.microsoft.com/uwp/api/windows.media.effects.ivideocompositor
 * @namespace Windows.Media.Effects
 * @version WindowsRuntime 1.4
 */
class IVideoCompositor extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVideoCompositor
     * @type {Guid}
     */
    static IID => Guid("{8510b43e-420c-420f-96c7-7c98bba1fc55}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_TimeIndependent", "SetEncodingProperties", "CompositeFrame", "Close", "DiscardQueuedFrames"]

    /**
     * Gets a value that indicates whether the custom video effect is time independent.
     * @see https://learn.microsoft.com/uwp/api/windows.media.effects.ivideocompositor.timeindependent
     * @type {Boolean} 
     */
    TimeIndependent {
        get => this.get_TimeIndependent()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_TimeIndependent() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * Called to set the encoding properties of a custom video compositor.
     * @param {VideoEncodingProperties} backgroundProperties The encoding properties.
     * @param {IDirect3DDevice} device The Microsoft Direct3D device that can be used to create resources based on the media format described by the encoding properties.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.effects.ivideocompositor.setencodingproperties
     */
    SetEncodingProperties(backgroundProperties, device) {
        result := ComCall(7, this, "ptr", backgroundProperties, "ptr", device, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Called when frames are available for composition by a custom video compositor.
     * @param {CompositeVideoFrameContext} context_ The context object that provides the input and output frames for the composition operation.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.effects.ivideocompositor.compositeframe
     */
    CompositeFrame(context_) {
        result := ComCall(8, this, "ptr", context_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Called when the video compositor should close and clean up allocated resources.
     * @param {Integer} reason The reason the compositor was closed.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.effects.ivideocompositor.close
     */
    Close(reason) {
        result := ComCall(9, this, "int", reason, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Called to allow video compositor implementations optionally discard any stored state related to frames that have already been received.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.effects.ivideocompositor.discardqueuedframes
     */
    DiscardQueuedFrames() {
        result := ComCall(10, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
