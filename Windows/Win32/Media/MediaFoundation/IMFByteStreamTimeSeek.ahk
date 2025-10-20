#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Seeks a byte stream by time position.
 * @remarks
 * 
  * A byte stream can implement this interface if it supports time-based seeking. For example, a byte stream that reads data from a server  might implement the interface. Typically, a local file-based byte stream would not implement it.
  * 
  * To get a pointer to this interface, call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> on the byte stream object.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/nn-mfidl-imfbytestreamtimeseek
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFByteStreamTimeSeek extends IUnknown{
    /**
     * The interface identifier for IMFByteStreamTimeSeek
     * @type {Guid}
     */
    static IID => Guid("{64976bfa-fb61-4041-9069-8c9a5f659beb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<BOOL>} pfTimeSeekIsSupported 
     * @returns {HRESULT} 
     */
    IsTimeSeekSupported(pfTimeSeekIsSupported) {
        result := ComCall(3, this, "ptr", pfTimeSeekIsSupported, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} qwTimePosition 
     * @returns {HRESULT} 
     */
    TimeSeek(qwTimePosition) {
        result := ComCall(4, this, "uint", qwTimePosition, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt64>} pqwStartTime 
     * @param {Pointer<UInt64>} pqwStopTime 
     * @param {Pointer<UInt64>} pqwDuration 
     * @returns {HRESULT} 
     */
    GetTimeSeekResult(pqwStartTime, pqwStopTime, pqwDuration) {
        result := ComCall(5, this, "uint*", pqwStartTime, "uint*", pqwStopTime, "uint*", pqwDuration, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
