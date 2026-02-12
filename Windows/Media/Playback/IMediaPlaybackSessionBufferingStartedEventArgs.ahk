#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Playback
 * @version WindowsRuntime 1.4
 */
class IMediaPlaybackSessionBufferingStartedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMediaPlaybackSessionBufferingStartedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{cd6aafed-74e2-43b5-b115-76236c33791a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsPlaybackInterruption"]

    /**
     * @type {Boolean} 
     */
    IsPlaybackInterruption {
        get => this.get_IsPlaybackInterruption()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsPlaybackInterruption() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
