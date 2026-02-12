#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\MediaPlaybackItem.ahk
#Include .\MediaPlaybackItemError.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Playback
 * @version WindowsRuntime 1.4
 */
class IMediaPlaybackItemFailedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMediaPlaybackItemFailedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{7703134a-e9a7-47c3-862c-c656d30683d4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Item", "get_Error"]

    /**
     * @type {MediaPlaybackItem} 
     */
    Item {
        get => this.get_Item()
    }

    /**
     * @type {MediaPlaybackItemError} 
     */
    Error {
        get => this.get_Error()
    }

    /**
     * 
     * @returns {MediaPlaybackItem} 
     */
    get_Item() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MediaPlaybackItem(value)
    }

    /**
     * 
     * @returns {MediaPlaybackItemError} 
     */
    get_Error() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MediaPlaybackItemError(value)
    }
}
