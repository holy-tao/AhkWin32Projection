#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class IMobileBroadbandDeviceInformation3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMobileBroadbandDeviceInformation3
     * @type {Guid}
     */
    static IID => Guid("{e08bb4bd-5d30-4b5a-92cc-d54df881d49e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SimSpn", "get_SimPnn", "get_SimGid1"]

    /**
     * @type {HSTRING} 
     */
    SimSpn {
        get => this.get_SimSpn()
    }

    /**
     * @type {HSTRING} 
     */
    SimPnn {
        get => this.get_SimPnn()
    }

    /**
     * @type {HSTRING} 
     */
    SimGid1 {
        get => this.get_SimGid1()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SimSpn() {
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
    get_SimPnn() {
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
    get_SimGid1() {
        value := HSTRING()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
