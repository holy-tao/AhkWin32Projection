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
     * 
     * @param {Pointer<IOleClientSite>} pClientSite 
     * @returns {HRESULT} 
     */
    SetClientSite(pClientSite) {
        result := ComCall(3, this, "ptr", pClientSite, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IOleClientSite>} ppClientSite 
     * @returns {HRESULT} 
     */
    GetClientSite(ppClientSite) {
        result := ComCall(4, this, "ptr", ppClientSite, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} szContainerApp 
     * @param {PWSTR} szContainerObj 
     * @returns {HRESULT} 
     */
    SetHostNames(szContainerApp, szContainerObj) {
        szContainerApp := szContainerApp is String ? StrPtr(szContainerApp) : szContainerApp
        szContainerObj := szContainerObj is String ? StrPtr(szContainerObj) : szContainerObj

        result := ComCall(5, this, "ptr", szContainerApp, "ptr", szContainerObj, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwSaveOption 
     * @returns {HRESULT} 
     */
    Close(dwSaveOption) {
        result := ComCall(6, this, "uint", dwSaveOption, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwWhichMoniker 
     * @param {Pointer<IMoniker>} pmk 
     * @returns {HRESULT} 
     */
    SetMoniker(dwWhichMoniker, pmk) {
        result := ComCall(7, this, "uint", dwWhichMoniker, "ptr", pmk, "int")
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
        result := ComCall(8, this, "uint", dwAssign, "uint", dwWhichMoniker, "ptr", ppmk, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDataObject>} pDataObject 
     * @param {BOOL} fCreation 
     * @param {Integer} dwReserved 
     * @returns {HRESULT} 
     */
    InitFromData(pDataObject, fCreation, dwReserved) {
        result := ComCall(9, this, "ptr", pDataObject, "int", fCreation, "uint", dwReserved, "int")
        if(result != 0)
            throw OSError(result)

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
        result := ComCall(10, this, "uint", dwReserved, "ptr", ppDataObject, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} iVerb 
     * @param {Pointer<MSG>} lpmsg 
     * @param {Pointer<IOleClientSite>} pActiveSite 
     * @param {Integer} lindex 
     * @param {HWND} hwndParent 
     * @param {Pointer<RECT>} lprcPosRect 
     * @returns {HRESULT} 
     */
    DoVerb(iVerb, lpmsg, pActiveSite, lindex, hwndParent, lprcPosRect) {
        hwndParent := hwndParent is Win32Handle ? NumGet(hwndParent, "ptr") : hwndParent

        result := ComCall(11, this, "int", iVerb, "ptr", lpmsg, "ptr", pActiveSite, "int", lindex, "ptr", hwndParent, "ptr", lprcPosRect, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IEnumOLEVERB>} ppEnumOleVerb 
     * @returns {HRESULT} 
     */
    EnumVerbs(ppEnumOleVerb) {
        result := ComCall(12, this, "ptr", ppEnumOleVerb, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Update() {
        result := ComCall(13, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    IsUpToDate() {
        result := ComCall(14, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pClsid 
     * @returns {HRESULT} 
     */
    GetUserClassID(pClsid) {
        result := ComCall(15, this, "ptr", pClsid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwFormOfType 
     * @param {Pointer<PWSTR>} pszUserType 
     * @returns {HRESULT} 
     */
    GetUserType(dwFormOfType, pszUserType) {
        result := ComCall(16, this, "uint", dwFormOfType, "ptr", pszUserType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwDrawAspect 
     * @param {Pointer<SIZE>} psizel 
     * @returns {HRESULT} 
     */
    SetExtent(dwDrawAspect, psizel) {
        result := ComCall(17, this, "uint", dwDrawAspect, "ptr", psizel, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwDrawAspect 
     * @param {Pointer<SIZE>} psizel 
     * @returns {HRESULT} 
     */
    GetExtent(dwDrawAspect, psizel) {
        result := ComCall(18, this, "uint", dwDrawAspect, "ptr", psizel, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IAdviseSink>} pAdvSink 
     * @param {Pointer<UInt32>} pdwConnection 
     * @returns {HRESULT} 
     */
    Advise(pAdvSink, pdwConnection) {
        result := ComCall(19, this, "ptr", pAdvSink, "uint*", pdwConnection, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwConnection 
     * @returns {HRESULT} 
     */
    Unadvise(dwConnection) {
        result := ComCall(20, this, "uint", dwConnection, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IEnumSTATDATA>} ppenumAdvise 
     * @returns {HRESULT} 
     */
    EnumAdvise(ppenumAdvise) {
        result := ComCall(21, this, "ptr", ppenumAdvise, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwAspect 
     * @param {Pointer<Int32>} pdwStatus 
     * @returns {HRESULT} 
     */
    GetMiscStatus(dwAspect, pdwStatus) {
        result := ComCall(22, this, "uint", dwAspect, "int*", pdwStatus, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<LOGPALETTE>} pLogpal 
     * @returns {HRESULT} 
     */
    SetColorScheme(pLogpal) {
        result := ComCall(23, this, "ptr", pLogpal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
