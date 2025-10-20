#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLXDomainRequestFactory extends IDispatch{
    /**
     * The interface identifier for IHTMLXDomainRequestFactory
     * @type {Guid}
     */
    static IID => Guid("{30510456-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<IHTMLXDomainRequest>} __MIDL__IHTMLXDomainRequestFactory0000 
     * @returns {HRESULT} 
     */
    create(__MIDL__IHTMLXDomainRequestFactory0000) {
        result := ComCall(7, this, "ptr", __MIDL__IHTMLXDomainRequestFactory0000, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
