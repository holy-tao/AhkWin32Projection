#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ITfFunction.ahk

/**
 * The ITfFnConfigure interface is implemented by a text service to enable the Text Services control panel application to allow the text service to display a configuration dialog box.
 * @see https://docs.microsoft.com/windows/win32/api//ctffunc/nn-ctffunc-itffnconfigure
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfFnConfigure extends ITfFunction{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITfFnConfigure
     * @type {Guid}
     */
    static IID => Guid("{88f567c6-1757-49f8-a1b2-89234c1eeff9}")

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
     * @param {Integer} langid 
     * @param {Pointer<Guid>} rguidProfile 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ctffunc/nf-ctffunc-itffnconfigure-show
     */
    Show(hwndParent, langid, rguidProfile) {
        hwndParent := hwndParent is Win32Handle ? NumGet(hwndParent, "ptr") : hwndParent

        result := ComCall(4, this, "ptr", hwndParent, "ushort", langid, "ptr", rguidProfile, "HRESULT")
        return result
    }
}
