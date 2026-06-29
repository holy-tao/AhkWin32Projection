#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IFileSystemImage.ahk" { IFileSystemImage }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\SAFEARRAY.ahk" { SAFEARRAY }

/**
 * Use this interface to write multiple boot entries or boot images required for the EFI/UEFI support. For example, boot media with boot straps for both Windows XP and Windows Vista.
 * @remarks
 * Boot entries are limited by the interface to 32 per disc.	The boot image must be supplied to IMAPIv2FS by outside applications who invoke IMAPIv2FS to build the bootable disc.
 * 
 * Section Entry Extension is not supported by IMAPIv2FS at this time.
 * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nn-imapi2fs-ifilesystemimage2
 * @namespace Windows.Win32.Storage.Imapi
 */
export default struct IFileSystemImage2 extends IFileSystemImage {
    /**
     * The interface identifier for IFileSystemImage2
     * @type {Guid}
     */
    static IID := Guid("{d7644b2c-1537-4767-b62f-f1387b02ddfd}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IFileSystemImage2 interfaces
    */
    struct Vtbl extends IFileSystemImage.Vtbl {
        get_BootImageOptionsArray : IntPtr
        put_BootImageOptionsArray : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IFileSystemImage2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Pointer<SAFEARRAY>} 
     */
    BootImageOptionsArray {
        get => this.get_BootImageOptionsArray()
        set => this.put_BootImageOptionsArray(value)
    }

    /**
     * Retrieves the boot option array that will be utilized to generate the file system image.
     * @remarks
     * The <b>SAFEARRAY</b> will be a one-dimensional array. If a boot image is not specified, a zero-sized array will be returned.
     * @returns {Pointer<SAFEARRAY>} Pointer to a boot option array that contains a list of <a href="https://docs.microsoft.com/windows/desktop/api/imapi2fs/nn-imapi2fs-ibootoptions">IBootOptions</a> interfaces of boot images used to generate the file system image. Each element of the list is a <b>VARIANT</b> of type <b>VT_DISPATCH</b>.
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-ifilesystemimage2-get_bootimageoptionsarray
     */
    get_BootImageOptionsArray() {
        result := ComCall(57, this, "ptr*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * Sets the boot option array that will be utilized to generate the file system image. Unlike IFileSystemImage::put_BootImageOptions, this method will not create a complete copy of each boot options array element, but instead use references to each element.
     * @remarks
     * The <b>SAFEARRAY</b> must be a one dimensional array. A zero-size array is allowed, but it will result in a regular, non-bootable disc.
     * 
     * The boot images sequence on the disc will match the sequence specified in the <b>SAFEARRAY</b>. Both <b>put_BootImageOptionsArray</b> and <a href="https://docs.microsoft.com/windows/desktop/api/imapi2fs/nf-imapi2fs-ifilesystemimage-put_bootimageoptions">put_BootImageOptions</a> are used for specifying the boot image, the latter function being invoked before the disc image created takes effect.
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/imapi2fs/nf-imapi2fs-ifilesystemimage2-get_bootimageoptionsarray">get_BootImageOptionsArray</a> and <a href="https://docs.microsoft.com/windows/desktop/api/imapi2fs/nf-imapi2fs-ifilesystemimage-get_bootimageoptions">get_BootImageOptions</a> functions will retrieve the result of the last calls of put_BootImageOptionsArray or <a href="https://docs.microsoft.com/windows/desktop/api/imapi2fs/nf-imapi2fs-ifilesystemimage-put_bootimageoptions">put_BootImageOptions</a>. The use of these functions should be synchronized.
     * @param {Pointer<SAFEARRAY>} newVal List of <a href="https://docs.microsoft.com/windows/desktop/api/imapi2fs/nn-imapi2fs-ibootoptions">IBootOptions</a> interfaces of the boot images that will be utilized to generate the file system image. Each element of the list is a <b>VARIANT</b> of the type <b>VT_DISPATCH</b>.
     * @returns {HRESULT} S_OK is returned on success, but other success codes may be returned as a result of implementation. The following error codes are commonly returned on operation failure, but do not represent the only possible error values:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOINTERFACE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No such interface supported.
     * 
     * Value: 0x80004002
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>IMAPI_E_BOOT_OBJECT_CONFLICT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A boot object can only be included in an initial disc image.
     * 
     * Value: 0xC0AAB149
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>IMAPI_E_BOOT_IMAGE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The boot object could not be added to the image.
     * 
     * Value: 0xC0AAB148
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-ifilesystemimage2-put_bootimageoptionsarray
     */
    put_BootImageOptionsArray(newVal) {
        result := ComCall(58, this, SAFEARRAY.Ptr, newVal, "HRESULT")
        return result
    }

    Query(iid) {
        if (IFileSystemImage2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_BootImageOptionsArray := CallbackCreate(GetMethod(implObj, "get_BootImageOptionsArray"), flags, 2)
        this.vtbl.put_BootImageOptionsArray := CallbackCreate(GetMethod(implObj, "put_BootImageOptionsArray"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_BootImageOptionsArray)
        CallbackFree(this.vtbl.put_BootImageOptionsArray)
    }
}
