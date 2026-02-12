#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IAutoComplete.ahk

/**
 * Extends IAutoComplete. This interface enables clients of the autocomplete object to retrieve and set a number of options that control how autocompletion operates.
 * @remarks
 * This interface also provides the methods of the <a href="https://docs.microsoft.com/windows/desktop/api/shldisp/nn-shldisp-iautocomplete">IAutoComplete</a> interface from which it inherits.
 * 
 * <h3><a id="When_to_Implement"></a><a id="when_to_implement"></a><a id="WHEN_TO_IMPLEMENT"></a>When to Implement</h3>
 * This interface is not usually implemented by applications. It is exposed by the Shell's autocomplete object.
 * 
 * <h3><a id="When_to_Use"></a><a id="when_to_use"></a><a id="WHEN_TO_USE"></a>When to Use</h3>
 * Use this interface when you need to retrieve or set autocomplete options. The list of available options is given in the method references.
 * @see https://learn.microsoft.com/windows/win32/api//content/shldisp/nn-shldisp-iautocomplete2
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IAutoComplete2 extends IAutoComplete{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetOptions", "GetOptions"]

    /**
     * Sets the current autocomplete options. (IAutoComplete2.SetOptions)
     * @remarks
     * The TAB key is disabled by default because it is typically used to navigate from control to control, not within a control. If you set the <a href="https://docs.microsoft.com/windows/desktop/api/shldisp/ne-shldisp-autocompleteoptions">ACO_USETAB</a> flag in <i>dwFlag</i>, users can navigate to a string in the drop-down list by pressing the TAB key. If the drop-down list is closed, the TAB key allows the user to navigate from control to control, as usual. The user can close the drop-down list by pressing the ESC key.
     * @param {Integer} dwFlag Type: <b>DWORD</b>
     * 
     * One or more flags from the <a href="https://docs.microsoft.com/windows/desktop/api/shldisp/ne-shldisp-autocompleteoptions">AUTOCOMPLETEOPTIONS</a> enumeration that specify autocomplete options.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/shldisp/nf-shldisp-iautocomplete2-setoptions
     */
    SetOptions(dwFlag) {
        result := ComCall(5, this, "uint", dwFlag, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Gets the current autocomplete options. (IAutoComplete2.GetOptions)
     * @returns {Integer} Type: <b>DWORD*</b>
     * 
     * One or more flags from the <a href="https://docs.microsoft.com/windows/desktop/api/shldisp/ne-shldisp-autocompleteoptions">AUTOCOMPLETEOPTIONS</a> enumeration that indicate the options that are currently set.
     * @see https://learn.microsoft.com/windows/win32/api//content/shldisp/nf-shldisp-iautocomplete2-getoptions
     */
    GetOptions() {
        result := ComCall(6, this, "uint*", &pdwFlag := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pdwFlag
    }
}
