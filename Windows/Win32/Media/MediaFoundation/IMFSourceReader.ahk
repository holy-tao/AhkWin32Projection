#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Implemented by the Microsoft Media Foundation source reader object.
 * @remarks
 * 
  * To create the source reader, call one of the following functions:
  * 
  * <ul>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/api/mfreadwrite/nf-mfreadwrite-mfcreatesourcereaderfrombytestream">MFCreateSourceReaderFromByteStream</a>
  * </li>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/api/mfreadwrite/nf-mfreadwrite-mfcreatesourcereaderfrommediasource">MFCreateSourceReaderFromMediaSource</a>
  * </li>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/api/mfreadwrite/nf-mfreadwrite-mfcreatesourcereaderfromurl">MFCreateSourceReaderFromURL</a>
  * </li>
  * </ul>
  * Alternatively, use the <a href="https://docs.microsoft.com/windows/desktop/api/mfreadwrite/nn-mfreadwrite-imfreadwriteclassfactory">IMFReadWriteClassFactory</a> interface.
  * 
  * This interface is available on Windows Vista if Platform Update Supplement for Windows Vista is installed.
  * 
  * In Windows 8, this interface is extended with <a href="https://docs.microsoft.com/windows/desktop/api/mfreadwrite/nn-mfreadwrite-imfsourcereaderex">IMFSourceReaderEx</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//mfreadwrite/nn-mfreadwrite-imfsourcereader
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFSourceReader extends IUnknown{
    /**
     * The interface identifier for IMFSourceReader
     * @type {Guid}
     */
    static IID => Guid("{70ae66f2-c809-4e4f-8915-bdcb406b7993}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} dwStreamIndex 
     * @param {Pointer<BOOL>} pfSelected 
     * @returns {HRESULT} 
     */
    GetStreamSelection(dwStreamIndex, pfSelected) {
        result := ComCall(3, this, "uint", dwStreamIndex, "ptr", pfSelected, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwStreamIndex 
     * @param {BOOL} fSelected 
     * @returns {HRESULT} 
     */
    SetStreamSelection(dwStreamIndex, fSelected) {
        result := ComCall(4, this, "uint", dwStreamIndex, "int", fSelected, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwStreamIndex 
     * @param {Integer} dwMediaTypeIndex 
     * @param {Pointer<IMFMediaType>} ppMediaType 
     * @returns {HRESULT} 
     */
    GetNativeMediaType(dwStreamIndex, dwMediaTypeIndex, ppMediaType) {
        result := ComCall(5, this, "uint", dwStreamIndex, "uint", dwMediaTypeIndex, "ptr", ppMediaType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwStreamIndex 
     * @param {Pointer<IMFMediaType>} ppMediaType 
     * @returns {HRESULT} 
     */
    GetCurrentMediaType(dwStreamIndex, ppMediaType) {
        result := ComCall(6, this, "uint", dwStreamIndex, "ptr", ppMediaType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwStreamIndex 
     * @param {Pointer<IMFMediaType>} pMediaType 
     * @returns {HRESULT} 
     */
    SetCurrentMediaType(dwStreamIndex, pMediaType) {
        static pdwReserved := 0 ;Reserved parameters must always be NULL

        result := ComCall(7, this, "uint", dwStreamIndex, "uint*", pdwReserved, "ptr", pMediaType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} guidTimeFormat 
     * @param {Pointer<PROPVARIANT>} varPosition 
     * @returns {HRESULT} 
     */
    SetCurrentPosition(guidTimeFormat, varPosition) {
        result := ComCall(8, this, "ptr", guidTimeFormat, "ptr", varPosition, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwStreamIndex 
     * @param {Integer} dwControlFlags 
     * @param {Pointer<UInt32>} pdwActualStreamIndex 
     * @param {Pointer<UInt32>} pdwStreamFlags 
     * @param {Pointer<Int64>} pllTimestamp 
     * @param {Pointer<IMFSample>} ppSample 
     * @returns {HRESULT} 
     */
    ReadSample(dwStreamIndex, dwControlFlags, pdwActualStreamIndex, pdwStreamFlags, pllTimestamp, ppSample) {
        result := ComCall(9, this, "uint", dwStreamIndex, "uint", dwControlFlags, "uint*", pdwActualStreamIndex, "uint*", pdwStreamFlags, "int64*", pllTimestamp, "ptr", ppSample, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwStreamIndex 
     * @returns {HRESULT} 
     */
    Flush(dwStreamIndex) {
        result := ComCall(10, this, "uint", dwStreamIndex, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwStreamIndex 
     * @param {Pointer<Guid>} guidService 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppvObject 
     * @returns {HRESULT} 
     */
    GetServiceForStream(dwStreamIndex, guidService, riid, ppvObject) {
        result := ComCall(11, this, "uint", dwStreamIndex, "ptr", guidService, "ptr", riid, "ptr", ppvObject, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwStreamIndex 
     * @param {Pointer<Guid>} guidAttribute 
     * @param {Pointer<PROPVARIANT>} pvarAttribute 
     * @returns {HRESULT} 
     */
    GetPresentationAttribute(dwStreamIndex, guidAttribute, pvarAttribute) {
        result := ComCall(12, this, "uint", dwStreamIndex, "ptr", guidAttribute, "ptr", pvarAttribute, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
