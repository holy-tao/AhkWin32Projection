#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\ConnectionProfile.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.Connectivity
 * @version WindowsRuntime 1.4
 */
class IConnectionSession extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IConnectionSession
     * @type {Guid}
     */
    static IID => Guid("{ff905d4c-f83b-41b0-8a0c-1462d9c56b73}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ConnectionProfile"]

    /**
     * @type {ConnectionProfile} 
     */
    ConnectionProfile {
        get => this.get_ConnectionProfile()
    }

    /**
     * 
     * @returns {ConnectionProfile} 
     */
    get_ConnectionProfile() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ConnectionProfile(value)
    }
}
