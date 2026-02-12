#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.System.RemoteSystems
 * @version WindowsRuntime 1.4
 */
class IRemoteSystemDiscoveryTypeFilter extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRemoteSystemDiscoveryTypeFilter
     * @type {Guid}
     */
    static IID => Guid("{42d9041f-ee5a-43da-ac6a-6fee25460741}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_RemoteSystemDiscoveryType"]

    /**
     * @type {Integer} 
     */
    RemoteSystemDiscoveryType {
        get => this.get_RemoteSystemDiscoveryType()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_RemoteSystemDiscoveryType() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
