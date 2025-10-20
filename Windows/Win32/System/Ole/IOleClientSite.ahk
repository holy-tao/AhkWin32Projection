#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Provides the primary means by which an embedded object obtains information about the location and extent of its display site, its moniker, its user interface, and other resources provided by its container.
 * @see https://docs.microsoft.com/windows/win32/api//oleidl/nn-oleidl-ioleclientsite
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class IOleClientSite extends IUnknown{
    /**
     * The interface identifier for IOleClientSite
     * @type {Guid}
     */
    static IID => Guid("{00000118-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @returns {HRESULT} 
     */
    SaveObject() {
        result := ComCall(3, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwAssign 
     * @param {Integer} dwWhichMoniker 
     * @param {Pointer<IMoniker>} ppmk 
     * @returns {HRESULT} 
     */
    GetMoniker(dwAssign, dwWhichMoniker, ppmk) {
        result := ComCall(4, this, "uint", dwAssign, "uint", dwWhichMoniker, "ptr", ppmk, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IOleContainer>} ppContainer 
     * @returns {HRESULT} 
     */
    GetContainer(ppContainer) {
        result := ComCall(5, this, "ptr", ppContainer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ShowObject() {
        result := ComCall(6, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} fShow 
     * @returns {HRESULT} 
     */
    OnShowWindow(fShow) {
        result := ComCall(7, this, "int", fShow, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    RequestNewObjectLayout() {
        result := ComCall(8, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
