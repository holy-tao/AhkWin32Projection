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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["IsTimeSeekSupported", "TimeSeek", "GetTimeSeekResult"]

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfbytestreamtimeseek-istimeseeksupported
     */
    IsTimeSeekSupported() {
        result := ComCall(3, this, "int*", &pfTimeSeekIsSupported := 0, "HRESULT")
        return pfTimeSeekIsSupported
    }

    /**
     * 
     * @param {Integer} qwTimePosition 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfbytestreamtimeseek-timeseek
     */
    TimeSeek(qwTimePosition) {
        result := ComCall(4, this, "uint", qwTimePosition, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pqwStartTime 
     * @param {Pointer<Integer>} pqwStopTime 
     * @param {Pointer<Integer>} pqwDuration 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfbytestreamtimeseek-gettimeseekresult
     */
    GetTimeSeekResult(pqwStartTime, pqwStopTime, pqwDuration) {
        pqwStartTimeMarshal := pqwStartTime is VarRef ? "uint*" : "ptr"
        pqwStopTimeMarshal := pqwStopTime is VarRef ? "uint*" : "ptr"
        pqwDurationMarshal := pqwDuration is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, pqwStartTimeMarshal, pqwStartTime, pqwStopTimeMarshal, pqwStopTime, pqwDurationMarshal, pqwDuration, "HRESULT")
        return result
    }
}
