#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLEventObj3 extends IDispatch{
    /**
     * The interface identifier for IHTMLEventObj3
     * @type {Guid}
     */
    static IID => Guid("{3050f680-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} p 
     * @returns {HRESULT} 
     */
    get_contentOverflow(p) {
        result := ComCall(7, this, "ptr", p, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} v 
     * @returns {HRESULT} 
     */
    put_shiftLeft(v) {
        result := ComCall(8, this, "short", v, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} p 
     * @returns {HRESULT} 
     */
    get_shiftLeft(p) {
        result := ComCall(9, this, "ptr", p, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} v 
     * @returns {HRESULT} 
     */
    put_altLeft(v) {
        result := ComCall(10, this, "short", v, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} p 
     * @returns {HRESULT} 
     */
    get_altLeft(p) {
        result := ComCall(11, this, "ptr", p, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} v 
     * @returns {HRESULT} 
     */
    put_ctrlLeft(v) {
        result := ComCall(12, this, "short", v, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} p 
     * @returns {HRESULT} 
     */
    get_ctrlLeft(p) {
        result := ComCall(13, this, "ptr", p, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IntPtr>} p 
     * @returns {HRESULT} 
     */
    get_imeCompositionChange(p) {
        result := ComCall(14, this, "ptr*", p, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IntPtr>} p 
     * @returns {HRESULT} 
     */
    get_imeNotifyCommand(p) {
        result := ComCall(15, this, "ptr*", p, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IntPtr>} p 
     * @returns {HRESULT} 
     */
    get_imeNotifyData(p) {
        result := ComCall(16, this, "ptr*", p, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IntPtr>} p 
     * @returns {HRESULT} 
     */
    get_imeRequest(p) {
        result := ComCall(17, this, "ptr*", p, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IntPtr>} p 
     * @returns {HRESULT} 
     */
    get_imeRequestData(p) {
        result := ComCall(18, this, "ptr*", p, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IntPtr>} p 
     * @returns {HRESULT} 
     */
    get_keyboardLayout(p) {
        result := ComCall(19, this, "ptr*", p, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} p 
     * @returns {HRESULT} 
     */
    get_behaviorCookie(p) {
        result := ComCall(20, this, "int*", p, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} p 
     * @returns {HRESULT} 
     */
    get_behaviorPart(p) {
        result := ComCall(21, this, "int*", p, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_nextPage(p) {
        result := ComCall(22, this, "ptr", p, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
