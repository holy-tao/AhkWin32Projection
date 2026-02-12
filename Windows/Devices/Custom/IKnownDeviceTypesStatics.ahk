#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Custom
 * @version WindowsRuntime 1.4
 */
class IKnownDeviceTypesStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IKnownDeviceTypesStatics
     * @type {Guid}
     */
    static IID => Guid("{ee5479c2-5448-45da-ad1b-24948c239094}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Unknown"]

    /**
     * @type {Integer} 
     */
    Unknown {
        get => this.get_Unknown()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Unknown() {
        result := ComCall(6, this, "ushort*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
