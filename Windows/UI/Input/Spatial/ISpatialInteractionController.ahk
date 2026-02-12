#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Devices\Haptics\SimpleHapticsController.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Input.Spatial
 * @version WindowsRuntime 1.4
 */
class ISpatialInteractionController extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpatialInteractionController
     * @type {Guid}
     */
    static IID => Guid("{5f0e5ba3-0954-4e97-86c5-e7f30b114dfd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_HasTouchpad", "get_HasThumbstick", "get_SimpleHapticsController", "get_VendorId", "get_ProductId", "get_Version"]

    /**
     * @type {Boolean} 
     */
    HasTouchpad {
        get => this.get_HasTouchpad()
    }

    /**
     * @type {Boolean} 
     */
    HasThumbstick {
        get => this.get_HasThumbstick()
    }

    /**
     * @type {SimpleHapticsController} 
     */
    SimpleHapticsController {
        get => this.get_SimpleHapticsController()
    }

    /**
     * @type {Integer} 
     */
    VendorId {
        get => this.get_VendorId()
    }

    /**
     * @type {Integer} 
     */
    ProductId {
        get => this.get_ProductId()
    }

    /**
     * @type {Integer} 
     */
    Version {
        get => this.get_Version()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_HasTouchpad() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_HasThumbstick() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {SimpleHapticsController} 
     */
    get_SimpleHapticsController() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SimpleHapticsController(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_VendorId() {
        result := ComCall(9, this, "ushort*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ProductId() {
        result := ComCall(10, this, "ushort*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Version() {
        result := ComCall(11, this, "ushort*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
