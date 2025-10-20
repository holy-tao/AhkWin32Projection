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
     * 
     * @param {Integer} lockFlags 
     * @param {Pointer<Byte>} ppbScanline0 
     * @param {Pointer<Int32>} plPitch 
     * @param {Pointer<Byte>} ppbBufferStart 
     * @param {Pointer<UInt32>} pcbBufferLength 
     * @returns {HRESULT} 
     */
    Lock2DSize(lockFlags, ppbScanline0, plPitch, ppbBufferStart, pcbBufferLength) {
        result := ComCall(10, this, "int", lockFlags, "char*", ppbScanline0, "int*", plPitch, "char*", ppbBufferStart, "uint*", pcbBufferLength, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMF2DBuffer2>} pDestBuffer 
     * @returns {HRESULT} 
     */
    Copy2DTo(pDestBuffer) {
        result := ComCall(11, this, "ptr", pDestBuffer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
