#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\IReference.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Streaming.Adaptive
 * @version WindowsRuntime 1.4
 */
class IAdaptiveMediaSourceCorrelatedTimes extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAdaptiveMediaSourceCorrelatedTimes
     * @type {Guid}
     */
    static IID => Guid("{05108787-e032-48e1-ab8d-002b0b3051df}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Position", "get_PresentationTimeStamp", "get_ProgramDateTime"]

    /**
     * @type {IReference<TimeSpan>} 
     */
    Position {
        get => this.get_Position()
    }

    /**
     * @type {IReference<TimeSpan>} 
     */
    PresentationTimeStamp {
        get => this.get_PresentationTimeStamp()
    }

    /**
     * @type {IReference<DateTime>} 
     */
    ProgramDateTime {
        get => this.get_ProgramDateTime()
    }

    /**
     * 
     * @returns {IReference<TimeSpan>} 
     */
    get_Position() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetTimeSpan(), value)
    }

    /**
     * 
     * @returns {IReference<TimeSpan>} 
     */
    get_PresentationTimeStamp() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetTimeSpan(), value)
    }

    /**
     * 
     * @returns {IReference<DateTime>} 
     */
    get_ProgramDateTime() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetDateTime(), value)
    }
}
