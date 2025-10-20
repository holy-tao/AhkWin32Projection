#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class IDBAsynchNotify extends IUnknown{
    /**
     * The interface identifier for IDBAsynchNotify
     * @type {Guid}
     */
    static IID => Guid("{0c733a96-2a1c-11ce-ade5-00aa0044773d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer} dwReserved 
     * @returns {HRESULT} 
     */
    OnLowResource(dwReserved) {
        result := ComCall(3, this, "ptr", dwReserved, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} hChapter 
     * @param {Integer} eOperation 
     * @param {Pointer} ulProgress 
     * @param {Pointer} ulProgressMax 
     * @param {Integer} eAsynchPhase 
     * @param {PWSTR} pwszStatusText 
     * @returns {HRESULT} 
     */
    OnProgress(hChapter, eOperation, ulProgress, ulProgressMax, eAsynchPhase, pwszStatusText) {
        pwszStatusText := pwszStatusText is String ? StrPtr(pwszStatusText) : pwszStatusText

        result := ComCall(4, this, "ptr", hChapter, "uint", eOperation, "ptr", ulProgress, "ptr", ulProgressMax, "uint", eAsynchPhase, "ptr", pwszStatusText, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} hChapter 
     * @param {Integer} eOperation 
     * @param {HRESULT} hrStatus 
     * @param {PWSTR} pwszStatusText 
     * @returns {HRESULT} 
     */
    OnStop(hChapter, eOperation, hrStatus, pwszStatusText) {
        pwszStatusText := pwszStatusText is String ? StrPtr(pwszStatusText) : pwszStatusText

        result := ComCall(5, this, "ptr", hChapter, "uint", eOperation, "int", hrStatus, "ptr", pwszStatusText, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
