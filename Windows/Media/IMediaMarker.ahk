#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Foundation\TimeSpan.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * Represents a marker at specific location in a media stream time-line.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.imediamarker
 * @namespace Windows.Media
 * @version WindowsRuntime 1.4
 */
class IMediaMarker extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMediaMarker
     * @type {Guid}
     */
    static IID => Guid("{1803def8-dca5-4b6f-9c20-e3d3c0643625}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Time", "get_MediaMarkerType", "get_Text"]

    /**
     * Gets the offset in the media time-line that the marker occurs.
     * @see https://learn.microsoft.com/uwp/api/windows.media.imediamarker.time
     * @type {TimeSpan} 
     */
    Time {
        get => this.get_Time()
    }

    /**
     * Gets the type of the media marker.
     * @see https://learn.microsoft.com/uwp/api/windows.media.imediamarker.mediamarkertype
     * @type {HSTRING} 
     */
    MediaMarkerType {
        get => this.get_MediaMarkerType()
    }

    /**
     * Gets the text associated with the marker.
     * @see https://learn.microsoft.com/uwp/api/windows.media.imediamarker.text
     * @type {HSTRING} 
     */
    Text {
        get => this.get_Text()
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_Time() {
        value := TimeSpan()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_MediaMarkerType() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Text() {
        value := HSTRING()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
