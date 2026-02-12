#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\RadialController.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Input
 * @version WindowsRuntime 1.4
 */
class IRadialControllerConfiguration2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRadialControllerConfiguration2
     * @type {Guid}
     */
    static IID => Guid("{3d577ef7-3cee-11e6-b535-001bdc06ab3b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_ActiveControllerWhenMenuIsSuppressed", "get_ActiveControllerWhenMenuIsSuppressed", "put_IsMenuSuppressed", "get_IsMenuSuppressed"]

    /**
     * @type {RadialController} 
     */
    ActiveControllerWhenMenuIsSuppressed {
        get => this.get_ActiveControllerWhenMenuIsSuppressed()
        set => this.put_ActiveControllerWhenMenuIsSuppressed(value)
    }

    /**
     * @type {Boolean} 
     */
    IsMenuSuppressed {
        get => this.get_IsMenuSuppressed()
        set => this.put_IsMenuSuppressed(value)
    }

    /**
     * 
     * @param {RadialController} value 
     * @returns {HRESULT} 
     */
    put_ActiveControllerWhenMenuIsSuppressed(value) {
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {RadialController} 
     */
    get_ActiveControllerWhenMenuIsSuppressed() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return RadialController(value)
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsMenuSuppressed(value) {
        result := ComCall(8, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsMenuSuppressed() {
        result := ComCall(9, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
