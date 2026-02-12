#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Devices\Input\PointerDevice.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Input
 * @version WindowsRuntime 1.4
 */
class ITouchpadGlobalActionEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITouchpadGlobalActionEventArgs
     * @type {Guid}
     */
    static IID => Guid("{6edad206-e4e3-5f39-9d13-8575e8e2a12b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Action", "get_PointerDevice"]

    /**
     * @type {Integer} 
     */
    Action {
        get => this.get_Action()
    }

    /**
     * @type {PointerDevice} 
     */
    PointerDevice {
        get => this.get_PointerDevice()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Action() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {PointerDevice} 
     */
    get_PointerDevice() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PointerDevice(value)
    }
}
