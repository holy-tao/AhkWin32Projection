#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IVector.ahk
#Include .\HolographicQuadLayer.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Graphics.Holographic
 * @version WindowsRuntime 1.4
 */
class IHolographicCamera3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHolographicCamera3
     * @type {Guid}
     */
    static IID => Guid("{45aa4fb3-7b59-524e-4a3f-4a6ad6650477}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsPrimaryLayerEnabled", "put_IsPrimaryLayerEnabled", "get_MaxQuadLayerCount", "get_QuadLayers"]

    /**
     * @type {Boolean} 
     */
    IsPrimaryLayerEnabled {
        get => this.get_IsPrimaryLayerEnabled()
        set => this.put_IsPrimaryLayerEnabled(value)
    }

    /**
     * @type {Integer} 
     */
    MaxQuadLayerCount {
        get => this.get_MaxQuadLayerCount()
    }

    /**
     * @type {IVector<HolographicQuadLayer>} 
     */
    QuadLayers {
        get => this.get_QuadLayers()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsPrimaryLayerEnabled() {
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
    put_IsPrimaryLayerEnabled(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaxQuadLayerCount() {
        result := ComCall(8, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IVector<HolographicQuadLayer>} 
     */
    get_QuadLayers() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(HolographicQuadLayer, value)
    }
}
