#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Perception
 * @version WindowsRuntime 1.4
 */
class IKnownPerceptionColorFrameSourcePropertiesStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IKnownPerceptionColorFrameSourcePropertiesStatics
     * @type {Guid}
     */
    static IID => Guid("{5df1cca2-01f8-4a87-b859-d5e5b7e1de4b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Exposure", "get_AutoExposureEnabled", "get_ExposureCompensation"]

    /**
     * @type {HSTRING} 
     */
    Exposure {
        get => this.get_Exposure()
    }

    /**
     * @type {HSTRING} 
     */
    AutoExposureEnabled {
        get => this.get_AutoExposureEnabled()
    }

    /**
     * @type {HSTRING} 
     */
    ExposureCompensation {
        get => this.get_ExposureCompensation()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Exposure() {
        value := HSTRING()
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
    get_AutoExposureEnabled() {
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
    get_ExposureCompensation() {
        value := HSTRING()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
