#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IWMPErrorItem interface provides a way to access error information.
 * @see https://docs.microsoft.com/windows/win32/api//wmp/nn-wmp-iwmperroritem
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IWMPErrorItem extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMPErrorItem
     * @type {Guid}
     */
    static IID => Guid("{3614c646-3b3b-4de7-a81e-930e3f2127b3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_errorCode", "get_errorDescription", "get_errorContext", "get_remedy", "get_customUrl"]

    /**
     * 
     * @param {Pointer<Integer>} phr 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmperroritem-get_errorcode
     */
    get_errorCode(phr) {
        result := ComCall(7, this, "int*", phr, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrDescription 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmperroritem-get_errordescription
     */
    get_errorDescription(pbstrDescription) {
        result := ComCall(8, this, "ptr", pbstrDescription, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvarContext 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmperroritem-get_errorcontext
     */
    get_errorContext(pvarContext) {
        result := ComCall(9, this, "ptr", pvarContext, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plRemedy 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmperroritem-get_remedy
     */
    get_remedy(plRemedy) {
        result := ComCall(10, this, "int*", plRemedy, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrCustomUrl 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmperroritem-get_customurl
     */
    get_customUrl(pbstrCustomUrl) {
        result := ComCall(11, this, "ptr", pbstrCustomUrl, "HRESULT")
        return result
    }
}
