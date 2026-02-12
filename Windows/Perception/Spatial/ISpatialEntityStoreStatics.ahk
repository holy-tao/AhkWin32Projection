#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\SpatialEntityStore.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Perception.Spatial
 * @version WindowsRuntime 1.4
 */
class ISpatialEntityStoreStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpatialEntityStoreStatics
     * @type {Guid}
     */
    static IID => Guid("{6b4b389e-7c50-4e92-8a62-4d1d4b7ccd3e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsSupported", "TryGetForRemoteSystemSession"]

    /**
     * @type {Boolean} 
     */
    IsSupported {
        get => this.get_IsSupported()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsSupported() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {RemoteSystemSession} session 
     * @returns {SpatialEntityStore} 
     */
    TryGetForRemoteSystemSession(session) {
        result := ComCall(7, this, "ptr", session, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SpatialEntityStore(value)
    }
}
