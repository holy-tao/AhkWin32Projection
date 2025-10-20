#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IAutoComplete.ahk

/**
 * Extends IAutoComplete. This interface enables clients of the autocomplete object to retrieve and set a number of options that control how autocompletion operates.
 * @remarks
 * 
  * This interface also provides the methods of the <a href="https://docs.microsoft.com/windows/desktop/api/shldisp/nn-shldisp-iautocomplete">IAutoComplete</a> interface from which it inherits.
  * 
  * <h3><a id="When_to_Implement"></a><a id="when_to_implement"></a><a id="WHEN_TO_IMPLEMENT"></a>When to Implement</h3>
  * This interface is not usually implemented by applications. It is exposed by the Shell's autocomplete object.
  * 
  * <h3><a id="When_to_Use"></a><a id="when_to_use"></a><a id="WHEN_TO_USE"></a>When to Use</h3>
  * Use this interface when you need to retrieve or set autocomplete options. The list of available options is given in the method references.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//shldisp/nn-shldisp-iautocomplete2
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IAutoComplete2 extends IAutoComplete{
    /**
     * The interface identifier for IAutoComplete2
     * @type {Guid}
     */
    static IID => Guid("{eac04bc0-3791-11d2-bb95-0060977b464c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 5

    /**
     * 
     * @param {Integer} dwFlag 
     * @returns {HRESULT} 
     */
    SetOptions(dwFlag) {
        result := ComCall(5, this, "uint", dwFlag, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwFlag 
     * @returns {HRESULT} 
     */
    GetOptions(pdwFlag) {
        result := ComCall(6, this, "uint*", pdwFlag, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
