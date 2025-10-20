#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IUnknown.ahk

/**
 * The IWbemObjectTextSrc interface is used to translate IWbemClassObject instances to and from differing text formats.
 * @see https://docs.microsoft.com/windows/win32/api//wbemcli/nn-wbemcli-iwbemobjecttextsrc
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class IWbemObjectTextSrc extends IUnknown{
    /**
     * The interface identifier for IWbemObjectTextSrc
     * @type {Guid}
     */
    static IID => Guid("{bfbf883a-cad7-11d3-a11b-00105a1f515a}")

    /**
     * The class identifier for WbemObjectTextSrc
     * @type {Guid}
     */
    static CLSID => Guid("{8d1c559d-84f0-4bb3-a7d5-56a7435a9ba6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} lFlags 
     * @param {Pointer<IWbemClassObject>} pObj 
     * @param {Integer} uObjTextFormat 
     * @param {Pointer<IWbemContext>} pCtx 
     * @param {Pointer<BSTR>} strText 
     * @returns {HRESULT} 
     */
    GetText(lFlags, pObj, uObjTextFormat, pCtx, strText) {
        result := ComCall(3, this, "int", lFlags, "ptr", pObj, "uint", uObjTextFormat, "ptr", pCtx, "ptr", strText, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lFlags 
     * @param {BSTR} strText 
     * @param {Integer} uObjTextFormat 
     * @param {Pointer<IWbemContext>} pCtx 
     * @param {Pointer<IWbemClassObject>} pNewObj 
     * @returns {HRESULT} 
     */
    CreateFromText(lFlags, strText, uObjTextFormat, pCtx, pNewObj) {
        strText := strText is String ? BSTR.Alloc(strText).Value : strText

        result := ComCall(4, this, "int", lFlags, "ptr", strText, "uint", uObjTextFormat, "ptr", pCtx, "ptr", pNewObj, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
