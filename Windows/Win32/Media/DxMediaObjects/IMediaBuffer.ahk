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
     * 
     * @param {Integer} cbLength 
     * @returns {HRESULT} 
     */
    SetLength(cbLength) {
        result := ComCall(3, this, "uint", cbLength, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pcbMaxLength 
     * @returns {HRESULT} 
     */
    GetMaxLength(pcbMaxLength) {
        result := ComCall(4, this, "uint*", pcbMaxLength, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} ppBuffer 
     * @param {Pointer<UInt32>} pcbLength 
     * @returns {HRESULT} 
     */
    GetBufferAndLength(ppBuffer, pcbLength) {
        result := ComCall(5, this, "char*", ppBuffer, "uint*", pcbLength, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
