#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\CorePhysicalKeyStatus.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Core
 * @version WindowsRuntime 1.4
 */
class IAcceleratorKeyEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAcceleratorKeyEventArgs
     * @type {Guid}
     */
    static IID => Guid("{ff1c4c4a-9287-470b-836e-9086e3126ade}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_EventType", "get_VirtualKey", "get_KeyStatus"]

    /**
     * @type {Integer} 
     */
    EventType {
        get => this.get_EventType()
    }

    /**
     * @type {Integer} 
     */
    VirtualKey {
        get => this.get_VirtualKey()
    }

    /**
     * @type {CorePhysicalKeyStatus} 
     */
    KeyStatus {
        get => this.get_KeyStatus()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_EventType() {
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
    get_VirtualKey() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {CorePhysicalKeyStatus} 
     */
    get_KeyStatus() {
        value := CorePhysicalKeyStatus()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
