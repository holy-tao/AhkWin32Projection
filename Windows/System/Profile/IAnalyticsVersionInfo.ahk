#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.System.Profile
 * @version WindowsRuntime 1.4
 */
class IAnalyticsVersionInfo extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAnalyticsVersionInfo
     * @type {Guid}
     */
    static IID => Guid("{926130b8-9955-4c74-bdc1-7cd0decf9b03}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DeviceFamily", "get_DeviceFamilyVersion"]

    /**
     * @type {HSTRING} 
     */
    DeviceFamily {
        get => this.get_DeviceFamily()
    }

    /**
     * @type {HSTRING} 
     */
    DeviceFamilyVersion {
        get => this.get_DeviceFamilyVersion()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DeviceFamily() {
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
    get_DeviceFamilyVersion() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
