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
     * 
     * @param {Pointer<Int32>} phr 
     * @returns {HRESULT} 
     */
    get_errorCode(phr) {
        result := ComCall(7, this, "int*", phr, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrDescription 
     * @returns {HRESULT} 
     */
    get_errorDescription(pbstrDescription) {
        result := ComCall(8, this, "ptr", pbstrDescription, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvarContext 
     * @returns {HRESULT} 
     */
    get_errorContext(pvarContext) {
        result := ComCall(9, this, "ptr", pvarContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plRemedy 
     * @returns {HRESULT} 
     */
    get_remedy(plRemedy) {
        result := ComCall(10, this, "int*", plRemedy, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrCustomUrl 
     * @returns {HRESULT} 
     */
    get_customUrl(pbstrCustomUrl) {
        result := ComCall(11, this, "ptr", pbstrCustomUrl, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
