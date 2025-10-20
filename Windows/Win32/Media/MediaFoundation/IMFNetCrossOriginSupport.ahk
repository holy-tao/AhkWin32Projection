#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Implemented by clients that want to enforce a cross origin policy for HTML5 media downloads.
 * @remarks
 * 
  * The Media Foundation network code uses these client callbacks to implement and enforce cross origin downloads.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/nn-mfidl-imfnetcrossoriginsupport
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFNetCrossOriginSupport extends IUnknown{
    /**
     * The interface identifier for IMFNetCrossOriginSupport
     * @type {Guid}
     */
    static IID => Guid("{bc2b7d44-a72d-49d5-8376-1480dee58b22}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<Int32>} pPolicy 
     * @returns {HRESULT} 
     */
    GetCrossOriginPolicy(pPolicy) {
        result := ComCall(3, this, "int*", pPolicy, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} wszSourceOrigin 
     * @returns {HRESULT} 
     */
    GetSourceOrigin(wszSourceOrigin) {
        result := ComCall(4, this, "ptr", wszSourceOrigin, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} wszURL 
     * @param {Pointer<BOOL>} pfIsSameOrigin 
     * @returns {HRESULT} 
     */
    IsSameOrigin(wszURL, pfIsSameOrigin) {
        wszURL := wszURL is String ? StrPtr(wszURL) : wszURL

        result := ComCall(5, this, "ptr", wszURL, "ptr", pfIsSameOrigin, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
