#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\HolographicQuadLayer.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Graphics.Holographic
 * @version WindowsRuntime 1.4
 */
class IHolographicQuadLayerFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHolographicQuadLayerFactory
     * @type {Guid}
     */
    static IID => Guid("{a67538f3-5a14-5a10-489a-455065b37b76}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Create", "CreateWithPixelFormat"]

    /**
     * Create Extended Stored Procedures
     * @param {SIZE} size_ 
     * @returns {HolographicQuadLayer} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/extended-stored-procedures-programming/creating-extended-stored-procedures
     */
    Create(size_) {
        result := ComCall(6, this, "ptr", size_, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return HolographicQuadLayer(value)
    }

    /**
     * 
     * @param {SIZE} size_ 
     * @param {Integer} pixelFormat 
     * @returns {HolographicQuadLayer} 
     */
    CreateWithPixelFormat(size_, pixelFormat) {
        result := ComCall(7, this, "ptr", size_, "int", pixelFormat, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return HolographicQuadLayer(value)
    }
}
