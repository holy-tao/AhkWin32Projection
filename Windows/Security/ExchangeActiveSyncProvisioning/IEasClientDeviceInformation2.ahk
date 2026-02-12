#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Security.ExchangeActiveSyncProvisioning
 * @version WindowsRuntime 1.4
 */
class IEasClientDeviceInformation2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEasClientDeviceInformation2
     * @type {Guid}
     */
    static IID => Guid("{ffb35923-bb26-4d6a-81bc-165aee0ad754}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SystemHardwareVersion", "get_SystemFirmwareVersion"]

    /**
     * @type {HSTRING} 
     */
    SystemHardwareVersion {
        get => this.get_SystemHardwareVersion()
    }

    /**
     * @type {HSTRING} 
     */
    SystemFirmwareVersion {
        get => this.get_SystemFirmwareVersion()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SystemHardwareVersion() {
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
    get_SystemFirmwareVersion() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
