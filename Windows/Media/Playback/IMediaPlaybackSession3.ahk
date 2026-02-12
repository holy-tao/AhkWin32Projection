#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\MediaPlaybackSessionOutputDegradationPolicyState.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Playback
 * @version WindowsRuntime 1.4
 */
class IMediaPlaybackSession3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMediaPlaybackSession3
     * @type {Guid}
     */
    static IID => Guid("{7ba2b41a-a3e2-405f-b77b-a4812c238b66}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_PlaybackRotation", "put_PlaybackRotation", "GetOutputDegradationPolicyState"]

    /**
     * @type {Integer} 
     */
    PlaybackRotation {
        get => this.get_PlaybackRotation()
        set => this.put_PlaybackRotation(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PlaybackRotation() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_PlaybackRotation(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {MediaPlaybackSessionOutputDegradationPolicyState} 
     */
    GetOutputDegradationPolicyState() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MediaPlaybackSessionOutputDegradationPolicyState(value)
    }
}
