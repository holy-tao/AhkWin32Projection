#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Playback
 * @version WindowsRuntime 1.4
 */
class IMediaPlaybackSessionOutputDegradationPolicyState extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMediaPlaybackSessionOutputDegradationPolicyState
     * @type {Guid}
     */
    static IID => Guid("{558e727d-f633-49f9-965a-abaa1db709be}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_VideoConstrictionReason"]

    /**
     * @type {Integer} 
     */
    VideoConstrictionReason {
        get => this.get_VideoConstrictionReason()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_VideoConstrictionReason() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
