#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\PlaybackMediaMarker.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Playback
 * @version WindowsRuntime 1.4
 */
class IPlaybackMediaMarkerFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPlaybackMediaMarkerFactory
     * @type {Guid}
     */
    static IID => Guid("{8c530a78-e0ae-4e1a-a8c8-e23f982a937b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateFromTime", "Create"]

    /**
     * 
     * @param {TimeSpan} value 
     * @returns {PlaybackMediaMarker} 
     */
    CreateFromTime(value) {
        result := ComCall(6, this, "ptr", value, "ptr*", &marker := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PlaybackMediaMarker(marker)
    }

    /**
     * Create Extended Stored Procedures
     * @param {TimeSpan} value 
     * @param {HSTRING} mediaMarketType 
     * @param {HSTRING} text 
     * @returns {PlaybackMediaMarker} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/extended-stored-procedures-programming/creating-extended-stored-procedures
     */
    Create(value, mediaMarketType, text) {
        if(mediaMarketType is String) {
            pin := HSTRING.Create(mediaMarketType)
            mediaMarketType := pin.Value
        }
        mediaMarketType := mediaMarketType is Win32Handle ? NumGet(mediaMarketType, "ptr") : mediaMarketType
        if(text is String) {
            pin := HSTRING.Create(text)
            text := pin.Value
        }
        text := text is Win32Handle ? NumGet(text, "ptr") : text

        result := ComCall(7, this, "ptr", value, "ptr", mediaMarketType, "ptr", text, "ptr*", &marker := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PlaybackMediaMarker(marker)
    }
}
