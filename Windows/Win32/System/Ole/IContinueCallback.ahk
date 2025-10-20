#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Provides a generic callback mechanism for interruptible processes that should periodically ask an object whether to continue.
 * @see https://docs.microsoft.com/windows/win32/api//docobj/nn-docobj-icontinuecallback
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class IContinueCallback extends IUnknown{
    /**
     * The interface identifier for IContinueCallback
     * @type {Guid}
     */
    static IID => Guid("{b722bcca-4e68-101b-a2bc-00aa00404770}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @returns {HRESULT} 
     */
    FContinue() {
        result := ComCall(3, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} nCntPrinted 
     * @param {Integer} nCurPage 
     * @param {PWSTR} pwszPrintStatus 
     * @returns {HRESULT} 
     */
    FContinuePrinting(nCntPrinted, nCurPage, pwszPrintStatus) {
        pwszPrintStatus := pwszPrintStatus is String ? StrPtr(pwszPrintStatus) : pwszPrintStatus

        result := ComCall(4, this, "int", nCntPrinted, "int", nCurPage, "ptr", pwszPrintStatus, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
