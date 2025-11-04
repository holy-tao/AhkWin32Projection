#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMF2DBuffer.ahk

/**
 * Represents a buffer that contains a two-dimensional surface, such as a video frame.
 * @remarks
 * 
  * This interface extends the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imf2dbuffer">IMF2DBuffer</a> interface and adds a safer version of the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imf2dbuffer-lock2d">IMF2DBuffer::Lock2D</a> method.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//mfobjects/nn-mfobjects-imf2dbuffer2
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMF2DBuffer2 extends IMF2DBuffer{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMF2DBuffer2
     * @type {Guid}
     */
    static IID => Guid("{33ae5ea6-4316-436f-8ddd-d73d22f829ec}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 10

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Lock2DSize", "Copy2DTo"]

    /**
     * 
     * @param {Integer} lockFlags 
     * @param {Pointer<Pointer<Integer>>} ppbScanline0 
     * @param {Pointer<Integer>} plPitch 
     * @param {Pointer<Pointer<Integer>>} ppbBufferStart 
     * @param {Pointer<Integer>} pcbBufferLength 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imf2dbuffer2-lock2dsize
     */
    Lock2DSize(lockFlags, ppbScanline0, plPitch, ppbBufferStart, pcbBufferLength) {
        ppbScanline0Marshal := ppbScanline0 is VarRef ? "ptr*" : "ptr"
        plPitchMarshal := plPitch is VarRef ? "int*" : "ptr"
        ppbBufferStartMarshal := ppbBufferStart is VarRef ? "ptr*" : "ptr"
        pcbBufferLengthMarshal := pcbBufferLength is VarRef ? "uint*" : "ptr"

        result := ComCall(10, this, "int", lockFlags, ppbScanline0Marshal, ppbScanline0, plPitchMarshal, plPitch, ppbBufferStartMarshal, ppbBufferStart, pcbBufferLengthMarshal, pcbBufferLength, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMF2DBuffer2} pDestBuffer 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imf2dbuffer2-copy2dto
     */
    Copy2DTo(pDestBuffer) {
        result := ComCall(11, this, "ptr", pDestBuffer, "HRESULT")
        return result
    }
}
