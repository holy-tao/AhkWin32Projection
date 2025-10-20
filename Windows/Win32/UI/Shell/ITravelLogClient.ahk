#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class ITravelLogClient extends IUnknown{
    /**
     * The interface identifier for ITravelLogClient
     * @type {Guid}
     */
    static IID => Guid("{241c033e-e659-43da-aa4d-4086dbc4758d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} dwID 
     * @param {Pointer<IUnknown>} ppunk 
     * @returns {HRESULT} 
     */
    FindWindowByIndex(dwID, ppunk) {
        result := ComCall(3, this, "uint", dwID, "ptr", ppunk, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IStream>} pStream 
     * @param {Pointer<WINDOWDATA>} pWinData 
     * @returns {HRESULT} 
     */
    GetWindowData(pStream, pWinData) {
        result := ComCall(4, this, "ptr", pStream, "ptr", pWinData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszUrlLocation 
     * @param {Integer} dwPosition 
     * @returns {HRESULT} 
     */
    LoadHistoryPosition(pszUrlLocation, dwPosition) {
        pszUrlLocation := pszUrlLocation is String ? StrPtr(pszUrlLocation) : pszUrlLocation

        result := ComCall(5, this, "ptr", pszUrlLocation, "uint", dwPosition, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
