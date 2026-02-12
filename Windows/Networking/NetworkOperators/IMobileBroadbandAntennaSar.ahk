#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class IMobileBroadbandAntennaSar extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMobileBroadbandAntennaSar
     * @type {Guid}
     */
    static IID => Guid("{b9af4b7e-cbf9-4109-90be-5c06bfd513b6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AntennaIndex", "get_SarBackoffIndex"]

    /**
     * @type {Integer} 
     */
    AntennaIndex {
        get => this.get_AntennaIndex()
    }

    /**
     * @type {Integer} 
     */
    SarBackoffIndex {
        get => this.get_SarBackoffIndex()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AntennaIndex() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SarBackoffIndex() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
