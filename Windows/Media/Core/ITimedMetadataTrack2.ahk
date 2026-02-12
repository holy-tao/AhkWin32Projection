#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\Playback\MediaPlaybackItem.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Core
 * @version WindowsRuntime 1.4
 */
class ITimedMetadataTrack2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITimedMetadataTrack2
     * @type {Guid}
     */
    static IID => Guid("{21b4b648-9f9d-40ba-a8f3-1a92753aef0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_PlaybackItem", "get_Name"]

    /**
     * @type {MediaPlaybackItem} 
     */
    PlaybackItem {
        get => this.get_PlaybackItem()
    }

    /**
     * @type {HSTRING} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * 
     * @returns {MediaPlaybackItem} 
     */
    get_PlaybackItem() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MediaPlaybackItem(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Name() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
