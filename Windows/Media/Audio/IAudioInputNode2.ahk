#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\AudioNodeEmitter.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * The interface implemented by audio input nodes that support spatial audio.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.audio.iaudioinputnode2
 * @namespace Windows.Media.Audio
 * @version WindowsRuntime 1.4
 */
class IAudioInputNode2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAudioInputNode2
     * @type {Guid}
     */
    static IID => Guid("{905156b7-ca68-4c6d-a8bc-e3ee17fe3fd2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Emitter"]

    /**
     * Gets the [AudioNodeEmitter](audionodeemitter.md) that describes the position and other physical characteristics of the emitter from which the audio input node audio is emitted when spatial audio processing is used.
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.iaudioinputnode2.emitter
     * @type {AudioNodeEmitter} 
     */
    Emitter {
        get => this.get_Emitter()
    }

    /**
     * 
     * @returns {AudioNodeEmitter} 
     */
    get_Emitter() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AudioNodeEmitter(value)
    }
}
