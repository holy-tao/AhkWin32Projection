#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include .\IDebugHostSymbol.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IDebugHostData extends IDebugHostSymbol{
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

    /**
     * 
     * @param {Pointer<VARIANT>} value 
     * @returns {HRESULT} 
     */
    GetValue(value) {
        result := ComCall(12, this, "ptr", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
