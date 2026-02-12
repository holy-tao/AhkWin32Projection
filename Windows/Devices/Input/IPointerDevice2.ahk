#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Input
 * @version WindowsRuntime 1.4
 */
class IPointerDevice2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPointerDevice2
     * @type {Guid}
     */
    static IID => Guid("{f8a6d2a0-c484-489f-ae3e-30d2ee1ffd3e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_MaxPointersWithZDistance"]

    /**
     * @type {Integer} 
     */
    MaxPointersWithZDistance {
        get => this.get_MaxPointersWithZDistance()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaxPointersWithZDistance() {
        result := ComCall(6, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
