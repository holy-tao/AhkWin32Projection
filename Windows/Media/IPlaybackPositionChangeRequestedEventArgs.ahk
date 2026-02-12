#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Foundation\TimeSpan.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media
 * @version WindowsRuntime 1.4
 */
class IPlaybackPositionChangeRequestedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPlaybackPositionChangeRequestedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{b4493f88-eb28-4961-9c14-335e44f3e125}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_RequestedPlaybackPosition"]

    /**
     * @type {TimeSpan} 
     */
    RequestedPlaybackPosition {
        get => this.get_RequestedPlaybackPosition()
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_RequestedPlaybackPosition() {
        value := TimeSpan()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
