#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Note  This interface is no longer supported by the AVI Splitter. Note  It was defined to support certain older hardware decoders that required AVI files to be read directly into hardware memory.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-iamdevmemorycontrol
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IAMDevMemoryControl extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAMDevMemoryControl
     * @type {Guid}
     */
    static IID => Guid("{c6545bf1-e76b-11d0-bd52-00a0c911ce86}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["QueryWriteSync", "WriteSync", "GetDevId"]

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamdevmemorycontrol-querywritesync
     */
    QueryWriteSync() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamdevmemorycontrol-writesync
     */
    WriteSync() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwDevId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamdevmemorycontrol-getdevid
     */
    GetDevId(pdwDevId) {
        pdwDevIdMarshal := pdwDevId is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, pdwDevIdMarshal, pdwDevId, "HRESULT")
        return result
    }
}
