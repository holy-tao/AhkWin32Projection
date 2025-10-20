#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes a method that is used to communicate focus changes for a user input object contained in the Shell.
 * @remarks
 * 
  * You do not typically implement this interface. <b>IInputObjectSite</b> is implemented by the Shell or the browser to properly maintain the input focus.
  * 
  * You use <b>IInputObjectSite</b> if you are implementing a Shell object that takes user input.
  * 
  * <b>IInputObjectSite</b> is derived from <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>. The listed method is specific to <b>IInputObjectSite</b>.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-iinputobjectsite
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IInputObjectSite extends IUnknown{
    /**
     * The interface identifier for IInputObjectSite
     * @type {Guid}
     */
    static IID => Guid("{f1db8392-7331-11d0-8c99-00a0c92dbfe8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IUnknown>} punkObj 
     * @param {BOOL} fSetFocus 
     * @returns {HRESULT} 
     */
    OnFocusChangeIS(punkObj, fSetFocus) {
        result := ComCall(3, this, "ptr", punkObj, "int", fSetFocus, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
