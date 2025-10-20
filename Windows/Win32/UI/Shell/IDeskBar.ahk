#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Ole\IOleWindow.ahk

/**
 * Exposes methods that enable desk bar manipulation.
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-ideskbar
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IDeskBar extends IOleWindow{
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
     * 
     * @param {Pointer<IUnknown>} punkClient 
     * @returns {HRESULT} 
     */
    SetClient(punkClient) {
        result := ComCall(5, this, "ptr", punkClient, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} ppunkClient 
     * @returns {HRESULT} 
     */
    GetClient(ppunkClient) {
        result := ComCall(6, this, "ptr", ppunkClient, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<RECT>} prc 
     * @returns {HRESULT} 
     */
    OnPosRectChangeDB(prc) {
        result := ComCall(7, this, "ptr", prc, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
