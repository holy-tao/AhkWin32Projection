#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\IReference.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include .\AdaptiveMediaSourceDiagnostics.ahk
#Include .\AdaptiveMediaSourceCorrelatedTimes.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Streaming.Adaptive
 * @version WindowsRuntime 1.4
 */
class IAdaptiveMediaSource3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAdaptiveMediaSource3
     * @type {Guid}
     */
    static IID => Guid("{ba7023fd-c334-461b-a36e-c99f54f7174a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_MinLiveOffset", "get_MaxSeekableWindowSize", "get_DesiredSeekableWindowSize", "put_DesiredSeekableWindowSize", "get_Diagnostics", "GetCorrelatedTimes"]

    /**
     * @type {IReference<TimeSpan>} 
     */
    MinLiveOffset {
        get => this.get_MinLiveOffset()
    }

    /**
     * @type {IReference<TimeSpan>} 
     */
    MaxSeekableWindowSize {
        get => this.get_MaxSeekableWindowSize()
    }

    /**
     * @type {IReference<TimeSpan>} 
     */
    DesiredSeekableWindowSize {
        get => this.get_DesiredSeekableWindowSize()
        set => this.put_DesiredSeekableWindowSize(value)
    }

    /**
     * @type {AdaptiveMediaSourceDiagnostics} 
     */
    Diagnostics {
        get => this.get_Diagnostics()
    }

    /**
     * 
     * @returns {IReference<TimeSpan>} 
     */
    get_MinLiveOffset() {
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
    get_MaxSeekableWindowSize() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetTimeSpan(), value)
    }

    /**
     * 
     * @returns {IReference<TimeSpan>} 
     */
    get_DesiredSeekableWindowSize() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetTimeSpan(), value)
    }

    /**
     * 
     * @param {IReference<TimeSpan>} value 
     * @returns {HRESULT} 
     */
    put_DesiredSeekableWindowSize(value) {
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {AdaptiveMediaSourceDiagnostics} 
     */
    get_Diagnostics() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AdaptiveMediaSourceDiagnostics(value)
    }

    /**
     * 
     * @returns {AdaptiveMediaSourceCorrelatedTimes} 
     */
    GetCorrelatedTimes() {
        result := ComCall(11, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AdaptiveMediaSourceCorrelatedTimes(value)
    }
}
