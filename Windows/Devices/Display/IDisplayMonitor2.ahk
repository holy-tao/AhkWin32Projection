#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Display
 * @version WindowsRuntime 1.4
 */
class IDisplayMonitor2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDisplayMonitor2
     * @type {Guid}
     */
    static IID => Guid("{023018e6-cb23-5830-96df-a7bf6e602577}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsDolbyVisionSupportedInHdrMode"]

    /**
     * @type {Boolean} 
     */
    IsDolbyVisionSupportedInHdrMode {
        get => this.get_IsDolbyVisionSupportedInHdrMode()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsDolbyVisionSupportedInHdrMode() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
