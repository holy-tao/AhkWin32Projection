#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Gets and sets media types on an object, such as a media source or media sink.
 * @remarks
 * 
  * This interface is exposed by <i>media-type handlers</i>.
  * 
  * <ul>
  * <li> For media sources, get the media-type handler from the stream descriptor by calling <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfstreamdescriptor-getmediatypehandler">IMFStreamDescriptor::GetMediaTypeHandler</a>.</li>
  * <li>For media sinks, get the media-type handler by calling <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfstreamsink-getmediatypehandler">IMFStreamSink::GetMediaTypeHandler</a>.</li>
  * </ul>
  * If you are implementing a custom media source or media sink, you can create a simple media-type handler by calling <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-mfcreatesimpletypehandler">MFCreateSimpleTypeHandler</a>, or you can provide your own implementation.
  * 
  * This interface is available on the following platforms if the Windows Media Format 11 SDK redistributable components are installed:
  * 
  * <ul>
  * <li>Windows XP with Service Pack 2 (SP2) and later.</li>
  * <li>Windows XP Media Center Edition 2005 with KB900325 (Windows XP Media Center Edition 2005) and KB925766 (October 2006 Update Rollup for Windows XP Media Center Edition) installed.</li>
  * </ul>
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/nn-mfidl-imfmediatypehandler
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFMediaTypeHandler extends IUnknown{
    /**
     * The interface identifier for IMFMediaTypeHandler
     * @type {Guid}
     */
    static IID => Guid("{e93dcf6c-4b07-4e1e-8123-aa16ed6eadf5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IMFMediaType>} pMediaType 
     * @param {Pointer<IMFMediaType>} ppMediaType 
     * @returns {HRESULT} 
     */
    IsMediaTypeSupported(pMediaType, ppMediaType) {
        result := ComCall(3, this, "ptr", pMediaType, "ptr", ppMediaType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwTypeCount 
     * @returns {HRESULT} 
     */
    GetMediaTypeCount(pdwTypeCount) {
        result := ComCall(4, this, "uint*", pdwTypeCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwIndex 
     * @param {Pointer<IMFMediaType>} ppType 
     * @returns {HRESULT} 
     */
    GetMediaTypeByIndex(dwIndex, ppType) {
        result := ComCall(5, this, "uint", dwIndex, "ptr", ppType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMFMediaType>} pMediaType 
     * @returns {HRESULT} 
     */
    SetCurrentMediaType(pMediaType) {
        result := ComCall(6, this, "ptr", pMediaType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMFMediaType>} ppMediaType 
     * @returns {HRESULT} 
     */
    GetCurrentMediaType(ppMediaType) {
        result := ComCall(7, this, "ptr", ppMediaType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pguidMajorType 
     * @returns {HRESULT} 
     */
    GetMajorType(pguidMajorType) {
        result := ComCall(8, this, "ptr", pguidMajorType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
