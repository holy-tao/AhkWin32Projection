#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * The IWbemStatusCodeText interface extracts text string descriptions of error codes or the name of the subsystem where the error occurred.
 * @see https://docs.microsoft.com/windows/win32/api//wbemcli/nn-wbemcli-iwbemstatuscodetext
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class IWbemStatusCodeText extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWbemStatusCodeText
     * @type {Guid}
     */
    static IID => Guid("{eb87e1bc-3233-11d2-aec9-00c04fb68820}")

    /**
     * The class identifier for WbemStatusCodeText
     * @type {Guid}
     */
    static CLSID => Guid("{eb87e1bd-3233-11d2-aec9-00c04fb68820}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetErrorCodeText", "GetFacilityCodeText"]

    /**
     * 
     * @param {HRESULT} hRes 
     * @param {Integer} LocaleId 
     * @param {Integer} lFlags 
     * @param {Pointer<BSTR>} MessageText 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wbemcli/nf-wbemcli-iwbemstatuscodetext-geterrorcodetext
     */
    GetErrorCodeText(hRes, LocaleId, lFlags, MessageText) {
        result := ComCall(3, this, "int", hRes, "uint", LocaleId, "int", lFlags, "ptr", MessageText, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HRESULT} hRes 
     * @param {Integer} LocaleId 
     * @param {Integer} lFlags 
     * @param {Pointer<BSTR>} MessageText 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wbemcli/nf-wbemcli-iwbemstatuscodetext-getfacilitycodetext
     */
    GetFacilityCodeText(hRes, LocaleId, lFlags, MessageText) {
        result := ComCall(4, this, "int", hRes, "uint", LocaleId, "int", lFlags, "ptr", MessageText, "HRESULT")
        return result
    }
}
