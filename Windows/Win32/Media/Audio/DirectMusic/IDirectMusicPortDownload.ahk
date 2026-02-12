#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IDirectMusicDownload.ahk
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
     * Retrieves a pointer to the buffer bitmap if the buffer is a device-independent bitmap (DIB).
     * @remarks
     * The number of bits per pixel depends on the pixel format passed to <a href="https://docs.microsoft.com/windows/desktop/api/uxtheme/nf-uxtheme-beginbufferedpaint">BeginBufferedPaint</a>.
     * @param {Integer} dwDLId 
     * @returns {IDirectMusicDownload} 
     * @see https://learn.microsoft.com/windows/win32/api//content/uxtheme/nf-uxtheme-getbufferedpaintbits
     */
    GetBuffer(dwDLId) {
        result := ComCall(3, this, "uint", dwDLId, "ptr*", &ppIDMDownload := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IDirectMusicDownload(ppIDMDownload)
    }

    /**
     * 
     * @param {Integer} dwSize 
     * @returns {IDirectMusicDownload} 
     */
    AllocateBuffer(dwSize) {
        result := ComCall(4, this, "uint", dwSize, "ptr*", &ppIDMDownload := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IDirectMusicDownload(ppIDMDownload)
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwStartDLId 
     * @param {Integer} dwCount 
     * @returns {HRESULT} 
     */
    GetDLId(pdwStartDLId, dwCount) {
        pdwStartDLIdMarshal := pdwStartDLId is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, pdwStartDLIdMarshal, pdwStartDLId, "uint", dwCount, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwAppend 
     * @returns {HRESULT} 
     */
    GetAppend(pdwAppend) {
        pdwAppendMarshal := pdwAppend is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, pdwAppendMarshal, pdwAppend, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Note This section describes functionality designed for use by online stores. Use of this functionality outside the context of an online store is not supported. The Clear method removes all items from a download collection.
     * @param {IDirectMusicDownload} pIDMDownload 
     * @returns {HRESULT} This method has no parameters.
     * 
     * 
     * This method does not return a value.
     * @see https://learn.microsoft.com/windows/win32/ktop-src/WMP/downloadcollection-clear
     */
    Download(pIDMDownload) {
        result := ComCall(7, this, "ptr", pIDMDownload, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Unloading an Extended Stored Procedure DLL
     * @param {IDirectMusicDownload} pIDMDownload 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/extended-stored-procedures-programming/unloading-an-extended-stored-procedure-dll
     */
    Unload(pIDMDownload) {
        result := ComCall(8, this, "ptr", pIDMDownload, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
