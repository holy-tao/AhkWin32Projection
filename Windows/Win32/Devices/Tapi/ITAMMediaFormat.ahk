#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ITAMMediaFormat interface sets and gets DirectShow media format.
 * @see https://docs.microsoft.com/windows/win32/api//tapi3ds/nn-tapi3ds-itammediaformat
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class ITAMMediaFormat extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITAMMediaFormat
     * @type {Guid}
     */
    static IID => Guid("{0364eb00-4a77-11d1-a671-006097c9a2e8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_MediaFormat", "put_MediaFormat"]

    /**
     * @type {Pointer<AM_MEDIA_TYPE>} 
     */
    MediaFormat {
        get => this.get_MediaFormat()
        set => this.put_MediaFormat(value)
    }

    /**
     * The get_MediaFormat method gets the media format.
     * @returns {Pointer<AM_MEDIA_TYPE>} Pointer to an array of 
     * <b>AM_MEDIA_TYPE</b> structures. For more information on <b>AM_MEDIA_TYPE</b>, see the DirectX documentation.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3ds/nf-tapi3ds-itammediaformat-get_mediaformat
     */
    get_MediaFormat() {
        result := ComCall(3, this, "ptr*", &ppmt := 0, "HRESULT")
        return ppmt
    }

    /**
     * The put_MediaFormat method sets the media format.
     * @param {Pointer<AM_MEDIA_TYPE>} pmt Pointer to 
     * <b>AM_MEDIA_TYPE</b> structure. For more information on <b>AM_MEDIA_TYPE</b>, see the DirectX documentation.
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
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory exists to perform the operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//tapi3ds/nf-tapi3ds-itammediaformat-put_mediaformat
     */
    put_MediaFormat(pmt) {
        result := ComCall(4, this, "ptr", pmt, "HRESULT")
        return result
    }
}
