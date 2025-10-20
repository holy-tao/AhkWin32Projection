#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Use this interface to provide configuration information that controls stemming.
 * @see https://docs.microsoft.com/windows/win32/api//infotech/nn-infotech-istemmerconfig
 * @namespace Windows.Win32.Data.HtmlHelp
 * @version v4.0.30319
 */
class IStemmerConfig extends IUnknown{
    /**
     * The interface identifier for IStemmerConfig
     * @type {Guid}
     */
    static IID => Guid("{8fa0d5a7-dedf-11d0-9a61-00c04fb68bf7}")

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
     * @param {Integer} grfStemFlags 
     * @param {Integer} dwReserved 
     * @returns {HRESULT} 
     */
    SetControlInfo(grfStemFlags, dwReserved) {
        result := ComCall(5, this, "uint", grfStemFlags, "uint", dwReserved, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pgrfStemFlags 
     * @param {Pointer<UInt32>} pdwReserved 
     * @returns {HRESULT} 
     */
    GetControlInfo(pgrfStemFlags, pdwReserved) {
        result := ComCall(6, this, "uint*", pgrfStemFlags, "uint*", pdwReserved, "int")
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
    LoadExternalStemmerData(pStream, dwExtDataType) {
        result := ComCall(7, this, "ptr", pStream, "uint", dwExtDataType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
