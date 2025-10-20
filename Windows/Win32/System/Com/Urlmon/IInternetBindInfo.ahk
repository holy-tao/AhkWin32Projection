#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 * @version v4.0.30319
 */
class IInternetBindInfo extends IUnknown{
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
     * 
     * @param {Pointer<UInt32>} grfBINDF 
     * @param {Pointer<BINDINFO>} pbindinfo 
     * @returns {HRESULT} 
     */
    GetBindInfo(grfBINDF, pbindinfo) {
        result := ComCall(3, this, "uint*", grfBINDF, "ptr", pbindinfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulStringType 
     * @param {Pointer<PWSTR>} ppwzStr 
     * @param {Integer} cEl 
     * @param {Pointer<UInt32>} pcElFetched 
     * @returns {HRESULT} 
     */
    GetBindString(ulStringType, ppwzStr, cEl, pcElFetched) {
        result := ComCall(4, this, "uint", ulStringType, "ptr", ppwzStr, "uint", cEl, "uint*", pcElFetched, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
