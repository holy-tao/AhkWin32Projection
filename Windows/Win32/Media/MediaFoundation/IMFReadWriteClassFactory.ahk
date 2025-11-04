#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Creates an instance of either the sink writer or the source reader.
 * @remarks
 * 
  * To get a pointer to this interface, call the <b>CoCreateInstance</b> function. The CLSID is <b>CLSID_MFReadWriteClassFactory</b>. Call the <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfstartup">MFStartup</a> function before using  the interface.
  * 
  * As an alternative to using this interface, you can call any of the following functions:
  * 
  * <ul>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/api/mfreadwrite/nf-mfreadwrite-mfcreatesinkwriterfrommediasink">MFCreateSinkWriterFromMediaSink</a>
  * </li>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/api/mfreadwrite/nf-mfreadwrite-mfcreatesinkwriterfromurl">MFCreateSinkWriterFromURL</a>
  * </li>
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
  * Internally, these functions use the <b>IMFReadWriteClassFactory</b> interface.
  * 
  * This interface is available on Windows Vista if Platform Update Supplement for Windows Vista is installed.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//mfreadwrite/nn-mfreadwrite-imfreadwriteclassfactory
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFReadWriteClassFactory extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFReadWriteClassFactory
     * @type {Guid}
     */
    static IID => Guid("{e7fe2e12-661c-40da-92f9-4f002ab67627}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateInstanceFromURL", "CreateInstanceFromObject"]

    /**
     * 
     * @param {Pointer<Guid>} clsid 
     * @param {PWSTR} pwszURL 
     * @param {IMFAttributes} pAttributes 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppvObject 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfreadwrite/nf-mfreadwrite-imfreadwriteclassfactory-createinstancefromurl
     */
    CreateInstanceFromURL(clsid, pwszURL, pAttributes, riid, ppvObject) {
        pwszURL := pwszURL is String ? StrPtr(pwszURL) : pwszURL

        ppvObjectMarshal := ppvObject is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "ptr", clsid, "ptr", pwszURL, "ptr", pAttributes, "ptr", riid, ppvObjectMarshal, ppvObject, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} clsid 
     * @param {IUnknown} punkObject 
     * @param {IMFAttributes} pAttributes 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppvObject 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfreadwrite/nf-mfreadwrite-imfreadwriteclassfactory-createinstancefromobject
     */
    CreateInstanceFromObject(clsid, punkObject, pAttributes, riid, ppvObject) {
        ppvObjectMarshal := ppvObject is VarRef ? "ptr*" : "ptr"

        result := ComCall(4, this, "ptr", clsid, "ptr", punkObject, "ptr", pAttributes, "ptr", riid, ppvObjectMarshal, ppvObject, "HRESULT")
        return result
    }
}
