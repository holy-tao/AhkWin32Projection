#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Graphics.Holographic
 * @version WindowsRuntime 1.4
 */
class IHolographicCamera5 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHolographicCamera5
     * @type {Guid}
     */
    static IID => Guid("{229706f2-628d-4ef5-9c08-a63fdd7787c6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsHardwareContentProtectionSupported", "get_IsHardwareContentProtectionEnabled", "put_IsHardwareContentProtectionEnabled"]

    /**
     * @type {Boolean} 
     */
    IsHardwareContentProtectionSupported {
        get => this.get_IsHardwareContentProtectionSupported()
    }

    /**
     * @type {Boolean} 
     */
    IsHardwareContentProtectionEnabled {
        get => this.get_IsHardwareContentProtectionEnabled()
        set => this.put_IsHardwareContentProtectionEnabled(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsHardwareContentProtectionSupported() {
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
    get_IsHardwareContentProtectionEnabled() {
        result := ComCall(7, this, "int*", &value := 0, "int")
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
    put_IsHardwareContentProtectionEnabled(value) {
        result := ComCall(8, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
