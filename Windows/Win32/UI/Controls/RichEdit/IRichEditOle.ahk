#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * The IRichEditOle interface exposes the Component Object Model (COM) functionality of a rich edit control. The interface can be obtained by sending the EM_GETOLEINTERFACE message. This interface has the following methods.
 * @see https://docs.microsoft.com/windows/win32/api//richole/nn-richole-iricheditole
 * @namespace Windows.Win32.UI.Controls.RichEdit
 * @version v4.0.30319
 */
class IRichEditOle extends IUnknown{
    /**
     * The interface identifier for IRichEditOle
     * @type {Guid}
     */
    static IID => Guid("{00020d00-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IOleClientSite>} lplpolesite 
     * @returns {HRESULT} 
     */
    GetClientSite(lplpolesite) {
        result := ComCall(3, this, "ptr", lplpolesite, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetObjectCount() {
        result := ComCall(4, this, "int")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetLinkCount() {
        result := ComCall(5, this, "int")
        return result
    }

    /**
     * The GetObject function retrieves information for the specified graphics object.
     * @param {Integer} iob 
     * @param {Pointer<REOBJECT>} lpreobject 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} If the function succeeds, and <i>lpvObject</i> is a valid pointer, the return value is the number of bytes stored into the buffer.
     * 
     * If the function succeeds, and <i>lpvObject</i> is <b>NULL</b>, the return value is the number of bytes required to hold the information the function would store into the buffer.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-getobject
     */
    GetObject(iob, lpreobject, dwFlags) {
        result := ComCall(6, this, "int", iob, "ptr", lpreobject, "uint", dwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<REOBJECT>} lpreobject 
     * @returns {HRESULT} 
     */
    InsertObject(lpreobject) {
        result := ComCall(7, this, "ptr", lpreobject, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} iob 
     * @param {Pointer<Guid>} rclsidNew 
     * @param {PSTR} lpstrUserTypeNew 
     * @returns {HRESULT} 
     */
    ConvertObject(iob, rclsidNew, lpstrUserTypeNew) {
        result := ComCall(8, this, "int", iob, "ptr", rclsidNew, "ptr", lpstrUserTypeNew, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} rclsid 
     * @param {Pointer<Guid>} rclsidAs 
     * @returns {HRESULT} 
     */
    ActivateAs(rclsid, rclsidAs) {
        result := ComCall(9, this, "ptr", rclsid, "ptr", rclsidAs, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PSTR} lpstrContainerApp 
     * @param {PSTR} lpstrContainerObj 
     * @returns {HRESULT} 
     */
    SetHostNames(lpstrContainerApp, lpstrContainerObj) {
        result := ComCall(10, this, "ptr", lpstrContainerApp, "ptr", lpstrContainerObj, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} iob 
     * @param {BOOL} fAvailable 
     * @returns {HRESULT} 
     */
    SetLinkAvailable(iob, fAvailable) {
        result := ComCall(11, this, "int", iob, "int", fAvailable, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} iob 
     * @param {Integer} dvaspect 
     * @returns {HRESULT} 
     */
    SetDvaspect(iob, dvaspect) {
        result := ComCall(12, this, "int", iob, "uint", dvaspect, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} iob 
     * @returns {HRESULT} 
     */
    HandsOffStorage(iob) {
        result := ComCall(13, this, "int", iob, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} iob 
     * @param {Pointer<IStorage>} lpstg 
     * @returns {HRESULT} 
     */
    SaveCompleted(iob, lpstg) {
        result := ComCall(14, this, "int", iob, "ptr", lpstg, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    InPlaceDeactivate() {
        result := ComCall(15, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} fEnterMode 
     * @returns {HRESULT} 
     */
    ContextSensitiveHelp(fEnterMode) {
        result := ComCall(16, this, "int", fEnterMode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Retrieves data from the clipboard in a specified format. The clipboard must have been opened previously.
     * @param {Pointer<CHARRANGE>} lpchrg 
     * @param {Integer} reco 
     * @param {Pointer<IDataObject>} lplpdataobj 
     * @returns {HRESULT} Type: <b>HANDLE</b>
     * 
     * If the function succeeds, the return value is the handle to a clipboard object in the specified format.
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-getclipboarddata
     */
    GetClipboardData(lpchrg, reco, lplpdataobj) {
        result := ComCall(17, this, "ptr", lpchrg, "uint", reco, "ptr", lplpdataobj, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDataObject>} lpdataobj 
     * @param {Integer} cf 
     * @param {HGLOBAL} hMetaPict 
     * @returns {HRESULT} 
     */
    ImportDataObject(lpdataobj, cf, hMetaPict) {
        hMetaPict := hMetaPict is Win32Handle ? NumGet(hMetaPict, "ptr") : hMetaPict

        result := ComCall(18, this, "ptr", lpdataobj, "ushort", cf, "ptr", hMetaPict, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
