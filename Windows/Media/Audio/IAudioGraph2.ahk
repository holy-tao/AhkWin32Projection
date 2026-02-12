#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\AudioFrameInputNode.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\CreateAudioDeviceInputNodeResult.ahk
#Include .\CreateAudioFileInputNodeResult.ahk
#Include .\AudioSubmixNode.ahk
#Include .\AudioGraphBatchUpdater.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Audio
 * @version WindowsRuntime 1.4
 */
class IAudioGraph2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAudioGraph2
     * @type {Guid}
     */
    static IID => Guid("{4e4c3bd5-4fc1-45f6-a947-3cd38f4fd839}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateFrameInputNodeWithFormatAndEmitter", "CreateDeviceInputNodeWithFormatAndEmitterOnDeviceAsync", "CreateFileInputNodeWithEmitterAsync", "CreateSubmixNodeWithFormatAndEmitter", "CreateBatchUpdater"]

    /**
     * 
     * @param {AudioEncodingProperties} encodingProperties 
     * @param {AudioNodeEmitter} emitter 
     * @returns {AudioFrameInputNode} 
     */
    CreateFrameInputNodeWithFormatAndEmitter(encodingProperties, emitter) {
        result := ComCall(6, this, "ptr", encodingProperties, "ptr", emitter, "ptr*", &frameInputNode := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AudioFrameInputNode(frameInputNode)
    }

    /**
     * 
     * @param {Integer} category 
     * @param {AudioEncodingProperties} encodingProperties 
     * @param {DeviceInformation} device 
     * @param {AudioNodeEmitter} emitter 
     * @returns {IAsyncOperation<CreateAudioDeviceInputNodeResult>} 
     */
    CreateDeviceInputNodeWithFormatAndEmitterOnDeviceAsync(category, encodingProperties, device, emitter) {
        result := ComCall(7, this, "int", category, "ptr", encodingProperties, "ptr", device, "ptr", emitter, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(CreateAudioDeviceInputNodeResult, result_)
    }

    /**
     * 
     * @param {IStorageFile} file_ 
     * @param {AudioNodeEmitter} emitter 
     * @returns {IAsyncOperation<CreateAudioFileInputNodeResult>} 
     */
    CreateFileInputNodeWithEmitterAsync(file_, emitter) {
        result := ComCall(8, this, "ptr", file_, "ptr", emitter, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(CreateAudioFileInputNodeResult, result_)
    }

    /**
     * 
     * @param {AudioEncodingProperties} encodingProperties 
     * @param {AudioNodeEmitter} emitter 
     * @returns {AudioSubmixNode} 
     */
    CreateSubmixNodeWithFormatAndEmitter(encodingProperties, emitter) {
        result := ComCall(9, this, "ptr", encodingProperties, "ptr", emitter, "ptr*", &submixNode := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AudioSubmixNode(submixNode)
    }

    /**
     * 
     * @returns {AudioGraphBatchUpdater} 
     */
    CreateBatchUpdater() {
        result := ComCall(10, this, "ptr*", &updater := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AudioGraphBatchUpdater(updater)
    }
}
