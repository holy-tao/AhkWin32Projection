#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\MediaPlaybackItem.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Playback
 * @version WindowsRuntime 1.4
 */
class ICurrentMediaPlaybackItemChangedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICurrentMediaPlaybackItemChangedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{1743a892-5c43-4a15-967a-572d2d0f26c6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_NewItem", "get_OldItem"]

    /**
     * @type {MediaPlaybackItem} 
     */
    NewItem {
        get => this.get_NewItem()
    }

    /**
     * @type {MediaPlaybackItem} 
     */
    OldItem {
        get => this.get_OldItem()
    }

    /**
     * 
     * @returns {MediaPlaybackItem} 
     */
    get_NewItem() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MediaPlaybackItem(value)
    }

    /**
     * 
     * @returns {MediaPlaybackItem} 
     */
    get_OldItem() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MediaPlaybackItem(value)
    }
}
