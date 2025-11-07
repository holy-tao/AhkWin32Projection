#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ITfFunction.ahk

/**
 * The ITfFnShowHelp interface is implemented by a text service to enable the language bar to place a help command for the text service in the language bar help menu.
 * @remarks
 * 
 * The TSF manager obtains this interface from the text service by calling the text service <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itffunctionprovider-getfunction">ITfFunctionProvider::GetFunction</a> interface with IID_ITfFnShowHelp.
 * 
 * The TSF manager obtains the help menu text by calling the text service's <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itffunction-getdisplayname">ITfFunction::GetDisplayName</a>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//ctffunc/nn-ctffunc-itffnshowhelp
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfFnShowHelp extends ITfFunction{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITfFnShowHelp
     * @type {Guid}
     */
    static IID => Guid("{5ab1d30c-094d-4c29-8ea5-0bf59be87bf3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Show"]

    /**
     * 
     * @param {HWND} hwndParent 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ctffunc/nf-ctffunc-itffnshowhelp-show
     */
    Show(hwndParent) {
        hwndParent := hwndParent is Win32Handle ? NumGet(hwndParent, "ptr") : hwndParent

        result := ComCall(4, this, "ptr", hwndParent, "HRESULT")
        return result
    }
}
