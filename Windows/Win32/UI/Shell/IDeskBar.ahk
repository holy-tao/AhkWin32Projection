#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk
#Include ..\..\System\Ole\IOleWindow.ahk

/**
 * Exposes methods that enable desk bar manipulation.
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-ideskbar
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IDeskBar extends IOleWindow{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDeskBar
     * @type {Guid}
     */
    static IID => Guid("{eb0fe173-1a3a-11d0-89b3-00a0c90a90ac}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 5

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetClient", "GetClient", "OnPosRectChangeDB"]

    /**
     * 
     * @param {IUnknown} punkClient 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ideskbar-setclient
     */
    SetClient(punkClient) {
        result := ComCall(5, this, "ptr", punkClient, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IUnknown} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ideskbar-getclient
     */
    GetClient() {
        result := ComCall(6, this, "ptr*", &ppunkClient := 0, "HRESULT")
        return IUnknown(ppunkClient)
    }

    /**
     * 
     * @param {Pointer<RECT>} prc 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ideskbar-onposrectchangedb
     */
    OnPosRectChangeDB(prc) {
        result := ComCall(7, this, "ptr", prc, "HRESULT")
        return result
    }
}
