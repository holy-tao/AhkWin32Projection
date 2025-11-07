#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Search\IStemmer.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Data.HtmlHelp
 * @version v4.0.30319
 */
class IWordBreakerConfig extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWordBreakerConfig
     * @type {Guid}
     */
    static IID => Guid("{8fa0d5a6-dedf-11d0-9a61-00c04fb68bf7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetLocaleInfo", "GetLocaleInfo", "SetBreakWordType", "GetBreakWordType", "SetControlInfo", "GetControlInfo", "LoadExternalBreakerData", "SetWordStemmer", "GetWordStemmer"]

    /**
     * 
     * @param {Integer} dwCodePageID 
     * @param {Integer} lcid 
     * @returns {HRESULT} 
     */
    SetLocaleInfo(dwCodePageID, lcid) {
        result := ComCall(3, this, "uint", dwCodePageID, "uint", lcid, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwCodePageID 
     * @param {Pointer<Integer>} plcid 
     * @returns {HRESULT} 
     */
    GetLocaleInfo(pdwCodePageID, plcid) {
        pdwCodePageIDMarshal := pdwCodePageID is VarRef ? "uint*" : "ptr"
        plcidMarshal := plcid is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, pdwCodePageIDMarshal, pdwCodePageID, plcidMarshal, plcid, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwBreakWordType 
     * @returns {HRESULT} 
     */
    SetBreakWordType(dwBreakWordType) {
        result := ComCall(5, this, "uint", dwBreakWordType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwBreakWordType 
     * @returns {HRESULT} 
     */
    GetBreakWordType(pdwBreakWordType) {
        pdwBreakWordTypeMarshal := pdwBreakWordType is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, pdwBreakWordTypeMarshal, pdwBreakWordType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} grfBreakFlags 
     * @param {Integer} dwReserved 
     * @returns {HRESULT} 
     */
    SetControlInfo(grfBreakFlags, dwReserved) {
        result := ComCall(7, this, "uint", grfBreakFlags, "uint", dwReserved, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pgrfBreakFlags 
     * @param {Pointer<Integer>} pdwReserved 
     * @returns {HRESULT} 
     */
    GetControlInfo(pgrfBreakFlags, pdwReserved) {
        pgrfBreakFlagsMarshal := pgrfBreakFlags is VarRef ? "uint*" : "ptr"
        pdwReservedMarshal := pdwReserved is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, pgrfBreakFlagsMarshal, pgrfBreakFlags, pdwReservedMarshal, pdwReserved, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IStream} pStream 
     * @param {Integer} dwExtDataType 
     * @returns {HRESULT} 
     */
    LoadExternalBreakerData(pStream, dwExtDataType) {
        result := ComCall(9, this, "ptr", pStream, "uint", dwExtDataType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} rclsid 
     * @param {IStemmer} pStemmer 
     * @returns {HRESULT} 
     */
    SetWordStemmer(rclsid, pStemmer) {
        result := ComCall(10, this, "ptr", rclsid, "ptr", pStemmer, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IStemmer} 
     */
    GetWordStemmer() {
        result := ComCall(11, this, "ptr*", &ppStemmer := 0, "HRESULT")
        return IStemmer(ppStemmer)
    }
}
