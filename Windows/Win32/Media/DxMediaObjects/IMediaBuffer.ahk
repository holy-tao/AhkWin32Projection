#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IMediaBuffer interface provides methods for manipulating a data buffer. Buffers passed to the IMediaObject::ProcessInput and ProcessOutput methods must implement this interface.
 * @see https://docs.microsoft.com/windows/win32/api//mediaobj/nn-mediaobj-imediabuffer
 * @namespace Windows.Win32.Media.DxMediaObjects
 * @version v4.0.30319
 */
class IMediaBuffer extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMediaBuffer
     * @type {Guid}
     */
    static IID => Guid("{59eff8b9-938c-4a26-82f2-95cb84cdc837}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetLength", "GetMaxLength", "GetBufferAndLength"]

    /**
     * 
     * @param {Integer} cbLength 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mediaobj/nf-mediaobj-imediabuffer-setlength
     */
    SetLength(cbLength) {
        result := ComCall(3, this, "uint", cbLength, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pcbMaxLength 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mediaobj/nf-mediaobj-imediabuffer-getmaxlength
     */
    GetMaxLength(pcbMaxLength) {
        result := ComCall(4, this, "uint*", pcbMaxLength, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<Integer>>} ppBuffer 
     * @param {Pointer<Integer>} pcbLength 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mediaobj/nf-mediaobj-imediabuffer-getbufferandlength
     */
    GetBufferAndLength(ppBuffer, pcbLength) {
        result := ComCall(5, this, "ptr*", ppBuffer, "uint*", pcbLength, "HRESULT")
        return result
    }
}
