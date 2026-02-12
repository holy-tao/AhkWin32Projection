#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.HumanInterfaceDevice
 * @version WindowsRuntime 1.4
 */
class IHidBooleanControlDescription2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHidBooleanControlDescription2
     * @type {Guid}
     */
    static IID => Guid("{c8eed2ea-8a77-4c36-aa00-5ff0449d3e73}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsAbsolute"]

    /**
     * @type {Boolean} 
     */
    IsAbsolute {
        get => this.get_IsAbsolute()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsAbsolute() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
