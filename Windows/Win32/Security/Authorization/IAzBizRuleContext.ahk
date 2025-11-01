#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Contains information about a Business Rule (BizRule) operation.
 * @remarks
 * 
  * The <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazclientcontext-accesscheck">IAzClientContext::AccessCheck</a> method creates an <b>AzBizRuleContext</b> object before it calls a BizRule script.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//azroles/nn-azroles-iazbizrulecontext
 * @namespace Windows.Win32.Security.Authorization
 * @version v4.0.30319
 */
class IAzBizRuleContext extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAzBizRuleContext
     * @type {Guid}
     */
    static IID => Guid("{e192f17d-d59f-455e-a152-940316cd77b2}")

    /**
     * The class identifier for AzBizRuleContext
     * @type {Guid}
     */
    static CLSID => Guid("{5c2dc96f-8d51-434b-b33c-379bccae77c3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_BusinessRuleResult", "put_BusinessRuleString", "get_BusinessRuleString", "GetParameter"]

    /**
     * 
     * @param {BOOL} bResult 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazbizrulecontext-put_businessruleresult
     */
    put_BusinessRuleResult(bResult) {
        result := ComCall(7, this, "int", bResult, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrBusinessRuleString 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazbizrulecontext-put_businessrulestring
     */
    put_BusinessRuleString(bstrBusinessRuleString) {
        bstrBusinessRuleString := bstrBusinessRuleString is String ? BSTR.Alloc(bstrBusinessRuleString).Value : bstrBusinessRuleString

        result := ComCall(8, this, "ptr", bstrBusinessRuleString, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrBusinessRuleString 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazbizrulecontext-get_businessrulestring
     */
    get_BusinessRuleString(pbstrBusinessRuleString) {
        result := ComCall(9, this, "ptr", pbstrBusinessRuleString, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrParameterName 
     * @param {Pointer<VARIANT>} pvarParameterValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazbizrulecontext-getparameter
     */
    GetParameter(bstrParameterName, pvarParameterValue) {
        bstrParameterName := bstrParameterName is String ? BSTR.Alloc(bstrParameterName).Value : bstrParameterName

        result := ComCall(10, this, "ptr", bstrParameterName, "ptr", pvarParameterValue, "HRESULT")
        return result
    }
}
