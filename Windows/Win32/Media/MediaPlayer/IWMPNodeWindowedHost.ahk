#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IWMPNodeWindowedHost extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMPNodeWindowedHost
     * @type {Guid}
     */
    static IID => Guid("{a300415a-54aa-4081-adbf-3b13610d8958}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnWindowMessageFromRenderer"]

    /**
     * 
     * @param {Integer} uMsg 
     * @param {WPARAM} wparam 
     * @param {LPARAM} lparam 
     * @param {Pointer<LRESULT>} plRet 
     * @param {Pointer<BOOL>} pfHandled 
     * @returns {HRESULT} 
     */
    OnWindowMessageFromRenderer(uMsg, wparam, lparam, plRet, pfHandled) {
        result := ComCall(3, this, "uint", uMsg, "ptr", wparam, "ptr", lparam, "ptr", plRet, "ptr", pfHandled, "HRESULT")
        return result
    }
}
