#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include .\IDebugHostSymbol.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IDebugHostPublic extends IDebugHostSymbol{
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
     * 
     * @param {Pointer<Int32>} locationKind 
     * @returns {HRESULT} 
     */
    GetLocationKind(locationKind) {
        result := ComCall(10, this, "int*", locationKind, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Location>} location 
     * @returns {HRESULT} 
     */
    GetLocation(location) {
        result := ComCall(11, this, "ptr", location, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
