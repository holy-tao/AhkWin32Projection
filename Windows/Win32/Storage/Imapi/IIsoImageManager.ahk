#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IStream.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Use this interface to verify if an existing .iso file contains a valid file system for burning.
 * @remarks
 * 
 * If a valid path is provided via <a href="https://docs.microsoft.com/windows/desktop/api/imapi2fs/nf-imapi2fs-iisoimagemanager-setpath">SetPath</a>, an <b>IStream</b> object will be created from the supplied image file and the <b>Stream</b> property will be populated.
 * If a valid <b>IStream</b> is provided via <a href="https://docs.microsoft.com/windows/desktop/api/imapi2fs/nf-imapi2fs-iisoimagemanager-setstream">SetStream</a>, it will be used directly for image validation and the <b>Path</b> property will not be populated.
 * 
 * This interface is supported in Windows Server 2003 with Service Pack 1 (SP1), Windows XP with Service Pack 2 (SP2),  and Windows Vista  via the Windows Feature Pack for Storage. All  features provided by this  update package are supported natively in Windows 7 and Windows Server 2008 R2.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//imapi2fs/nn-imapi2fs-iisoimagemanager
 * @namespace Windows.Win32.Storage.Imapi
 * @version v4.0.30319
 */
class IIsoImageManager extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IIsoImageManager
     * @type {Guid}
     */
    static IID => Guid("{6ca38be5-fbbb-4800-95a1-a438865eb0d4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Path", "get_Stream", "SetPath", "SetStream", "Validate"]

    /**
     * @type {BSTR} 
     */
    Path {
        get => this.get_Path()
    }

    /**
     * @type {IStream} 
     */
    Stream {
        get => this.get_Stream()
    }

    /**
     * Retrives the logical path to an .iso image.
     * @remarks
     * 
     * This method is supported in Windows Server 2003 with Service Pack 1 (SP1), Windows XP with Service Pack 2 (SP2),  and Windows Vista  via the Windows Feature Pack for Storage. All  features provided by this  update package are supported natively in Windows 7 and Windows Server 2008 R2.
     * 
     * 
     * @returns {BSTR} Pointer to the logical path to an .iso image. For example, "c:\\path\\file.iso".
     * @see https://docs.microsoft.com/windows/win32/api//imapi2fs/nf-imapi2fs-iisoimagemanager-get_path
     */
    get_Path() {
        pVal := BSTR()
        result := ComCall(7, this, "ptr", pVal, "HRESULT")
        return pVal
    }

    /**
     * Retrieves the IStream object associated with the .iso image.
     * @returns {IStream} The <b>IStream</b> object associated with the .iso image.
     * @see https://docs.microsoft.com/windows/win32/api//imapi2fs/nf-imapi2fs-iisoimagemanager-get_stream
     */
    get_Stream() {
        result := ComCall(8, this, "ptr*", &data := 0, "HRESULT")
        return IStream(data)
    }

    /**
     * Sets the Path property value with a logical path to an .iso image.
     * @param {BSTR} Val The logical path to the .iso image. For example, "c:\\path\\file.iso".
     * @returns {HRESULT} S_OK is returned on success, but other success codes may be returned as a result of implementation.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>IMAPI_E_INVALID_PATH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Path '%1!s!' is badly formed or contains invalid characters.
     * 
     * Value: 0xC0AAB110
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//imapi2fs/nf-imapi2fs-iisoimagemanager-setpath
     */
    SetPath(Val) {
        Val := Val is String ? BSTR.Alloc(Val).Value : Val

        result := ComCall(9, this, "ptr", Val, "HRESULT")
        return result
    }

    /**
     * Sets the Stream property with the IStream object associated with the .iso image.
     * @param {IStream} data The <b>IStream</b> object associated with the .iso image.
     * @returns {HRESULT} S_OK is returned on success, but other success codes may be returned as a result of implementation.
     * @see https://docs.microsoft.com/windows/win32/api//imapi2fs/nf-imapi2fs-iisoimagemanager-setstream
     */
    SetStream(data) {
        result := ComCall(10, this, "ptr", data, "HRESULT")
        return result
    }

    /**
     * Determines if the provided .iso image is valid.
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
     * <dt><b>IMAPI_E_IMAGEMANAGER_IMAGE_NOT_ALIGNED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The image is not aligned on a 2kb sector boundary.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>IMAPI_E_IMAGEMANAGER_NO_VALID_VD_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The image does not contain a valid volume descriptor.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>IMAPI_E_IMAGEMANAGER_NO_IMAGE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The image has not been set using the <a href="/windows/desktop/api/imapi2fs/nf-imapi2fs-iisoimagemanager-setpath">SetPath</a> or <a href="/windows/desktop/api/imapi2fs/nf-imapi2fs-iisoimagemanager-setstream">SetStream</a> method prior to calling this method.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>IMAPI_E_IMAGEMANAGER_IMAGE_TOO_BIG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The provided image is too large to be validated as the size exceeds MAXLONG.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//imapi2fs/nf-imapi2fs-iisoimagemanager-validate
     */
    Validate() {
        result := ComCall(11, this, "HRESULT")
        return result
    }
}
