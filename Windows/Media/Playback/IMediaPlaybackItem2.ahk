#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\MediaBreakSchedule.ahk
#Include ..\..\Foundation\TimeSpan.ahk
#Include ..\..\Foundation\IReference.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include .\MediaItemDisplayProperties.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Playback
 * @version WindowsRuntime 1.4
 */
class IMediaPlaybackItem2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMediaPlaybackItem2
     * @type {Guid}
     */
    static IID => Guid("{d859d171-d7ef-4b81-ac1f-f40493cbb091}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_BreakSchedule", "get_StartTime", "get_DurationLimit", "get_CanSkip", "put_CanSkip", "GetDisplayProperties", "ApplyDisplayProperties"]

    /**
     * @type {MediaBreakSchedule} 
     */
    BreakSchedule {
        get => this.get_BreakSchedule()
    }

    /**
     * @type {TimeSpan} 
     */
    StartTime {
        get => this.get_StartTime()
    }

    /**
     * @type {IReference<TimeSpan>} 
     */
    DurationLimit {
        get => this.get_DurationLimit()
    }

    /**
     * @type {Boolean} 
     */
    CanSkip {
        get => this.get_CanSkip()
        set => this.put_CanSkip(value)
    }

    /**
     * 
     * @returns {MediaBreakSchedule} 
     */
    get_BreakSchedule() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MediaBreakSchedule(value)
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_StartTime() {
        value := TimeSpan()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IReference<TimeSpan>} 
     */
    get_DurationLimit() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetTimeSpan(), value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanSkip() {
        result := ComCall(9, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_CanSkip(value) {
        result := ComCall(10, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {MediaItemDisplayProperties} 
     */
    GetDisplayProperties() {
        result := ComCall(11, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MediaItemDisplayProperties(value)
    }

    /**
     * 
     * @param {MediaItemDisplayProperties} value 
     * @returns {HRESULT} 
     */
    ApplyDisplayProperties(value) {
        result := ComCall(12, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
