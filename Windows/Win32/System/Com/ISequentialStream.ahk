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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Read", "Write"]

    /**
     * 
     * @param {Pointer} pv 
     * @param {Integer} cb 
     * @param {Pointer<Integer>} pcbRead 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-isequentialstream-read
     */
    Read(pv, cb, pcbRead) {
        pcbReadMarshal := pcbRead is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "ptr", pv, "uint", cb, pcbReadMarshal, pcbRead, "int")
        return result
    }

    /**
     * 
     * @param {Pointer} pv 
     * @param {Integer} cb 
     * @param {Pointer<Integer>} pcbWritten 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-isequentialstream-write
     */
    Write(pv, cb, pcbWritten) {
        pcbWrittenMarshal := pcbWritten is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "ptr", pv, "uint", cb, pcbWrittenMarshal, pcbWritten, "int")
        return result
    }
}
