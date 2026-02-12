#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Graphics.Holographic
 * @version WindowsRuntime 1.4
 */
class IHolographicCameraRenderingParameters3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHolographicCameraRenderingParameters3
     * @type {Guid}
     */
    static IID => Guid("{b1aa513f-136d-4b06-b9d4-e4b914cd0683}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsContentProtectionEnabled", "put_IsContentProtectionEnabled"]

    /**
     * @type {Boolean} 
     */
    IsContentProtectionEnabled {
        get => this.get_IsContentProtectionEnabled()
        set => this.put_IsContentProtectionEnabled(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsContentProtectionEnabled() {
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
    put_IsContentProtectionEnabled(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
