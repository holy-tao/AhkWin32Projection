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
     * 
     * @param {Pointer<UInt32>} pdwCharacteristics 
     * @returns {HRESULT} 
     */
    GetCharacteristics(pdwCharacteristics) {
        result := ComCall(3, this, "uint*", pdwCharacteristics, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwStreamSinkIdentifier 
     * @param {Pointer<IMFMediaType>} pMediaType 
     * @param {Pointer<IMFStreamSink>} ppStreamSink 
     * @returns {HRESULT} 
     */
    AddStreamSink(dwStreamSinkIdentifier, pMediaType, ppStreamSink) {
        result := ComCall(4, this, "uint", dwStreamSinkIdentifier, "ptr", pMediaType, "ptr", ppStreamSink, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwStreamSinkIdentifier 
     * @returns {HRESULT} 
     */
    RemoveStreamSink(dwStreamSinkIdentifier) {
        result := ComCall(5, this, "uint", dwStreamSinkIdentifier, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pcStreamSinkCount 
     * @returns {HRESULT} 
     */
    GetStreamSinkCount(pcStreamSinkCount) {
        result := ComCall(6, this, "uint*", pcStreamSinkCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwIndex 
     * @param {Pointer<IMFStreamSink>} ppStreamSink 
     * @returns {HRESULT} 
     */
    GetStreamSinkByIndex(dwIndex, ppStreamSink) {
        result := ComCall(7, this, "uint", dwIndex, "ptr", ppStreamSink, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwStreamSinkIdentifier 
     * @param {Pointer<IMFStreamSink>} ppStreamSink 
     * @returns {HRESULT} 
     */
    GetStreamSinkById(dwStreamSinkIdentifier, ppStreamSink) {
        result := ComCall(8, this, "uint", dwStreamSinkIdentifier, "ptr", ppStreamSink, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMFPresentationClock>} pPresentationClock 
     * @returns {HRESULT} 
     */
    SetPresentationClock(pPresentationClock) {
        result := ComCall(9, this, "ptr", pPresentationClock, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMFPresentationClock>} ppPresentationClock 
     * @returns {HRESULT} 
     */
    GetPresentationClock(ppPresentationClock) {
        result := ComCall(10, this, "ptr", ppPresentationClock, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Shutdown() {
        result := ComCall(11, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
