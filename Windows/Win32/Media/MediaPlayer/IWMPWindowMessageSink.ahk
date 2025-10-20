#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IWMPWindowMessageSink extends IUnknown{
    /**
     * The interface identifier for IWMPWindowMessageSink
     * @type {Guid}
     */
    static IID => Guid("{3a0daa30-908d-4789-ba87-aed879b5c49b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} uMsg 
     * @param {WPARAM} wparam 
     * @param {LPARAM} lparam 
     * @param {Pointer<LRESULT>} plRet 
     * @param {Pointer<BOOL>} pfHandled 
     * @returns {HRESULT} 
     */
    OnWindowMessage(uMsg, wparam, lparam, plRet, pfHandled) {
        result := ComCall(3, this, "uint", uMsg, "ptr", wparam, "ptr", lparam, "ptr", plRet, "ptr", pfHandled, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
