#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IStream.ahk" { IStream }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Use this interface to verify if an existing .iso file contains a valid file system for burning.
 * @remarks
 * If a valid path is provided via <a href="https://docs.microsoft.com/windows/desktop/api/imapi2fs/nf-imapi2fs-iisoimagemanager-setpath">SetPath</a>, an <b>IStream</b> object will be created from the supplied image file and the <b>Stream</b> property will be populated.
 * If a valid <b>IStream</b> is provided via <a href="https://docs.microsoft.com/windows/desktop/api/imapi2fs/nf-imapi2fs-iisoimagemanager-setstream">SetStream</a>, it will be used directly for image validation and the <b>Path</b> property will not be populated.
 * 
 * This interface is supported in Windows Server 2003 with Service Pack 1 (SP1), Windows XP with Service Pack 2 (SP2),  and Windows Vista  via the Windows Feature Pack for Storage. All  features provided by this  update package are supported natively in Windows 7 and Windows Server 2008 R2.
 * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nn-imapi2fs-iisoimagemanager
 * @namespace Windows.Win32.Storage.Imapi
 */
export default struct IIsoImageManager extends IDispatch {
    /**
     * The interface identifier for IIsoImageManager
     * @type {Guid}
     */
    static IID := Guid("{6ca38be5-fbbb-4800-95a1-a438865eb0d4}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IIsoImageManager interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Path   : IntPtr
        get_Stream : IntPtr
        SetPath    : IntPtr
        SetStream  : IntPtr
        Validate   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IIsoImageManager.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * Retrieves the logical path to an .iso image.
     * @remarks
     * This method is supported in Windows Server 2003 with Service Pack 1 (SP1), Windows XP with Service Pack 2 (SP2),  and Windows Vista  via the Windows Feature Pack for Storage. All  features provided by this  update package are supported natively in Windows 7 and Windows Server 2008 R2.
     * @returns {BSTR} Pointer to the logical path to an .iso image. For example, "c:\\path\\file.iso".
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-iisoimagemanager-get_path
     */
    get_Path() {
        pVal := BSTR.Owned()
        result := ComCall(7, this, BSTR.Ptr, pVal, "HRESULT")
        return pVal
    }

    /**
     * Retrieves the IStream object associated with the .iso image.
     * @remarks
     * This method is supported in Windows Server 2003 with Service Pack 1 (SP1), Windows XP with Service Pack 2 (SP2),  and Windows Vista  via the Windows Feature Pack for Storage. All  features provided by this  update package are supported natively in Windows 7 and Windows Server 2008 R2.
     * @returns {IStream} The <b>IStream</b> object associated with the .iso image.
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-iisoimagemanager-get_stream
     */
    get_Stream() {
        result := ComCall(8, this, "ptr*", &data := 0, "HRESULT")
        return IStream(data)
    }

    /**
     * Sets the Path property value with a logical path to an .iso image.
     * @remarks
     * This method is supported in Windows Server 2003 with Service Pack 1 (SP1), Windows XP with Service Pack 2 (SP2),  and Windows Vista  via the Windows Feature Pack for Storage. All  features provided by this  update package are supported natively in Windows 7 and Windows Server 2008 R2.
     * @param {BSTR} _Val The logical path to the .iso image. For example, "c:\\path\\file.iso".
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
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-iisoimagemanager-setpath
     */
    SetPath(_Val) {
        _Val := _Val is String ? BSTR.Alloc(_Val).Value : _Val

        result := ComCall(9, this, BSTR, _Val, "HRESULT")
        return result
    }

    /**
     * Sets the Stream property with the IStream object associated with the .iso image.
     * @remarks
     * This method is supported in Windows Server 2003 with Service Pack 1 (SP1), Windows XP with Service Pack 2 (SP2),  and Windows Vista  via the Windows Feature Pack for Storage. All  features provided by this  update package are supported natively in Windows 7 and Windows Server 2008 R2.
     * @param {IStream} data The <b>IStream</b> object associated with the .iso image.
     * @returns {HRESULT} S_OK is returned on success, but other success codes may be returned as a result of implementation.
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-iisoimagemanager-setstream
     */
    SetStream(data) {
        result := ComCall(10, this, "ptr", data, "HRESULT")
        return result
    }

    /**
     * Determines if the provided .iso image is valid.
     * @remarks
     * For this method to succeed, the disc image, which may be a file or a stream, must meet the following criteria:<ul>
     * <li>The disc image size must be a multiple of the sector user data size, 2048 bytes.</li>
     * <li>The disc image must contain user data only and no sector header or file header.</li>
     * <li>The disc image must contain a valid Volume Recognition Sequence with at least one Volume Descriptor such as described in ECMA <a href="https://www.ecma-international.org/publications/standards/Ecma-119.htm">119</a>, <a href="https://www.ecma-international.org/publications/standards/Ecma-167.htm">167</a>, <a href="https://www.ecma-international.org/publications/standards/Ecma-168.htm">168</a> standards.</li>
     * </ul> 
     *  
     * If the disc image does not fit these criteria, this method will return the relevant failure code. More importantly, a failure to validate will affect the probability of operation success when the image is mounted by Windows after recording.
     * 
     * This method is supported in Windows Server 2003 with Service Pack 1 (SP1), Windows XP with Service Pack 2 (SP2),  and Windows Vista  via the Windows Feature Pack for Storage. All  features provided by this  update package are supported natively in Windows 7 and Windows Server 2008 R2.
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
     * The image has not been set using the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2fs/nf-imapi2fs-iisoimagemanager-setpath">SetPath</a> or <a href="https://docs.microsoft.com/windows/desktop/api/imapi2fs/nf-imapi2fs-iisoimagemanager-setstream">SetStream</a> method prior to calling this method.
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
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-iisoimagemanager-validate
     */
    Validate() {
        result := ComCall(11, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IIsoImageManager.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Path := CallbackCreate(GetMethod(implObj, "get_Path"), flags, 2)
        this.vtbl.get_Stream := CallbackCreate(GetMethod(implObj, "get_Stream"), flags, 2)
        this.vtbl.SetPath := CallbackCreate(GetMethod(implObj, "SetPath"), flags, 2)
        this.vtbl.SetStream := CallbackCreate(GetMethod(implObj, "SetStream"), flags, 2)
        this.vtbl.Validate := CallbackCreate(GetMethod(implObj, "Validate"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Path)
        CallbackFree(this.vtbl.get_Stream)
        CallbackFree(this.vtbl.SetPath)
        CallbackFree(this.vtbl.SetStream)
        CallbackFree(this.vtbl.Validate)
    }
}
