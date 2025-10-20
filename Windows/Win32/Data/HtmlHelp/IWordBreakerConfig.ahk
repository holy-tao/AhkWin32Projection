#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Data.HtmlHelp
 * @version v4.0.30319
 */
class IWordBreakerConfig extends IUnknown{
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
     * 
     * @param {Integer} dwCodePageID 
     * @param {Integer} lcid 
     * @returns {HRESULT} 
     */
    SetLocaleInfo(dwCodePageID, lcid) {
        result := ComCall(3, this, "uint", dwCodePageID, "uint", lcid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwCodePageID 
     * @param {Pointer<UInt32>} plcid 
     * @returns {HRESULT} 
     */
    GetLocaleInfo(pdwCodePageID, plcid) {
        result := ComCall(4, this, "uint*", pdwCodePageID, "uint*", plcid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwBreakWordType 
     * @returns {HRESULT} 
     */
    SetBreakWordType(dwBreakWordType) {
        result := ComCall(5, this, "uint", dwBreakWordType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwBreakWordType 
     * @returns {HRESULT} 
     */
    GetBreakWordType(pdwBreakWordType) {
        result := ComCall(6, this, "uint*", pdwBreakWordType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} grfBreakFlags 
     * @param {Integer} dwReserved 
     * @returns {HRESULT} 
     */
    SetControlInfo(grfBreakFlags, dwReserved) {
        result := ComCall(7, this, "uint", grfBreakFlags, "uint", dwReserved, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pgrfBreakFlags 
     * @param {Pointer<UInt32>} pdwReserved 
     * @returns {HRESULT} 
     */
    GetControlInfo(pgrfBreakFlags, pdwReserved) {
        result := ComCall(8, this, "uint*", pgrfBreakFlags, "uint*", pdwReserved, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IStream>} pStream 
     * @param {Integer} dwExtDataType 
     * @returns {HRESULT} 
     */
    LoadExternalBreakerData(pStream, dwExtDataType) {
        result := ComCall(9, this, "ptr", pStream, "uint", dwExtDataType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} rclsid 
     * @param {Pointer<IStemmer>} pStemmer 
     * @returns {HRESULT} 
     */
    SetWordStemmer(rclsid, pStemmer) {
        result := ComCall(10, this, "ptr", rclsid, "ptr", pStemmer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IStemmer>} ppStemmer 
     * @returns {HRESULT} 
     */
    GetWordStemmer(ppStemmer) {
        result := ComCall(11, this, "ptr", ppStemmer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
