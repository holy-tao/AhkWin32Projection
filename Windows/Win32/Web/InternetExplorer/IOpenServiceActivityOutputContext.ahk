#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 * @version v4.0.30319
 */
class IOpenServiceActivityOutputContext extends IUnknown{
    /**
     * The interface identifier for IOpenServiceActivityOutputContext
     * @type {Guid}
     */
    static IID => Guid("{e289deab-f709-49a9-b99e-282364074571}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {PWSTR} pwzUri 
     * @param {PWSTR} pwzMethod 
     * @param {PWSTR} pwzHeaders 
     * @param {Pointer<IStream>} pPostData 
     * @returns {HRESULT} 
     */
    Navigate(pwzUri, pwzMethod, pwzHeaders, pPostData) {
        pwzUri := pwzUri is String ? StrPtr(pwzUri) : pwzUri
        pwzMethod := pwzMethod is String ? StrPtr(pwzMethod) : pwzMethod
        pwzHeaders := pwzHeaders is String ? StrPtr(pwzHeaders) : pwzHeaders

        result := ComCall(3, this, "ptr", pwzUri, "ptr", pwzMethod, "ptr", pwzHeaders, "ptr", pPostData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pwzUri 
     * @param {PWSTR} pwzMethod 
     * @param {PWSTR} pwzHeaders 
     * @param {Pointer<IStream>} pPostData 
     * @param {Pointer<BOOL>} pfCanNavigate 
     * @returns {HRESULT} 
     */
    CanNavigate(pwzUri, pwzMethod, pwzHeaders, pPostData, pfCanNavigate) {
        pwzUri := pwzUri is String ? StrPtr(pwzUri) : pwzUri
        pwzMethod := pwzMethod is String ? StrPtr(pwzMethod) : pwzMethod
        pwzHeaders := pwzHeaders is String ? StrPtr(pwzHeaders) : pwzHeaders

        result := ComCall(4, this, "ptr", pwzUri, "ptr", pwzMethod, "ptr", pwzHeaders, "ptr", pPostData, "ptr", pfCanNavigate, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
