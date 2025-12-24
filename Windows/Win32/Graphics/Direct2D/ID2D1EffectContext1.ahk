#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID2D1LookupTable3D.ahk
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
     * Creates a 3D lookup table for mapping a 3-channel input to a 3-channel output. The table data must be provided in 4-channel format.
     * @param {Integer} precision Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/ne-d2d1_1-d2d1_buffer_precision">D2D1_BUFFER_PRECISION</a></b>
     * 
     * Precision of the input lookup table data.
     * @param {Pointer<Integer>} extents Type: <b>const UINT32*</b>
     * 
     * Number of lookup table elements per dimension (X, Y, Z).
     * @param {Pointer<Integer>} data Type: <b>const BYTE*</b>
     * 
     * Buffer holding the lookup table data.
     * @param {Integer} dataCount Type: <b>UINT32</b>
     * 
     * Size of the lookup table data buffer.
     * @param {Pointer<Integer>} strides Type: <b>const UINT32*</b>
     * 
     * An array containing two values. The first value is the size in bytes from one row (X dimension) of LUT data to the next. 
     *           The second value is the size in bytes from one LUT data plane (X and Y dimensions) to the next.
     * @returns {ID2D1LookupTable3D} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_3/nn-d2d1_3-id2d1lookuptable3d">ID2D1LookupTable3D</a>**</b>
     * 
     * Receives the new lookup table instance.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1effectauthor_1/nf-d2d1effectauthor_1-id2d1effectcontext1-createlookuptable3d
     */
    CreateLookupTable3D(precision, extents, data, dataCount, strides) {
        extentsMarshal := extents is VarRef ? "uint*" : "ptr"
        dataMarshal := data is VarRef ? "char*" : "ptr"
        stridesMarshal := strides is VarRef ? "uint*" : "ptr"

        result := ComCall(24, this, "int", precision, extentsMarshal, extents, dataMarshal, data, "uint", dataCount, stridesMarshal, strides, "ptr*", &lookupTable := 0, "HRESULT")
        return ID2D1LookupTable3D(lookupTable)
    }
}
