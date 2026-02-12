#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\DirectX\Direct3D11\IDirect3DSurface.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Graphics.Holographic
 * @version WindowsRuntime 1.4
 */
class IHolographicQuadLayerUpdateParameters2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHolographicQuadLayerUpdateParameters2
     * @type {Guid}
     */
    static IID => Guid("{4f33d32d-82c1-46c1-8980-3cb70d98182b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CanAcquireWithHardwareProtection", "AcquireBufferToUpdateContentWithHardwareProtection"]

    /**
     * @type {Boolean} 
     */
    CanAcquireWithHardwareProtection {
        get => this.get_CanAcquireWithHardwareProtection()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanAcquireWithHardwareProtection() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IDirect3DSurface} 
     */
    AcquireBufferToUpdateContentWithHardwareProtection() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IDirect3DSurface(value)
    }
}
