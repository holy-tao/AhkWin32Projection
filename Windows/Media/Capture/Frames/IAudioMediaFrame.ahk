#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\MediaFrameReference.ahk
#Include ..\..\MediaProperties\AudioEncodingProperties.ahk
#Include ..\..\AudioFrame.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Capture.Frames
 * @version WindowsRuntime 1.4
 */
class IAudioMediaFrame extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAudioMediaFrame
     * @type {Guid}
     */
    static IID => Guid("{a3a9feff-8021-441b-9a46-e7f0137b7981}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_FrameReference", "get_AudioEncodingProperties", "GetAudioFrame"]

    /**
     * @type {MediaFrameReference} 
     */
    FrameReference {
        get => this.get_FrameReference()
    }

    /**
     * @type {AudioEncodingProperties} 
     */
    AudioEncodingProperties {
        get => this.get_AudioEncodingProperties()
    }

    /**
     * 
     * @returns {MediaFrameReference} 
     */
    get_FrameReference() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MediaFrameReference(value)
    }

    /**
     * 
     * @returns {AudioEncodingProperties} 
     */
    get_AudioEncodingProperties() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AudioEncodingProperties(value)
    }

    /**
     * 
     * @returns {AudioFrame} 
     */
    GetAudioFrame() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AudioFrame(value)
    }
}
