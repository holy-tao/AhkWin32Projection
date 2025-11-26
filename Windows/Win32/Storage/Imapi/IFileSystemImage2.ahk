#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IFileSystemImage.ahk

/**
 * Use this interface to write multiple boot entries or boot images required for the EFI/UEFI support. For example, boot media with boot straps for both Windows XP and Windows Vista.
 * @remarks
 * 
 *  Boot entries are limited by the interface to 32 per disc.	The boot image must be supplied to IMAPIv2FS by outside applications who invoke IMAPIv2FS to build the bootable disc.
 * 
 * Section Entry Extension is not supported by IMAPIv2FS at this time.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//imapi2fs/nn-imapi2fs-ifilesystemimage2
 * @namespace Windows.Win32.Storage.Imapi
 * @version v4.0.30319
 */
class IFileSystemImage2 extends IFileSystemImage{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFileSystemImage2
     * @type {Guid}
     */
    static IID => Guid("{d7644b2c-1537-4767-b62f-f1387b02ddfd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 57

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_BootImageOptionsArray", "put_BootImageOptionsArray"]

    /**
     * @type {Pointer<SAFEARRAY>} 
     */
    BootImageOptionsArray {
        get => this.get_BootImageOptionsArray()
        set => this.put_BootImageOptionsArray(value)
    }

    /**
     * Retrieves the boot option array that will be utilized to generate the file system image.
     * @returns {Pointer<SAFEARRAY>} Pointer to a boot option array that contains a list of <a href="https://docs.microsoft.com/windows/desktop/api/imapi2fs/nn-imapi2fs-ibootoptions">IBootOptions</a> interfaces of boot images used to generate the file system image. Each element of the list is a <b>VARIANT</b> of type <b>VT_DISPATCH</b>.
     * @see https://docs.microsoft.com/windows/win32/api//imapi2fs/nf-imapi2fs-ifilesystemimage2-get_bootimageoptionsarray
     */
    get_BootImageOptionsArray() {
        result := ComCall(57, this, "ptr*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * Sets the boot option array that will be utilized to generate the file system image. Unlike IFileSystemImage::put_BootImageOptions, this method will not create a complete copy of each boot options array element, but instead use references to each element.
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
     * @see https://docs.microsoft.com/windows/win32/api//imapi2fs/nf-imapi2fs-ifilesystemimage2-put_bootimageoptionsarray
     */
    put_BootImageOptionsArray(newVal) {
        result := ComCall(58, this, "ptr", newVal, "HRESULT")
        return result
    }
}
