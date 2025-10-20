#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\ITfFunction.ahk

/**
 * The ITfFnConfigureRegisterEudc interface is implemented by a text service to provide the UI to register the key sequence for the given EUDC.
 * @see https://docs.microsoft.com/windows/win32/api//ctffunc/nn-ctffunc-itffnconfigureregistereudc
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfFnConfigureRegisterEudc extends ITfFunction{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITfFnConfigureRegisterEudc
     * @type {Guid}
     */
    static IID => Guid("{b5e26ff5-d7ad-4304-913f-21a2ed95a1b0}")

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
     * @param {BSTR} bstrRegistered 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ctffunc/nf-ctffunc-itffnconfigureregistereudc-show
     */
    Show(hwndParent, langid, rguidProfile, bstrRegistered) {
        hwndParent := hwndParent is Win32Handle ? NumGet(hwndParent, "ptr") : hwndParent
        bstrRegistered := bstrRegistered is String ? BSTR.Alloc(bstrRegistered).Value : bstrRegistered

        result := ComCall(4, this, "ptr", hwndParent, "ushort", langid, "ptr", rguidProfile, "ptr", bstrRegistered, "HRESULT")
        return result
    }
}
