#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.Connectivity
 * @version WindowsRuntime 1.4
 */
class INetworkStateChangeEventDetails2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INetworkStateChangeEventDetails2
     * @type {Guid}
     */
    static IID => Guid("{d643c0e8-30d3-4f6a-ad47-6a1873ceb3c1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_HasNewTetheringOperationalState", "get_HasNewTetheringClientCount"]

    /**
     * @type {Boolean} 
     */
    HasNewTetheringOperationalState {
        get => this.get_HasNewTetheringOperationalState()
    }

    /**
     * @type {Boolean} 
     */
    HasNewTetheringClientCount {
        get => this.get_HasNewTetheringClientCount()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_HasNewTetheringOperationalState() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_HasNewTetheringClientCount() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
