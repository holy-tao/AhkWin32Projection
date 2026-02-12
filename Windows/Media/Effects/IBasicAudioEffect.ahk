#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include ..\MediaProperties\AudioEncodingProperties.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * The interface you implement to create a custom audio effect.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.effects.ibasicaudioeffect
 * @namespace Windows.Media.Effects
 * @version WindowsRuntime 1.4
 */
class IBasicAudioEffect extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBasicAudioEffect
     * @type {Guid}
     */
    static IID => Guid("{8c062c53-6bc0-48b8-a99a-4b41550f1359}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_UseInputFrameForOutput", "get_SupportedEncodingProperties", "SetEncodingProperties", "ProcessFrame", "Close", "DiscardQueuedFrames"]

    /**
     * Gets a value that indicates whether the input frame is used for the output of the audio effect.
     * @see https://learn.microsoft.com/uwp/api/windows.media.effects.ibasicaudioeffect.useinputframeforoutput
     * @type {Boolean} 
     */
    UseInputFrameForOutput {
        get => this.get_UseInputFrameForOutput()
    }

    /**
     * Gets the encoding properties supported by the custom audio effect.
     * @see https://learn.microsoft.com/uwp/api/windows.media.effects.ibasicaudioeffect.supportedencodingproperties
     * @type {IVectorView<AudioEncodingProperties>} 
     */
    SupportedEncodingProperties {
        get => this.get_SupportedEncodingProperties()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_UseInputFrameForOutput() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IVectorView<AudioEncodingProperties>} 
     */
    get_SupportedEncodingProperties() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(AudioEncodingProperties, value)
    }

    /**
     * Called to set the encoding properties of a custom audio effect.
     * @param {AudioEncodingProperties} encodingProperties The encoding properties.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.effects.ibasicaudioeffect.setencodingproperties
     */
    SetEncodingProperties(encodingProperties) {
        result := ComCall(8, this, "ptr", encodingProperties, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Called when samples are available for processing by a custom audio effect.
     * @param {ProcessAudioFrameContext} context_ The context object that provides the input and output frames for the process operation.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.effects.ibasicaudioeffect.processframe
     */
    ProcessFrame(context_) {
        result := ComCall(9, this, "ptr", context_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Called when the audio effect should close and clean up allocated resources.
     * @param {Integer} reason The reason the effect was closed.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.effects.ibasicaudioeffect.close
     */
    Close(reason) {
        result := ComCall(10, this, "int", reason, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Called to allow audio effect implementations optionally discard any stored state related to samples that have already been received.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.effects.ibasicaudioeffect.discardqueuedframes
     */
    DiscardQueuedFrames() {
        result := ComCall(11, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
