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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetStreamSelection", "SetStreamSelection", "GetNativeMediaType", "GetCurrentMediaType", "SetCurrentMediaType", "SetCurrentPosition", "ReadSample", "Flush", "GetServiceForStream", "GetPresentationAttribute"]

    /**
     * 
     * @param {Integer} dwStreamIndex 
     * @param {Pointer<BOOL>} pfSelected 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfreadwrite/nf-mfreadwrite-imfsourcereader-getstreamselection
     */
    GetStreamSelection(dwStreamIndex, pfSelected) {
        result := ComCall(3, this, "uint", dwStreamIndex, "ptr", pfSelected, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwStreamIndex 
     * @param {BOOL} fSelected 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfreadwrite/nf-mfreadwrite-imfsourcereader-setstreamselection
     */
    SetStreamSelection(dwStreamIndex, fSelected) {
        result := ComCall(4, this, "uint", dwStreamIndex, "int", fSelected, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwStreamIndex 
     * @param {Integer} dwMediaTypeIndex 
     * @param {Pointer<IMFMediaType>} ppMediaType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfreadwrite/nf-mfreadwrite-imfsourcereader-getnativemediatype
     */
    GetNativeMediaType(dwStreamIndex, dwMediaTypeIndex, ppMediaType) {
        result := ComCall(5, this, "uint", dwStreamIndex, "uint", dwMediaTypeIndex, "ptr*", ppMediaType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwStreamIndex 
     * @param {Pointer<IMFMediaType>} ppMediaType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfreadwrite/nf-mfreadwrite-imfsourcereader-getcurrentmediatype
     */
    GetCurrentMediaType(dwStreamIndex, ppMediaType) {
        result := ComCall(6, this, "uint", dwStreamIndex, "ptr*", ppMediaType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwStreamIndex 
     * @param {IMFMediaType} pMediaType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfreadwrite/nf-mfreadwrite-imfsourcereader-setcurrentmediatype
     */
    SetCurrentMediaType(dwStreamIndex, pMediaType) {
        static pdwReserved := 0 ;Reserved parameters must always be NULL

        result := ComCall(7, this, "uint", dwStreamIndex, "uint*", pdwReserved, "ptr", pMediaType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} guidTimeFormat 
     * @param {Pointer<PROPVARIANT>} varPosition 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfreadwrite/nf-mfreadwrite-imfsourcereader-setcurrentposition
     */
    SetCurrentPosition(guidTimeFormat, varPosition) {
        result := ComCall(8, this, "ptr", guidTimeFormat, "ptr", varPosition, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwStreamIndex 
     * @param {Integer} dwControlFlags 
     * @param {Pointer<Integer>} pdwActualStreamIndex 
     * @param {Pointer<Integer>} pdwStreamFlags 
     * @param {Pointer<Integer>} pllTimestamp 
     * @param {Pointer<IMFSample>} ppSample 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfreadwrite/nf-mfreadwrite-imfsourcereader-readsample
     */
    ReadSample(dwStreamIndex, dwControlFlags, pdwActualStreamIndex, pdwStreamFlags, pllTimestamp, ppSample) {
        result := ComCall(9, this, "uint", dwStreamIndex, "uint", dwControlFlags, "uint*", pdwActualStreamIndex, "uint*", pdwStreamFlags, "int64*", pllTimestamp, "ptr*", ppSample, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwStreamIndex 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfreadwrite/nf-mfreadwrite-imfsourcereader-flush
     */
    Flush(dwStreamIndex) {
        result := ComCall(10, this, "uint", dwStreamIndex, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwStreamIndex 
     * @param {Pointer<Guid>} guidService 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppvObject 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfreadwrite/nf-mfreadwrite-imfsourcereader-getserviceforstream
     */
    GetServiceForStream(dwStreamIndex, guidService, riid, ppvObject) {
        result := ComCall(11, this, "uint", dwStreamIndex, "ptr", guidService, "ptr", riid, "ptr*", ppvObject, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwStreamIndex 
     * @param {Pointer<Guid>} guidAttribute 
     * @param {Pointer<PROPVARIANT>} pvarAttribute 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfreadwrite/nf-mfreadwrite-imfsourcereader-getpresentationattribute
     */
    GetPresentationAttribute(dwStreamIndex, guidAttribute, pvarAttribute) {
        result := ComCall(12, this, "uint", dwStreamIndex, "ptr", guidAttribute, "ptr", pvarAttribute, "HRESULT")
        return result
    }
}
