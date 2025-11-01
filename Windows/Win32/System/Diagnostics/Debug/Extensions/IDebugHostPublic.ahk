#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include .\IDebugHostSymbol.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IDebugHostPublic extends IDebugHostSymbol{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDebugHostPublic
     * @type {Guid}
     */
    static IID => Guid("{6c597ac9-fb4d-4f6d-9f39-22488539f8f4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 10

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetLocationKind", "GetLocation"]

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
     * @param {Pointer<Location>} location 
     * @returns {HRESULT} 
     */
    GetLocation(location) {
        result := ComCall(11, this, "ptr", location, "HRESULT")
        return result
    }
}
