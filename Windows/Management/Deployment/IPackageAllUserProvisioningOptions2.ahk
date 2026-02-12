#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Management.Deployment
 * @version WindowsRuntime 1.4
 */
class IPackageAllUserProvisioningOptions2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPackageAllUserProvisioningOptions2
     * @type {Guid}
     */
    static IID => Guid("{b9e3cab5-2d97-579f-9368-d10bb4d4542b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DeferAutomaticRegistration", "put_DeferAutomaticRegistration"]

    /**
     * @type {Boolean} 
     */
    DeferAutomaticRegistration {
        get => this.get_DeferAutomaticRegistration()
        set => this.put_DeferAutomaticRegistration(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_DeferAutomaticRegistration() {
        result := ComCall(6, this, "int*", &value := 0, "int")
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
    put_DeferAutomaticRegistration(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
