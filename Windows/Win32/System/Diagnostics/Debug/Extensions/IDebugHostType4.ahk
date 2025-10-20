#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include .\IDebugHostType3.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IDebugHostType4 extends IDebugHostType3{
    /**
     * The interface identifier for IDebugHostType4
     * @type {Guid}
     */
    static IID => Guid("{77d3cdc6-bd55-42bf-a4fd-d9aa60e3c1e1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 35

    /**
     * 
     * @param {Pointer<UInt64>} headerSize 
     * @returns {HRESULT} 
     */
    GetExtendedArrayHeaderSize(headerSize) {
        result := ComCall(35, this, "uint*", headerSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dimensions 
     * @param {Pointer<ExtendedArrayDimension>} pDimensions 
     * @returns {HRESULT} 
     */
    GetExtendedArrayDimensions(dimensions, pDimensions) {
        result := ComCall(36, this, "uint", dimensions, "ptr", pDimensions, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} udtKind 
     * @returns {HRESULT} 
     */
    GetUDTKind(udtKind) {
        result := ComCall(37, this, "int*", udtKind, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
