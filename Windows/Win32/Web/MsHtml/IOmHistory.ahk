#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IOmHistory extends IDispatch{
    /**
     * The interface identifier for IOmHistory
     * @type {Guid}
     */
    static IID => Guid("{feceaaa2-8405-11cf-8ba1-00aa00476da6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<Int16>} p 
     * @returns {HRESULT} 
     */
    get_length(p) {
        result := ComCall(7, this, "short*", p, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvargdistance 
     * @returns {HRESULT} 
     */
    back(pvargdistance) {
        result := ComCall(8, this, "ptr", pvargdistance, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvargdistance 
     * @returns {HRESULT} 
     */
    forward(pvargdistance) {
        result := ComCall(9, this, "ptr", pvargdistance, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvargdistance 
     * @returns {HRESULT} 
     */
    go(pvargdistance) {
        result := ComCall(10, this, "ptr", pvargdistance, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
