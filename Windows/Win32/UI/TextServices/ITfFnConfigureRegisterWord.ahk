#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\ITfFunction.ahk

/**
 * The ITfFnConfigureRegisterWord interface is implemented by a text service to enable the Active Input Method Editor (IME) to cause the text service to display a word registration dialog box.
 * @see https://docs.microsoft.com/windows/win32/api//ctffunc/nn-ctffunc-itffnconfigureregisterword
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfFnConfigureRegisterWord extends ITfFunction{
    /**
     * The interface identifier for ITfFnConfigureRegisterWord
     * @type {Guid}
     */
    static IID => Guid("{bb95808a-6d8f-4bca-8400-5390b586aedf}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * 
     * @param {HWND} hwndParent 
     * @param {Integer} langid 
     * @param {Pointer<Guid>} rguidProfile 
     * @param {BSTR} bstrRegistered 
     * @returns {HRESULT} 
     */
    Show(hwndParent, langid, rguidProfile, bstrRegistered) {
        hwndParent := hwndParent is Win32Handle ? NumGet(hwndParent, "ptr") : hwndParent
        bstrRegistered := bstrRegistered is String ? BSTR.Alloc(bstrRegistered).Value : bstrRegistered

        result := ComCall(4, this, "ptr", hwndParent, "ushort", langid, "ptr", rguidProfile, "ptr", bstrRegistered, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
