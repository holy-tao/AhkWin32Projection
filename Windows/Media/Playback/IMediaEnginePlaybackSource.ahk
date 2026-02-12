#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\MediaPlaybackItem.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * The interface implemented by classes that are Media Engine playback sources.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.playback.imediaengineplaybacksource
 * @namespace Windows.Media.Playback
 * @version WindowsRuntime 1.4
 */
class IMediaEnginePlaybackSource extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMediaEnginePlaybackSource
     * @type {Guid}
     */
    static IID => Guid("{5c1d0ba7-3856-48b9-8dc6-244bf107bf8c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CurrentItem", "SetPlaybackSource"]

    /**
     * Gets the current playing [MediaPlaybackItem](mediaplaybackitem.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.imediaengineplaybacksource.currentitem
     * @type {MediaPlaybackItem} 
     */
    CurrentItem {
        get => this.get_CurrentItem()
    }

    /**
     * 
     * @returns {MediaPlaybackItem} 
     */
    get_CurrentItem() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MediaPlaybackItem(value)
    }

    /**
     * Sets the media playback source.
     * @param {IMediaPlaybackSource} source The media playback source.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.imediaengineplaybacksource.setplaybacksource
     */
    SetPlaybackSource(source) {
        result := ComCall(7, this, "ptr", source, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
