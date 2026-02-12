#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\MediaPlaybackItem.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Playback
 * @version WindowsRuntime 1.4
 */
class IMediaPlaybackItemFactory2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMediaPlaybackItemFactory2
     * @type {Guid}
     */
    static IID => Guid("{d77cdf3a-b947-4972-b35d-adfb931a71e6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateWithStartTime", "CreateWithStartTimeAndDurationLimit"]

    /**
     * 
     * @param {MediaSource} source 
     * @param {TimeSpan} startTime 
     * @returns {MediaPlaybackItem} 
     */
    CreateWithStartTime(source, startTime) {
        result := ComCall(6, this, "ptr", source, "ptr", startTime, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MediaPlaybackItem(result_)
    }

    /**
     * 
     * @param {MediaSource} source 
     * @param {TimeSpan} startTime 
     * @param {TimeSpan} durationLimit 
     * @returns {MediaPlaybackItem} 
     */
    CreateWithStartTimeAndDurationLimit(source, startTime, durationLimit) {
        result := ComCall(7, this, "ptr", source, "ptr", startTime, "ptr", durationLimit, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MediaPlaybackItem(result_)
    }
}
