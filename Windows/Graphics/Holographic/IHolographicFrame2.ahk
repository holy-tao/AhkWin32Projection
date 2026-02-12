#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\HolographicQuadLayerUpdateParameters.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Graphics.Holographic
 * @version WindowsRuntime 1.4
 */
class IHolographicFrame2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHolographicFrame2
     * @type {Guid}
     */
    static IID => Guid("{283f37bf-3bf2-5e91-6633-870574e6f217}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetQuadLayerUpdateParameters"]

    /**
     * 
     * @param {HolographicQuadLayer} layer 
     * @returns {HolographicQuadLayerUpdateParameters} 
     */
    GetQuadLayerUpdateParameters(layer) {
        result := ComCall(6, this, "ptr", layer, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return HolographicQuadLayerUpdateParameters(value)
    }
}
