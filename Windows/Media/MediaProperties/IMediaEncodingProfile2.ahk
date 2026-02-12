#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IVector.ahk
#Include ..\Core\AudioStreamDescriptor.ahk
#Include ..\Core\VideoStreamDescriptor.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.MediaProperties
 * @version WindowsRuntime 1.4
 */
class IMediaEncodingProfile2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMediaEncodingProfile2
     * @type {Guid}
     */
    static IID => Guid("{349b3e0a-4035-488e-9877-85632865ed10}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetAudioTracks", "GetAudioTracks", "SetVideoTracks", "GetVideoTracks"]

    /**
     * 
     * @param {IIterable<AudioStreamDescriptor>} value 
     * @returns {HRESULT} 
     */
    SetAudioTracks(value) {
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IVector<AudioStreamDescriptor>} 
     */
    GetAudioTracks() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(AudioStreamDescriptor, value)
    }

    /**
     * 
     * @param {IIterable<VideoStreamDescriptor>} value 
     * @returns {HRESULT} 
     */
    SetVideoTracks(value) {
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IVector<VideoStreamDescriptor>} 
     */
    GetVideoTracks() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(VideoStreamDescriptor, value)
    }
}
