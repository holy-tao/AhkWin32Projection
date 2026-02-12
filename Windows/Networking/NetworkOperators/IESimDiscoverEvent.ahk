#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class IESimDiscoverEvent extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IESimDiscoverEvent
     * @type {Guid}
     */
    static IID => Guid("{e59ac3e3-39bc-5f6f-9321-0d4a182d261b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_MatchingId", "get_RspServerAddress"]

    /**
     * @type {HSTRING} 
     */
    MatchingId {
        get => this.get_MatchingId()
    }

    /**
     * @type {HSTRING} 
     */
    RspServerAddress {
        get => this.get_RspServerAddress()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_MatchingId() {
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
    get_RspServerAddress() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
