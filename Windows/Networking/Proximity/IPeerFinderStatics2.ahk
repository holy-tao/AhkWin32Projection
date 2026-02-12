#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Storage\Streams\IBuffer.ahk
#Include .\PeerWatcher.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.Proximity
 * @version WindowsRuntime 1.4
 */
class IPeerFinderStatics2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPeerFinderStatics2
     * @type {Guid}
     */
    static IID => Guid("{d6e73c65-fdd0-4b0b-9312-866408935d82}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Role", "put_Role", "get_DiscoveryData", "put_DiscoveryData", "CreateWatcher"]

    /**
     * @type {Integer} 
     */
    Role {
        get => this.get_Role()
        set => this.put_Role(value)
    }

    /**
     * @type {IBuffer} 
     */
    DiscoveryData {
        get => this.get_DiscoveryData()
        set => this.put_DiscoveryData(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Role() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Role(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    get_DiscoveryData() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IBuffer(value)
    }

    /**
     * 
     * @param {IBuffer} value 
     * @returns {HRESULT} 
     */
    put_DiscoveryData(value) {
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {PeerWatcher} 
     */
    CreateWatcher() {
        result := ComCall(10, this, "ptr*", &watcher := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PeerWatcher(watcher)
    }
}
