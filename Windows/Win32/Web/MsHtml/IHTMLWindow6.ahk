#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLWindow6 extends IDispatch{
    /**
     * The interface identifier for IHTMLWindow6
     * @type {Guid}
     */
    static IID => Guid("{30510453-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_XDomainRequest(v) {
        result := ComCall(7, this, "ptr", v, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_XDomainRequest(p) {
        result := ComCall(8, this, "ptr", p, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IHTMLStorage>} p 
     * @returns {HRESULT} 
     */
    get_sessionStorage(p) {
        result := ComCall(9, this, "ptr", p, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IHTMLStorage>} p 
     * @returns {HRESULT} 
     */
    get_localStorage(p) {
        result := ComCall(10, this, "ptr", p, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onhashchange(v) {
        result := ComCall(11, this, "ptr", v, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_onhashchange(p) {
        result := ComCall(12, this, "ptr", p, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} p 
     * @returns {HRESULT} 
     */
    get_maxConnectionsPerServer(p) {
        result := ComCall(13, this, "int*", p, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} msg 
     * @param {VARIANT} targetOrigin 
     * @returns {HRESULT} 
     */
    postMessage(msg, targetOrigin) {
        msg := msg is String ? BSTR.Alloc(msg).Value : msg

        result := ComCall(14, this, "ptr", msg, "ptr", targetOrigin, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrHTML 
     * @param {Pointer<BSTR>} pbstrStaticHTML 
     * @returns {HRESULT} 
     */
    toStaticHTML(bstrHTML, pbstrStaticHTML) {
        bstrHTML := bstrHTML is String ? BSTR.Alloc(bstrHTML).Value : bstrHTML

        result := ComCall(15, this, "ptr", bstrHTML, "ptr", pbstrStaticHTML, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onmessage(v) {
        result := ComCall(16, this, "ptr", v, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_onmessage(p) {
        result := ComCall(17, this, "ptr", p, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrProfilerMarkName 
     * @returns {HRESULT} 
     */
    msWriteProfilerMark(bstrProfilerMarkName) {
        bstrProfilerMarkName := bstrProfilerMarkName is String ? BSTR.Alloc(bstrProfilerMarkName).Value : bstrProfilerMarkName

        result := ComCall(18, this, "ptr", bstrProfilerMarkName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
