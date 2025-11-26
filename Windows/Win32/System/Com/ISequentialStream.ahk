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
     * Reads a specified number of bytes from the stream object into memory, starting at the current seek pointer.
     * @param {Pointer} pv A pointer to the buffer which the stream data is read into.
     * @param {Integer} cb The number of bytes of data to read from the stream object.
     * @returns {Integer} A pointer to a <b>ULONG</b> variable that receives the actual number of bytes read from the stream object. 
     * 
     * <div class="alert"><b>Note</b>  The number of bytes read may be zero.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//objidl/nf-objidl-isequentialstream-read
     */
    Read(pv, cb) {
        result := ComCall(3, this, "ptr", pv, "uint", cb, "uint*", &pcbRead := 0, "int")
        return pcbRead
    }

    /**
     * Writes a specified number of bytes into the stream object starting at the current seek pointer.
     * @param {Pointer} pv A pointer to the buffer that contains the data that is to be written to the stream. A valid pointer must be provided for this parameter even when <i>cb</i> is zero.
     * @param {Integer} cb The number of bytes of data to attempt to write into the stream. This value can be zero.
     * @returns {Integer} A pointer to a <b>ULONG</b> variable where this method writes the actual number of bytes written to the stream object. The caller can set this pointer to <b>NULL</b>, in which case this method does not provide the actual number of bytes written.
     * @see https://docs.microsoft.com/windows/win32/api//objidl/nf-objidl-isequentialstream-write
     */
    Write(pv, cb) {
        result := ComCall(4, this, "ptr", pv, "uint", cb, "uint*", &pcbWritten := 0, "int")
        return pcbWritten
    }
}
