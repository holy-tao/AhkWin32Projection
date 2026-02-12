#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\Playback\MediaPlaybackItem.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Protection
 * @version WindowsRuntime 1.4
 */
class IServiceRequestedEventArgs2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IServiceRequestedEventArgs2
     * @type {Guid}
     */
    static IID => Guid("{553c69d6-fafe-4128-8dfa-130e398a13a7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_MediaPlaybackItem"]

    /**
     * @type {MediaPlaybackItem} 
     */
    MediaPlaybackItem {
        get => this.get_MediaPlaybackItem()
    }

    /**
     * 
     * @returns {MediaPlaybackItem} 
     */
    get_MediaPlaybackItem() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MediaPlaybackItem(value)
    }
}
