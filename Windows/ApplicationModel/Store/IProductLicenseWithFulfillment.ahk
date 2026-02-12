#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Store
 * @version WindowsRuntime 1.4
 */
class IProductLicenseWithFulfillment extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IProductLicenseWithFulfillment
     * @type {Guid}
     */
    static IID => Guid("{fc535c8a-f667-40f3-ba3c-045a63abb3ac}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsConsumable"]

    /**
     * @type {Boolean} 
     */
    IsConsumable {
        get => this.get_IsConsumable()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsConsumable() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
