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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetLocaleInfo", "GetLocaleInfo", "SetControlInfo", "GetControlInfo", "LoadExternalStemmerData"]

    /**
     * 
     * @param {Integer} dwCodePageID 
     * @param {Integer} lcid 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/infotech/nf-infotech-istemmerconfig-setlocaleinfo
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
        result := ComCall(4, this, "uint*", pdwCodePageID, "uint*", plcid, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} grfStemFlags 
     * @param {Integer} dwReserved 
     * @returns {HRESULT} 
     */
    SetControlInfo(grfStemFlags, dwReserved) {
        result := ComCall(5, this, "uint", grfStemFlags, "uint", dwReserved, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pgrfStemFlags 
     * @param {Pointer<Integer>} pdwReserved 
     * @returns {HRESULT} 
     */
    GetControlInfo(pgrfStemFlags, pdwReserved) {
        result := ComCall(6, this, "uint*", pgrfStemFlags, "uint*", pdwReserved, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IStream} pStream 
     * @param {Integer} dwExtDataType 
     * @returns {HRESULT} 
     */
    LoadExternalStemmerData(pStream, dwExtDataType) {
        result := ComCall(7, this, "ptr", pStream, "uint", dwExtDataType, "HRESULT")
        return result
    }
}
