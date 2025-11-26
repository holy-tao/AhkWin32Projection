#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Initializes the Digital Living Network Alliance (DLNA) media sink.
 * @see https://docs.microsoft.com/windows/win32/api//mfmp2dlna/nn-mfmp2dlna-imfdlnasinkinit
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFDLNASinkInit extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFDLNASinkInit
     * @type {Guid}
     */
    static IID => Guid("{0c012799-1b61-4c10-bda9-04445be5f561}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize"]

    /**
     * Initializes the Digital Living Network Alliance (DLNA) media sink.
     * @param {IMFByteStream} pByteStream Pointer to a byte stream. The DLNA media sink writes data to this byte stream. The byte stream must be writable.
     * @param {BOOL} fPal If <b>TRUE</b>, the DLNA media sink accepts PAL video formats. Otherwise, it accepts NTSC video  formats.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>S_OK</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>MF_E_ALREADY_INITIALIZED</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method was already called.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>MF_E_SHUTDOWN</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The media sink's <a href="/windows/desktop/api/mfidl/nf-mfidl-imfmediasink-shutdown">IMFMediaSink::Shutdown</a> method was called.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfmp2dlna/nf-mfmp2dlna-imfdlnasinkinit-initialize
     */
    Initialize(pByteStream, fPal) {
        result := ComCall(3, this, "ptr", pByteStream, "int", fPal, "HRESULT")
        return result
    }
}
