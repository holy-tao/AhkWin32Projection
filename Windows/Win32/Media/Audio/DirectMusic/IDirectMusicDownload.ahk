#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.Audio.DirectMusic
 * @version v4.0.30319
 */
class IDirectMusicDownload extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDirectMusicDownload
     * @type {Guid}
     */
    static IID => Guid("{d2ac287b-b39b-11d1-8704-00600893b1bd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetBuffer"]

    /**
     * Retrieves a pointer to the buffer bitmap if the buffer is a device-independent bitmap (DIB).
     * @remarks
     * The number of bits per pixel depends on the pixel format passed to <a href="https://docs.microsoft.com/windows/desktop/api/uxtheme/nf-uxtheme-beginbufferedpaint">BeginBufferedPaint</a>.
     * @param {Pointer<Pointer<Void>>} ppvBuffer 
     * @param {Pointer<Integer>} pdwSize 
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * Returns S_OK if successful, or an error value otherwise. If an error occurs, <i>ppbBuffer</i>  is set to <b>NULL</b> and <i>pcxRow</i> is set to zero.
     * @see https://learn.microsoft.com/windows/win32/api//content/uxtheme/nf-uxtheme-getbufferedpaintbits
     */
    GetBuffer(ppvBuffer, pdwSize) {
        ppvBufferMarshal := ppvBuffer is VarRef ? "ptr*" : "ptr"
        pdwSizeMarshal := pdwSize is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, ppvBufferMarshal, ppvBuffer, pdwSizeMarshal, pdwSize, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
