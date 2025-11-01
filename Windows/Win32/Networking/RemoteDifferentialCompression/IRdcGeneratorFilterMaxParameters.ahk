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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetHorizonSize", "SetHorizonSize", "GetHashWindowSize", "SetHashWindowSize"]

    /**
     * 
     * @param {Pointer<Integer>} horizonSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msrdc/nf-msrdc-irdcgeneratorfiltermaxparameters-gethorizonsize
     */
    GetHorizonSize(horizonSize) {
        horizonSizeMarshal := horizonSize is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, horizonSizeMarshal, horizonSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} horizonSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msrdc/nf-msrdc-irdcgeneratorfiltermaxparameters-sethorizonsize
     */
    SetHorizonSize(horizonSize) {
        result := ComCall(4, this, "uint", horizonSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} hashWindowSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msrdc/nf-msrdc-irdcgeneratorfiltermaxparameters-gethashwindowsize
     */
    GetHashWindowSize(hashWindowSize) {
        hashWindowSizeMarshal := hashWindowSize is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, hashWindowSizeMarshal, hashWindowSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} hashWindowSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msrdc/nf-msrdc-irdcgeneratorfiltermaxparameters-sethashwindowsize
     */
    SetHashWindowSize(hashWindowSize) {
        result := ComCall(6, this, "uint", hashWindowSize, "HRESULT")
        return result
    }
}
