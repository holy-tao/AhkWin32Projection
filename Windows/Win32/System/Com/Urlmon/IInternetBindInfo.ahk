#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 * @version v4.0.30319
 */
class IInternetBindInfo extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInternetBindInfo
     * @type {Guid}
     */
    static IID => Guid("{79eac9e1-baf9-11ce-8c82-00aa004ba90b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetBindInfo", "GetBindString"]

    /**
     * 
     * @param {Pointer<Integer>} grfBINDF 
     * @param {Pointer<BINDINFO>} pbindinfo 
     * @returns {HRESULT} 
     */
    GetBindInfo(grfBINDF, pbindinfo) {
        result := ComCall(3, this, "uint*", grfBINDF, "ptr", pbindinfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulStringType 
     * @param {Pointer<PWSTR>} ppwzStr 
     * @param {Integer} cEl 
     * @param {Pointer<Integer>} pcElFetched 
     * @returns {HRESULT} 
     */
    GetBindString(ulStringType, ppwzStr, cEl, pcElFetched) {
        result := ComCall(4, this, "uint", ulStringType, "ptr", ppwzStr, "uint", cEl, "uint*", pcElFetched, "HRESULT")
        return result
    }
}
