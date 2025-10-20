#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.Audio.DirectMusic
 * @version v4.0.30319
 */
class IDirectMusicPortDownload extends IUnknown{
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
     * 
     * @param {Integer} dwDLId 
     * @param {Pointer<IDirectMusicDownload>} ppIDMDownload 
     * @returns {HRESULT} 
     */
    GetBuffer(dwDLId, ppIDMDownload) {
        result := ComCall(3, this, "uint", dwDLId, "ptr", ppIDMDownload, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwSize 
     * @param {Pointer<IDirectMusicDownload>} ppIDMDownload 
     * @returns {HRESULT} 
     */
    AllocateBuffer(dwSize, ppIDMDownload) {
        result := ComCall(4, this, "uint", dwSize, "ptr", ppIDMDownload, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwStartDLId 
     * @param {Integer} dwCount 
     * @returns {HRESULT} 
     */
    GetDLId(pdwStartDLId, dwCount) {
        result := ComCall(5, this, "uint*", pdwStartDLId, "uint", dwCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwAppend 
     * @returns {HRESULT} 
     */
    GetAppend(pdwAppend) {
        result := ComCall(6, this, "uint*", pdwAppend, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDirectMusicDownload>} pIDMDownload 
     * @returns {HRESULT} 
     */
    Download(pIDMDownload) {
        result := ComCall(7, this, "ptr", pIDMDownload, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDirectMusicDownload>} pIDMDownload 
     * @returns {HRESULT} 
     */
    Unload(pIDMDownload) {
        result := ComCall(8, this, "ptr", pIDMDownload, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
