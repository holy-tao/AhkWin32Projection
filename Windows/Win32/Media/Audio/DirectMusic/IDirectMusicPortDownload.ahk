#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.Audio.DirectMusic
 * @version v4.0.30319
 */
class IDirectMusicPortDownload extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDirectMusicPortDownload
     * @type {Guid}
     */
    static IID => Guid("{d2ac287a-b39b-11d1-8704-00600893b1bd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetBuffer", "AllocateBuffer", "GetDLId", "GetAppend", "Download", "Unload"]

    /**
     * 
     * @param {Integer} dwDLId 
     * @param {Pointer<IDirectMusicDownload>} ppIDMDownload 
     * @returns {HRESULT} 
     */
    GetBuffer(dwDLId, ppIDMDownload) {
        result := ComCall(3, this, "uint", dwDLId, "ptr*", ppIDMDownload, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwSize 
     * @param {Pointer<IDirectMusicDownload>} ppIDMDownload 
     * @returns {HRESULT} 
     */
    AllocateBuffer(dwSize, ppIDMDownload) {
        result := ComCall(4, this, "uint", dwSize, "ptr*", ppIDMDownload, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwStartDLId 
     * @param {Integer} dwCount 
     * @returns {HRESULT} 
     */
    GetDLId(pdwStartDLId, dwCount) {
        result := ComCall(5, this, "uint*", pdwStartDLId, "uint", dwCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwAppend 
     * @returns {HRESULT} 
     */
    GetAppend(pdwAppend) {
        result := ComCall(6, this, "uint*", pdwAppend, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDirectMusicDownload} pIDMDownload 
     * @returns {HRESULT} 
     */
    Download(pIDMDownload) {
        result := ComCall(7, this, "ptr", pIDMDownload, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDirectMusicDownload} pIDMDownload 
     * @returns {HRESULT} 
     */
    Unload(pIDMDownload) {
        result := ComCall(8, this, "ptr", pIDMDownload, "HRESULT")
        return result
    }
}
