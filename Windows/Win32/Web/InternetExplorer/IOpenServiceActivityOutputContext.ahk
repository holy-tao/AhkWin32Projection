#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 * @version v4.0.30319
 */
class IOpenServiceActivityOutputContext extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Navigate", "CanNavigate"]

    /**
     * 
     * @param {PWSTR} pwzUri 
     * @param {PWSTR} pwzMethod 
     * @param {PWSTR} pwzHeaders 
     * @param {IStream} pPostData 
     * @returns {HRESULT} 
     */
    Navigate(pwzUri, pwzMethod, pwzHeaders, pPostData) {
        pwzUri := pwzUri is String ? StrPtr(pwzUri) : pwzUri
        pwzMethod := pwzMethod is String ? StrPtr(pwzMethod) : pwzMethod
        pwzHeaders := pwzHeaders is String ? StrPtr(pwzHeaders) : pwzHeaders

        result := ComCall(3, this, "ptr", pwzUri, "ptr", pwzMethod, "ptr", pwzHeaders, "ptr", pPostData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwzUri 
     * @param {PWSTR} pwzMethod 
     * @param {PWSTR} pwzHeaders 
     * @param {IStream} pPostData 
     * @returns {BOOL} 
     */
    CanNavigate(pwzUri, pwzMethod, pwzHeaders, pPostData) {
        pwzUri := pwzUri is String ? StrPtr(pwzUri) : pwzUri
        pwzMethod := pwzMethod is String ? StrPtr(pwzMethod) : pwzMethod
        pwzHeaders := pwzHeaders is String ? StrPtr(pwzHeaders) : pwzHeaders

        result := ComCall(4, this, "ptr", pwzUri, "ptr", pwzMethod, "ptr", pwzHeaders, "ptr", pPostData, "int*", &pfCanNavigate := 0, "HRESULT")
        return pfCanNavigate
    }
}
