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
     * Creates an instance of the sink writer or source reader, given a URL.
     * @param {Pointer<Guid>} clsid The CLSID of the object to create.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CLSID_MFSinkWriter"></a><a id="clsid_mfsinkwriter"></a><a id="CLSID_MFSINKWRITER"></a><dl>
     * <dt><b><b>CLSID_MFSinkWriter</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Create the sink writer. The <i>ppvObject</i> parameter receives an <a href="https://docs.microsoft.com/windows/desktop/api/mfreadwrite/nn-mfreadwrite-imfsinkwriter">IMFSinkWriter</a> interface pointer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CLSID_MFSourceReader"></a><a id="clsid_mfsourcereader"></a><a id="CLSID_MFSOURCEREADER"></a><dl>
     * <dt><b><b>CLSID_MFSourceReader</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Create the source reader. The <i>ppvObject</i> parameter receives an <a href="https://docs.microsoft.com/windows/desktop/api/mfreadwrite/nn-mfreadwrite-imfsourcereader">IMFSourceReader</a> interface pointer.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {PWSTR} pwszURL A null-terminated string that contains a URL. If <i>clsid</i> is CLSID_<b>MFSinkWriter</b>, the URL specifies the name of the output file. The sink writer creates a new file with this name. If <i>clsid</i> is <b>CLSID_MFSourceReader</b>, the URL specifies the input file for the source reader.
     * @param {IMFAttributes} pAttributes A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfattributes">IMFAttributes</a> interface. You can use this parameter to configure the sink writer or source reader. For more information, see the following topics:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/medfound/sink-writer-attributes">Sink Writer Attributes</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/medfound/source-reader-attributes">Source Reader Attributes</a>
     * </li>
     * </ul>
     * This parameter can be <b>NULL</b>.
     * @param {Pointer<Guid>} riid The IID of the requested interface.
     * @returns {Pointer<Void>} Receives a pointer to the requested interface. The caller must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//mfreadwrite/nf-mfreadwrite-imfreadwriteclassfactory-createinstancefromurl
     */
    CreateInstanceFromURL(clsid, pwszURL, pAttributes, riid) {
        pwszURL := pwszURL is String ? StrPtr(pwszURL) : pwszURL

        result := ComCall(3, this, "ptr", clsid, "ptr", pwszURL, "ptr", pAttributes, "ptr", riid, "ptr*", &ppvObject := 0, "HRESULT")
        return ppvObject
    }

    /**
     * Creates an instance of the sink writer or source reader, given an IUnknown pointer.
     * @param {Pointer<Guid>} clsid The CLSID of the object to create.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CLSID_MFSinkWriter"></a><a id="clsid_mfsinkwriter"></a><a id="CLSID_MFSINKWRITER"></a><dl>
     * <dt><b><b>CLSID_MFSinkWriter</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Create the sink writer. The <i>ppvObject</i> parameter receives an <a href="https://docs.microsoft.com/windows/desktop/api/mfreadwrite/nn-mfreadwrite-imfsinkwriter">IMFSinkWriter</a> interface pointer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CLSID_MFSourceReader"></a><a id="clsid_mfsourcereader"></a><a id="CLSID_MFSOURCEREADER"></a><dl>
     * <dt><b><b>CLSID_MFSourceReader</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Create the source reader. The <i>ppvObject</i> parameter receives an <a href="https://docs.microsoft.com/windows/desktop/api/mfreadwrite/nn-mfreadwrite-imfsourcereader">IMFSourceReader</a> interface pointer.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {IUnknown} punkObject A pointer to the <b>IUnknown</b> interface of an object that is used to initialize the source reader or sink writer. The method queries this pointer for one of the following interfaces.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IMFByteStream"></a><a id="imfbytestream"></a><a id="IMFBYTESTREAM"></a><dl>
     * <dt><b><a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfbytestream">IMFByteStream</a></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Pointer to a byte stream. 
     * 
     * If <i>clsid</i> is <b>CLSID_MFSinkWriter</b>, the sink writer writes data to this byte stream.
     * 
     * If <i>clsid</i> is <b>CLSID_MFSourceReader</b>, this byte stream provides the source data for the source reader.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IMFMediaSink"></a><a id="imfmediasink"></a><a id="IMFMEDIASINK"></a><dl>
     * <dt><b><a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfmediasink">IMFMediaSink</a></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Pointer to a media sink. Applies only when <i>clsid</i> is <b>CLSID_MFSinkWriter</b>. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IMFMediaSource"></a><a id="imfmediasource"></a><a id="IMFMEDIASOURCE"></a><dl>
     * <dt><b><a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfmediasource">IMFMediaSource</a></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Pointer to a media source. Applies only when <i>clsid</i> is <b>CLSID_MFSourceReader</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {IMFAttributes} pAttributes A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfattributes">IMFAttributes</a> interface. You can use this parameter to configure the sink writer or source reader. For more information, see the following topics:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/medfound/sink-writer-attributes">Sink Writer Attributes</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/medfound/source-reader-attributes">Source Reader Attributes</a>
     * </li>
     * </ul>
     * This parameter can be <b>NULL</b>.
     * @param {Pointer<Guid>} riid The IID of the requested interface.
     * @returns {Pointer<Void>} Receives a pointer to the requested interface. The caller must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//mfreadwrite/nf-mfreadwrite-imfreadwriteclassfactory-createinstancefromobject
     */
    CreateInstanceFromObject(clsid, punkObject, pAttributes, riid) {
        result := ComCall(4, this, "ptr", clsid, "ptr", punkObject, "ptr", pAttributes, "ptr", riid, "ptr*", &ppvObject := 0, "HRESULT")
        return ppvObject
    }
}
