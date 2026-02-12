#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\HostName.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.Proximity
 * @version WindowsRuntime 1.4
 */
class IPeerInformationWithHostAndService extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPeerInformationWithHostAndService
     * @type {Guid}
     */
    static IID => Guid("{ecc7ccad-1b70-4e8b-92db-bbe781419308}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_HostName", "get_ServiceName"]

    /**
     * @type {HostName} 
     */
    HostName {
        get => this.get_HostName()
    }

    /**
     * @type {HSTRING} 
     */
    ServiceName {
        get => this.get_ServiceName()
    }

    /**
     * 
     * @returns {HostName} 
     */
    get_HostName() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return HostName(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ServiceName() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
