#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include ..\..\Devices\Haptics\SimpleHapticsController.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Gaming.Input
 * @version WindowsRuntime 1.4
 */
class IRawGameController2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRawGameController2
     * @type {Guid}
     */
    static IID => Guid("{43c0c035-bb73-4756-a787-3ed6bea617bd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SimpleHapticsControllers", "get_NonRoamableId", "get_DisplayName"]

    /**
     * @type {IVectorView<SimpleHapticsController>} 
     */
    SimpleHapticsControllers {
        get => this.get_SimpleHapticsControllers()
    }

    /**
     * @type {HSTRING} 
     */
    NonRoamableId {
        get => this.get_NonRoamableId()
    }

    /**
     * @type {HSTRING} 
     */
    DisplayName {
        get => this.get_DisplayName()
    }

    /**
     * 
     * @returns {IVectorView<SimpleHapticsController>} 
     */
    get_SimpleHapticsControllers() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(SimpleHapticsController, value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_NonRoamableId() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DisplayName() {
        value := HSTRING()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
