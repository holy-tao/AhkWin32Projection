#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\AnalyticsVersionInfo.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.System.Profile
 * @version WindowsRuntime 1.4
 */
class IAnalyticsInfoStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAnalyticsInfoStatics
     * @type {Guid}
     */
    static IID => Guid("{1d5ee066-188d-5ba9-4387-acaeb0e7e305}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_VersionInfo", "get_DeviceForm"]

    /**
     * @type {AnalyticsVersionInfo} 
     */
    VersionInfo {
        get => this.get_VersionInfo()
    }

    /**
     * @type {HSTRING} 
     */
    DeviceForm {
        get => this.get_DeviceForm()
    }

    /**
     * 
     * @returns {AnalyticsVersionInfo} 
     */
    get_VersionInfo() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AnalyticsVersionInfo(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DeviceForm() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
