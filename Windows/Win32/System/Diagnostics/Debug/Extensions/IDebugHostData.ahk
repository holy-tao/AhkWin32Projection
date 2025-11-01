#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include .\IDebugHostSymbol.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IDebugHostData extends IDebugHostSymbol{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDebugHostData
     * @type {Guid}
     */
    static IID => Guid("{a3d64993-826c-44fa-897d-926f2fe7ad0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 10

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetLocationKind", "GetLocation", "GetValue"]

    /**
     * 
     * @param {Pointer<Integer>} locationKind 
     * @returns {HRESULT} 
     */
    GetLocationKind(locationKind) {
        result := ComCall(10, this, "int*", locationKind, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Location>} location 
     * @returns {HRESULT} 
     */
    GetLocation(location) {
        result := ComCall(11, this, "ptr", location, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} value 
     * @returns {HRESULT} 
     */
    GetValue(value) {
        result := ComCall(12, this, "ptr", value, "HRESULT")
        return result
    }
}
