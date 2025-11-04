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
     * 
     * @param {Pointer<Pointer<Void>>} ppvBuffer 
     * @param {Pointer<Integer>} pdwSize 
     * @returns {HRESULT} 
     */
    GetBuffer(ppvBuffer, pdwSize) {
        ppvBufferMarshal := ppvBuffer is VarRef ? "ptr*" : "ptr"
        pdwSizeMarshal := pdwSize is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, ppvBufferMarshal, ppvBuffer, pdwSizeMarshal, pdwSize, "HRESULT")
        return result
    }
}
