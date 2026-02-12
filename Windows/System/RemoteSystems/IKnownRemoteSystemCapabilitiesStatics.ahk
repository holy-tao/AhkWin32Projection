#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.System.RemoteSystems
 * @version WindowsRuntime 1.4
 */
class IKnownRemoteSystemCapabilitiesStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IKnownRemoteSystemCapabilitiesStatics
     * @type {Guid}
     */
    static IID => Guid("{8108e380-7f8a-44e4-92cd-03b6469b94a3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AppService", "get_LaunchUri", "get_RemoteSession", "get_SpatialEntity"]

    /**
     * @type {HSTRING} 
     */
    AppService {
        get => this.get_AppService()
    }

    /**
     * @type {HSTRING} 
     */
    LaunchUri {
        get => this.get_LaunchUri()
    }

    /**
     * @type {HSTRING} 
     */
    RemoteSession {
        get => this.get_RemoteSession()
    }

    /**
     * @type {HSTRING} 
     */
    SpatialEntity {
        get => this.get_SpatialEntity()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_AppService() {
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
    get_LaunchUri() {
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
    get_RemoteSession() {
        value := HSTRING()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SpatialEntity() {
        value := HSTRING()
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
