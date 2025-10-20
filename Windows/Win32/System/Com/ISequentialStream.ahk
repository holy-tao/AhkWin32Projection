#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUnknown.ahk

/**
 * The ISequentialStream interface supports simplified sequential access to stream objects. The IStream interface inherits its Read and Write methods from ISequentialStream.
 * @see https://docs.microsoft.com/windows/win32/api//objidl/nn-objidl-isequentialstream
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class ISequentialStream extends IUnknown{
    /**
     * The interface identifier for ISequentialStream
     * @type {Guid}
     */
    static IID => Guid("{0c733a30-2a1c-11ce-ade5-00aa0044773d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer} pv 
     * @param {Integer} cb 
     * @param {Pointer<UInt32>} pcbRead 
     * @returns {HRESULT} 
     */
    Read(pv, cb, pcbRead) {
        result := ComCall(3, this, "ptr", pv, "uint", cb, "uint*", pcbRead, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} pv 
     * @param {Integer} cb 
     * @param {Pointer<UInt32>} pcbWritten 
     * @returns {HRESULT} 
     */
    Write(pv, cb, pcbWritten) {
        result := ComCall(4, this, "ptr", pv, "uint", cb, "uint*", pcbWritten, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
