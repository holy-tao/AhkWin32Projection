#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\Foundation\RECT.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Input
 * @version WindowsRuntime 1.4
 */
class IPointerDevice extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPointerDevice
     * @type {Guid}
     */
    static IID => Guid("{93c9bafc-ebcb-467e-82c6-276feae36b5a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_PointerDeviceType", "get_IsIntegrated", "get_MaxContacts", "get_PhysicalDeviceRect", "get_ScreenRect", "get_SupportedUsages"]

    /**
     * @type {Integer} 
     */
    PointerDeviceType {
        get => this.get_PointerDeviceType()
    }

    /**
     * @type {Boolean} 
     */
    IsIntegrated {
        get => this.get_IsIntegrated()
    }

    /**
     * @type {Integer} 
     */
    MaxContacts {
        get => this.get_MaxContacts()
    }

    /**
     * @type {RECT} 
     */
    PhysicalDeviceRect {
        get => this.get_PhysicalDeviceRect()
    }

    /**
     * @type {RECT} 
     */
    ScreenRect {
        get => this.get_ScreenRect()
    }

    /**
     * @type {IVectorView<PointerDeviceUsage>} 
     */
    SupportedUsages {
        get => this.get_SupportedUsages()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PointerDeviceType() {
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
    get_IsIntegrated() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaxContacts() {
        result := ComCall(8, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {RECT} 
     */
    get_PhysicalDeviceRect() {
        value := RECT()
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {RECT} 
     */
    get_ScreenRect() {
        value := RECT()
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IVectorView<PointerDeviceUsage>} 
     */
    get_SupportedUsages() {
        result := ComCall(11, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView((ptr) => IPropertyValue(ptr).GetPointerDeviceUsage(), value)
    }
}
