#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\TimeSpan.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Playback
 * @version WindowsRuntime 1.4
 */
class IPlaybackMediaMarker extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPlaybackMediaMarker
     * @type {Guid}
     */
    static IID => Guid("{c4d22f5c-3c1c-4444-b6b9-778b0422d41a}")

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
     * @type {TimeSpan} 
     */
    Time {
        get => this.get_Time()
    }

    /**
     * @type {HSTRING} 
     */
    MediaMarkerType {
        get => this.get_MediaMarkerType()
    }

    /**
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
