#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include .\IDebugHostSymbol.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IDebugHostField extends IDebugHostSymbol{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDebugHostField
     * @type {Guid}
     */
    static IID => Guid("{e06f6495-16bc-4cc9-b11d-2a6b23fa72f3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 10

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetLocationKind", "GetOffset", "GetLocation", "GetValue"]

    /**
     * 
     * @param {Pointer<Integer>} locationKind 
     * @returns {HRESULT} 
     */
    GetLocationKind(locationKind) {
        locationKindMarshal := locationKind is VarRef ? "int*" : "ptr"

        result := ComCall(10, this, locationKindMarshal, locationKind, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} offset 
     * @returns {HRESULT} 
     */
    GetOffset(offset) {
        offsetMarshal := offset is VarRef ? "uint*" : "ptr"

        result := ComCall(11, this, offsetMarshal, offset, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Location>} location 
     * @returns {HRESULT} 
     */
    GetLocation(location) {
        result := ComCall(12, this, "ptr", location, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} value 
     * @returns {HRESULT} 
     */
    GetValue(value) {
        result := ComCall(13, this, "ptr", value, "HRESULT")
        return result
    }
}
