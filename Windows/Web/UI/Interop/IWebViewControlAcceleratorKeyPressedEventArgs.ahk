#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\UI\Core\CorePhysicalKeyStatus.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Web.UI.Interop
 * @version WindowsRuntime 1.4
 */
class IWebViewControlAcceleratorKeyPressedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWebViewControlAcceleratorKeyPressedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{77a2a53e-7c74-437d-a290-3ac0d8cd5655}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_EventType", "get_VirtualKey", "get_KeyStatus", "get_RoutingStage", "get_Handled", "put_Handled"]

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
     * @type {Integer} 
     */
    RoutingStage {
        get => this.get_RoutingStage()
    }

    /**
     * @type {Boolean} 
     */
    Handled {
        get => this.get_Handled()
        set => this.put_Handled(value)
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

    /**
     * 
     * @returns {Integer} 
     */
    get_RoutingStage() {
        result := ComCall(9, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Handled() {
        result := ComCall(10, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_Handled(value) {
        result := ComCall(11, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
