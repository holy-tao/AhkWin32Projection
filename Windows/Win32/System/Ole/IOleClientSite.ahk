#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IMoniker.ahk
#Include .\IOleContainer.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Provides the primary means by which an embedded object obtains information about the location and extent of its display site, its moniker, its user interface, and other resources provided by its container.
 * @see https://docs.microsoft.com/windows/win32/api//oleidl/nn-oleidl-ioleclientsite
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class IOleClientSite extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SaveObject", "GetMoniker", "GetContainer", "ShowObject", "OnShowWindow", "RequestNewObjectLayout"]

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-ioleclientsite-saveobject
     */
    SaveObject() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwAssign 
     * @param {Integer} dwWhichMoniker 
     * @returns {IMoniker} 
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-ioleclientsite-getmoniker
     */
    GetMoniker(dwAssign, dwWhichMoniker) {
        result := ComCall(4, this, "uint", dwAssign, "uint", dwWhichMoniker, "ptr*", &ppmk := 0, "HRESULT")
        return IMoniker(ppmk)
    }

    /**
     * 
     * @returns {IOleContainer} 
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-ioleclientsite-getcontainer
     */
    GetContainer() {
        result := ComCall(5, this, "ptr*", &ppContainer := 0, "HRESULT")
        return IOleContainer(ppContainer)
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-ioleclientsite-showobject
     */
    ShowObject() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} fShow 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-ioleclientsite-onshowwindow
     */
    OnShowWindow(fShow) {
        result := ComCall(7, this, "int", fShow, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-ioleclientsite-requestnewobjectlayout
     */
    RequestNewObjectLayout() {
        result := ComCall(8, this, "HRESULT")
        return result
    }
}
