#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID2D1EffectContext.ahk

/**
 * Provides factory methods and other state management for effect and transform authors.
 * @see https://docs.microsoft.com/windows/win32/api//d2d1effectauthor_1/nn-d2d1effectauthor_1-id2d1effectcontext1
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class ID2D1EffectContext1 extends ID2D1EffectContext{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID2D1EffectContext1
     * @type {Guid}
     */
    static IID => Guid("{84ab595a-fc81-4546-bacd-e8ef4d8abe7a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 24

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateLookupTable3D"]

    /**
     * 
     * @param {Integer} precision 
     * @param {Pointer<Integer>} extents 
     * @param {Pointer<Integer>} data 
     * @param {Integer} dataCount 
     * @param {Pointer<Integer>} strides 
     * @param {Pointer<ID2D1LookupTable3D>} lookupTable 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor_1/nf-d2d1effectauthor_1-id2d1effectcontext1-createlookuptable3d
     */
    CreateLookupTable3D(precision, extents, data, dataCount, strides, lookupTable) {
        result := ComCall(24, this, "int", precision, "uint*", extents, "char*", data, "uint", dataCount, "uint*", strides, "ptr*", lookupTable, "HRESULT")
        return result
    }
}
