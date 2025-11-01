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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetClientSite", "GetObjectCount", "GetLinkCount", "GetObject", "InsertObject", "ConvertObject", "ActivateAs", "SetHostNames", "SetLinkAvailable", "SetDvaspect", "HandsOffStorage", "SaveCompleted", "InPlaceDeactivate", "ContextSensitiveHelp", "GetClipboardData", "ImportDataObject"]

    /**
     * 
     * @param {Pointer<IOleClientSite>} lplpolesite 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/richole/nf-richole-iricheditole-getclientsite
     */
    GetClientSite(lplpolesite) {
        result := ComCall(3, this, "ptr*", lplpolesite, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/richole/nf-richole-iricheditole-getobjectcount
     */
    GetObjectCount() {
        result := ComCall(4, this, "int")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/richole/nf-richole-iricheditole-getlinkcount
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
        result := ComCall(6, this, "int", iob, "ptr", lpreobject, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<REOBJECT>} lpreobject 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/richole/nf-richole-iricheditole-insertobject
     */
    InsertObject(lpreobject) {
        result := ComCall(7, this, "ptr", lpreobject, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} iob 
     * @param {Pointer<Guid>} rclsidNew 
     * @param {PSTR} lpstrUserTypeNew 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/richole/nf-richole-iricheditole-convertobject
     */
    ConvertObject(iob, rclsidNew, lpstrUserTypeNew) {
        result := ComCall(8, this, "int", iob, "ptr", rclsidNew, "ptr", lpstrUserTypeNew, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} rclsid 
     * @param {Pointer<Guid>} rclsidAs 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/richole/nf-richole-iricheditole-activateas
     */
    ActivateAs(rclsid, rclsidAs) {
        result := ComCall(9, this, "ptr", rclsid, "ptr", rclsidAs, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PSTR} lpstrContainerApp 
     * @param {PSTR} lpstrContainerObj 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/richole/nf-richole-iricheditole-sethostnames
     */
    SetHostNames(lpstrContainerApp, lpstrContainerObj) {
        result := ComCall(10, this, "ptr", lpstrContainerApp, "ptr", lpstrContainerObj, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} iob 
     * @param {BOOL} fAvailable 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/richole/nf-richole-iricheditole-setlinkavailable
     */
    SetLinkAvailable(iob, fAvailable) {
        result := ComCall(11, this, "int", iob, "int", fAvailable, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} iob 
     * @param {Integer} dvaspect 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/richole/nf-richole-iricheditole-setdvaspect
     */
    SetDvaspect(iob, dvaspect) {
        result := ComCall(12, this, "int", iob, "uint", dvaspect, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} iob 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/richole/nf-richole-iricheditole-handsoffstorage
     */
    HandsOffStorage(iob) {
        result := ComCall(13, this, "int", iob, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} iob 
     * @param {IStorage} lpstg 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/richole/nf-richole-iricheditole-savecompleted
     */
    SaveCompleted(iob, lpstg) {
        result := ComCall(14, this, "int", iob, "ptr", lpstg, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/richole/nf-richole-iricheditole-inplacedeactivate
     */
    InPlaceDeactivate() {
        result := ComCall(15, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} fEnterMode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/richole/nf-richole-iricheditole-contextsensitivehelp
     */
    ContextSensitiveHelp(fEnterMode) {
        result := ComCall(16, this, "int", fEnterMode, "HRESULT")
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
        result := ComCall(17, this, "ptr", lpchrg, "uint", reco, "ptr*", lplpdataobj, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDataObject} lpdataobj 
     * @param {Integer} cf 
     * @param {HGLOBAL} hMetaPict 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/richole/nf-richole-iricheditole-importdataobject
     */
    ImportDataObject(lpdataobj, cf, hMetaPict) {
        hMetaPict := hMetaPict is Win32Handle ? NumGet(hMetaPict, "ptr") : hMetaPict

        result := ComCall(18, this, "ptr", lpdataobj, "ushort", cf, "ptr", hMetaPict, "HRESULT")
        return result
    }
}
