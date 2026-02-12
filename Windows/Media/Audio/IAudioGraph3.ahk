#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\CreateMediaSourceAudioInputNodeResult.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Audio
 * @version WindowsRuntime 1.4
 */
class IAudioGraph3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAudioGraph3
     * @type {Guid}
     */
    static IID => Guid("{ddcd25ae-1185-42a7-831d-6a9b0fc86820}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateMediaSourceAudioInputNodeAsync", "CreateMediaSourceAudioInputNodeWithEmitterAsync"]

    /**
     * 
     * @param {MediaSource} mediaSource_ 
     * @returns {IAsyncOperation<CreateMediaSourceAudioInputNodeResult>} 
     */
    CreateMediaSourceAudioInputNodeAsync(mediaSource_) {
        result := ComCall(6, this, "ptr", mediaSource_, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(CreateMediaSourceAudioInputNodeResult, operation)
    }

    /**
     * 
     * @param {MediaSource} mediaSource_ 
     * @param {AudioNodeEmitter} emitter 
     * @returns {IAsyncOperation<CreateMediaSourceAudioInputNodeResult>} 
     */
    CreateMediaSourceAudioInputNodeWithEmitterAsync(mediaSource_, emitter) {
        result := ComCall(7, this, "ptr", mediaSource_, "ptr", emitter, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(CreateMediaSourceAudioInputNodeResult, operation)
    }
}
