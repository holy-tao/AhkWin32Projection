#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Serves as the principal means by which an embedded object provides basic functionality to, and communicates with, its container.
 * @see https://docs.microsoft.com/windows/win32/api//oleidl/nn-oleidl-ioleobject
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class IOleObject extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IOleObject
     * @type {Guid}
     */
    static IID => Guid("{00000112-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetClientSite", "GetClientSite", "SetHostNames", "Close", "SetMoniker", "GetMoniker", "InitFromData", "GetClipboardData", "DoVerb", "EnumVerbs", "Update", "IsUpToDate", "GetUserClassID", "GetUserType", "SetExtent", "GetExtent", "Advise", "Unadvise", "EnumAdvise", "GetMiscStatus", "SetColorScheme"]

    /**
     * 
     * @param {IOleClientSite} pClientSite 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-ioleobject-setclientsite
     */
    SetClientSite(pClientSite) {
        result := ComCall(3, this, "ptr", pClientSite, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IOleClientSite>} ppClientSite 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-ioleobject-getclientsite
     */
    GetClientSite(ppClientSite) {
        result := ComCall(4, this, "ptr*", ppClientSite, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} szContainerApp 
     * @param {PWSTR} szContainerObj 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-ioleobject-sethostnames
     */
    SetHostNames(szContainerApp, szContainerObj) {
        szContainerApp := szContainerApp is String ? StrPtr(szContainerApp) : szContainerApp
        szContainerObj := szContainerObj is String ? StrPtr(szContainerObj) : szContainerObj

        result := ComCall(5, this, "ptr", szContainerApp, "ptr", szContainerObj, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwSaveOption 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-ioleobject-close
     */
    Close(dwSaveOption) {
        result := ComCall(6, this, "uint", dwSaveOption, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwWhichMoniker 
     * @param {IMoniker} pmk 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-ioleobject-setmoniker
     */
    SetMoniker(dwWhichMoniker, pmk) {
        result := ComCall(7, this, "uint", dwWhichMoniker, "ptr", pmk, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwAssign 
     * @param {Integer} dwWhichMoniker 
     * @param {Pointer<IMoniker>} ppmk 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-ioleobject-getmoniker
     */
    GetMoniker(dwAssign, dwWhichMoniker, ppmk) {
        result := ComCall(8, this, "uint", dwAssign, "uint", dwWhichMoniker, "ptr*", ppmk, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDataObject} pDataObject 
     * @param {BOOL} fCreation 
     * @param {Integer} dwReserved 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-ioleobject-initfromdata
     */
    InitFromData(pDataObject, fCreation, dwReserved) {
        result := ComCall(9, this, "ptr", pDataObject, "int", fCreation, "uint", dwReserved, "HRESULT")
        return result
    }

    /**
     * Retrieves data from the clipboard in a specified format. The clipboard must have been opened previously.
     * @param {Integer} dwReserved 
     * @param {Pointer<IDataObject>} ppDataObject 
     * @returns {HRESULT} Type: <b>HANDLE</b>
     * 
     * If the function succeeds, the return value is the handle to a clipboard object in the specified format.
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-getclipboarddata
     */
    GetClipboardData(dwReserved, ppDataObject) {
        result := ComCall(10, this, "uint", dwReserved, "ptr*", ppDataObject, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} iVerb 
     * @param {Pointer<MSG>} lpmsg 
     * @param {IOleClientSite} pActiveSite 
     * @param {Integer} lindex 
     * @param {HWND} hwndParent 
     * @param {Pointer<RECT>} lprcPosRect 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-ioleobject-doverb
     */
    DoVerb(iVerb, lpmsg, pActiveSite, lindex, hwndParent, lprcPosRect) {
        hwndParent := hwndParent is Win32Handle ? NumGet(hwndParent, "ptr") : hwndParent

        result := ComCall(11, this, "int", iVerb, "ptr", lpmsg, "ptr", pActiveSite, "int", lindex, "ptr", hwndParent, "ptr", lprcPosRect, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IEnumOLEVERB>} ppEnumOleVerb 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-ioleobject-enumverbs
     */
    EnumVerbs(ppEnumOleVerb) {
        result := ComCall(12, this, "ptr*", ppEnumOleVerb, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-ioleobject-update
     */
    Update() {
        result := ComCall(13, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-ioleobject-isuptodate
     */
    IsUpToDate() {
        result := ComCall(14, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pClsid 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-ioleobject-getuserclassid
     */
    GetUserClassID(pClsid) {
        result := ComCall(15, this, "ptr", pClsid, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwFormOfType 
     * @param {Pointer<PWSTR>} pszUserType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-ioleobject-getusertype
     */
    GetUserType(dwFormOfType, pszUserType) {
        result := ComCall(16, this, "uint", dwFormOfType, "ptr", pszUserType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwDrawAspect 
     * @param {Pointer<SIZE>} psizel 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-ioleobject-setextent
     */
    SetExtent(dwDrawAspect, psizel) {
        result := ComCall(17, this, "uint", dwDrawAspect, "ptr", psizel, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwDrawAspect 
     * @param {Pointer<SIZE>} psizel 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-ioleobject-getextent
     */
    GetExtent(dwDrawAspect, psizel) {
        result := ComCall(18, this, "uint", dwDrawAspect, "ptr", psizel, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IAdviseSink} pAdvSink 
     * @param {Pointer<Integer>} pdwConnection 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-ioleobject-advise
     */
    Advise(pAdvSink, pdwConnection) {
        pdwConnectionMarshal := pdwConnection is VarRef ? "uint*" : "ptr"

        result := ComCall(19, this, "ptr", pAdvSink, pdwConnectionMarshal, pdwConnection, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwConnection 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-ioleobject-unadvise
     */
    Unadvise(dwConnection) {
        result := ComCall(20, this, "uint", dwConnection, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IEnumSTATDATA>} ppenumAdvise 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-ioleobject-enumadvise
     */
    EnumAdvise(ppenumAdvise) {
        result := ComCall(21, this, "ptr*", ppenumAdvise, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwAspect 
     * @param {Pointer<Integer>} pdwStatus 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-ioleobject-getmiscstatus
     */
    GetMiscStatus(dwAspect, pdwStatus) {
        pdwStatusMarshal := pdwStatus is VarRef ? "int*" : "ptr"

        result := ComCall(22, this, "uint", dwAspect, pdwStatusMarshal, pdwStatus, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<LOGPALETTE>} pLogpal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-ioleobject-setcolorscheme
     */
    SetColorScheme(pLogpal) {
        result := ComCall(23, this, "ptr", pLogpal, "HRESULT")
        return result
    }
}
