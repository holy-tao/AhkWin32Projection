#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ITfUIElement.ahk

/**
 * The ITfCandidateListUIElement interface is implemented by a text service that has a UI for reading information UI at the near caret.
 * @see https://docs.microsoft.com/windows/win32/api//msctf/nn-msctf-itfreadinginformationuielement
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfReadingInformationUIElement extends ITfUIElement{
    /**
     * The interface identifier for ITfReadingInformationUIElement
     * @type {Guid}
     */
    static IID => Guid("{ea1ea139-19df-11d7-a6d2-00065b84435c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<UInt32>} pdwFlags 
     * @returns {HRESULT} 
     */
    GetUpdatedFlags(pdwFlags) {
        result := ComCall(7, this, "uint*", pdwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITfContext>} ppic 
     * @returns {HRESULT} 
     */
    GetContext(ppic) {
        result := ComCall(8, this, "ptr", ppic, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pstr 
     * @returns {HRESULT} 
     */
    GetString(pstr) {
        result := ComCall(9, this, "ptr", pstr, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pcchMax 
     * @returns {HRESULT} 
     */
    GetMaxReadingStringLength(pcchMax) {
        result := ComCall(10, this, "uint*", pcchMax, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pErrorIndex 
     * @returns {HRESULT} 
     */
    GetErrorIndex(pErrorIndex) {
        result := ComCall(11, this, "uint*", pErrorIndex, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfVertical 
     * @returns {HRESULT} 
     */
    IsVerticalOrderPreferred(pfVertical) {
        result := ComCall(12, this, "ptr", pfVertical, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
