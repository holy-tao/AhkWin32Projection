#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include .\IDebugHostType3.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IDebugHostType4 extends IDebugHostType3{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetExtendedArrayHeaderSize", "GetExtendedArrayDimensions", "GetUDTKind"]

    /**
     * 
     * @param {Pointer<Integer>} headerSize 
     * @returns {HRESULT} 
     */
    GetExtendedArrayHeaderSize(headerSize) {
        headerSizeMarshal := headerSize is VarRef ? "uint*" : "ptr"

        result := ComCall(35, this, headerSizeMarshal, headerSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dimensions 
     * @param {Pointer<ExtendedArrayDimension>} pDimensions 
     * @returns {HRESULT} 
     */
    GetExtendedArrayDimensions(dimensions, pDimensions) {
        result := ComCall(36, this, "uint", dimensions, "ptr", pDimensions, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} udtKind 
     * @returns {HRESULT} 
     */
    GetUDTKind(udtKind) {
        udtKindMarshal := udtKind is VarRef ? "int*" : "ptr"

        result := ComCall(37, this, udtKindMarshal, udtKind, "HRESULT")
        return result
    }
}
