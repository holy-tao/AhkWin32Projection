#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Implemented by media sink objects.
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/nn-mfidl-imfmediasink
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFMediaSink extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFMediaSink
     * @type {Guid}
     */
    static IID => Guid("{6ef2a660-47c0-4666-b13d-cbb717f2fa2c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCharacteristics", "AddStreamSink", "RemoveStreamSink", "GetStreamSinkCount", "GetStreamSinkByIndex", "GetStreamSinkById", "SetPresentationClock", "GetPresentationClock", "Shutdown"]

    /**
     * 
     * @param {Pointer<Integer>} pdwCharacteristics 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfmediasink-getcharacteristics
     */
    GetCharacteristics(pdwCharacteristics) {
        pdwCharacteristicsMarshal := pdwCharacteristics is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, pdwCharacteristicsMarshal, pdwCharacteristics, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwStreamSinkIdentifier 
     * @param {IMFMediaType} pMediaType 
     * @param {Pointer<IMFStreamSink>} ppStreamSink 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfmediasink-addstreamsink
     */
    AddStreamSink(dwStreamSinkIdentifier, pMediaType, ppStreamSink) {
        result := ComCall(4, this, "uint", dwStreamSinkIdentifier, "ptr", pMediaType, "ptr*", ppStreamSink, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwStreamSinkIdentifier 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfmediasink-removestreamsink
     */
    RemoveStreamSink(dwStreamSinkIdentifier) {
        result := ComCall(5, this, "uint", dwStreamSinkIdentifier, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pcStreamSinkCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfmediasink-getstreamsinkcount
     */
    GetStreamSinkCount(pcStreamSinkCount) {
        pcStreamSinkCountMarshal := pcStreamSinkCount is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, pcStreamSinkCountMarshal, pcStreamSinkCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwIndex 
     * @param {Pointer<IMFStreamSink>} ppStreamSink 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfmediasink-getstreamsinkbyindex
     */
    GetStreamSinkByIndex(dwIndex, ppStreamSink) {
        result := ComCall(7, this, "uint", dwIndex, "ptr*", ppStreamSink, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwStreamSinkIdentifier 
     * @param {Pointer<IMFStreamSink>} ppStreamSink 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfmediasink-getstreamsinkbyid
     */
    GetStreamSinkById(dwStreamSinkIdentifier, ppStreamSink) {
        result := ComCall(8, this, "uint", dwStreamSinkIdentifier, "ptr*", ppStreamSink, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMFPresentationClock} pPresentationClock 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfmediasink-setpresentationclock
     */
    SetPresentationClock(pPresentationClock) {
        result := ComCall(9, this, "ptr", pPresentationClock, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IMFPresentationClock>} ppPresentationClock 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfmediasink-getpresentationclock
     */
    GetPresentationClock(ppPresentationClock) {
        result := ComCall(10, this, "ptr*", ppPresentationClock, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfmediasink-shutdown
     */
    Shutdown() {
        result := ComCall(11, this, "HRESULT")
        return result
    }
}
