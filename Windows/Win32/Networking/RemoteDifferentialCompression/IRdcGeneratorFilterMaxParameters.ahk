#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Sets and retrieves parameters used by the FilterMax generator.
 * @see https://docs.microsoft.com/windows/win32/api//msrdc/nn-msrdc-irdcgeneratorfiltermaxparameters
 * @namespace Windows.Win32.Networking.RemoteDifferentialCompression
 * @version v4.0.30319
 */
class IRdcGeneratorFilterMaxParameters extends IUnknown{
    /**
     * The interface identifier for IRdcGeneratorFilterMaxParameters
     * @type {Guid}
     */
    static IID => Guid("{96236a72-9dbc-11da-9e3f-0011114ae311}")

    /**
     * The class identifier for RdcGeneratorFilterMaxParameters
     * @type {Guid}
     */
    static CLSID => Guid("{96236a87-9dbc-11da-9e3f-0011114ae311}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<UInt32>} horizonSize 
     * @returns {HRESULT} 
     */
    GetHorizonSize(horizonSize) {
        result := ComCall(3, this, "uint*", horizonSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} horizonSize 
     * @returns {HRESULT} 
     */
    SetHorizonSize(horizonSize) {
        result := ComCall(4, this, "uint", horizonSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} hashWindowSize 
     * @returns {HRESULT} 
     */
    GetHashWindowSize(hashWindowSize) {
        result := ComCall(5, this, "uint*", hashWindowSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} hashWindowSize 
     * @returns {HRESULT} 
     */
    SetHashWindowSize(hashWindowSize) {
        result := ComCall(6, this, "uint", hashWindowSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
