#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Geolocation
 * @version WindowsRuntime 1.4
 */
class IGeocoordinateWithRemoteSource extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGeocoordinateWithRemoteSource
     * @type {Guid}
     */
    static IID => Guid("{397cebd7-ee38-5f3b-8900-c4a7bc9cf953}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsRemoteSource"]

    /**
     * @type {Boolean} 
     */
    IsRemoteSource {
        get => this.get_IsRemoteSource()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsRemoteSource() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
