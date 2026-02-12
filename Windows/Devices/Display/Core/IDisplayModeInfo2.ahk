#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\DisplayPresentationRate.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Display.Core
 * @version WindowsRuntime 1.4
 */
class IDisplayModeInfo2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDisplayModeInfo2
     * @type {Guid}
     */
    static IID => Guid("{c86fa386-0ddb-5473-bfb0-4b7807b5f909}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_PhysicalPresentationRate"]

    /**
     * @type {DisplayPresentationRate} 
     */
    PhysicalPresentationRate {
        get => this.get_PhysicalPresentationRate()
    }

    /**
     * 
     * @returns {DisplayPresentationRate} 
     */
    get_PhysicalPresentationRate() {
        value := DisplayPresentationRate()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
