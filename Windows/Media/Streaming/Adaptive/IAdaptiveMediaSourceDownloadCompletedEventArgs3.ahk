#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\IReference.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Streaming.Adaptive
 * @version WindowsRuntime 1.4
 */
class IAdaptiveMediaSourceDownloadCompletedEventArgs3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAdaptiveMediaSourceDownloadCompletedEventArgs3
     * @type {Guid}
     */
    static IID => Guid("{0f8a8bd1-93b2-47c6-badc-8be2c8f7f6e8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ResourceDuration", "get_ResourceContentType"]

    /**
     * @type {IReference<TimeSpan>} 
     */
    ResourceDuration {
        get => this.get_ResourceDuration()
    }

    /**
     * @type {HSTRING} 
     */
    ResourceContentType {
        get => this.get_ResourceContentType()
    }

    /**
     * 
     * @returns {IReference<TimeSpan>} 
     */
    get_ResourceDuration() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetTimeSpan(), value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ResourceContentType() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
