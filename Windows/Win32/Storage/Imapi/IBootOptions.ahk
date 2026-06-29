#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\PlatformId.ahk" { PlatformId }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IStream.ahk" { IStream }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\EmulationType.ahk" { EmulationType }

/**
 * Use this interface to specify the boot image to add to the optical disc. A boot image contains one or more sectors of code used to start the computer.
 * @remarks
 * This interface supports the "El Torito" Bootable CD-ROM format specification. 
 * 
 * To add the boot image to a file system image, call the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2fs/nf-imapi2fs-ifilesystemimage-put_bootimageoptions">IFileSystemImage::put_BootImageOptions</a> method. 
 * 
 * To get the boot image associated with a file system image, call the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2fs/nf-imapi2fs-ifilesystemimage-get_bootimageoptions">IFileSystemImage::get_BootImageOptions</a> method.
 * 
 * To create the <b>BootOptions</b> object in a script, use IMAPI2.BootOptions as the program identifier when calling <b>CreateObject</b>.
 * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nn-imapi2fs-ibootoptions
 * @namespace Windows.Win32.Storage.Imapi
 */
export default struct IBootOptions extends IDispatch {
    /**
     * The interface identifier for IBootOptions
     * @type {Guid}
     */
    static IID := Guid("{2c941fd4-975b-59be-a960-9a2a262853a5}")

    /**
     * The class identifier for BootOptions
     * @type {Guid}
     */
    static CLSID := Guid("{2c941fce-975b-59be-a960-9a2a262853a5}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IBootOptions interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_BootImage    : IntPtr
        get_Manufacturer : IntPtr
        put_Manufacturer : IntPtr
        get_PlatformId   : IntPtr
        put_PlatformId   : IntPtr
        get_Emulation    : IntPtr
        put_Emulation    : IntPtr
        get_ImageSize    : IntPtr
        AssignBootImage  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IBootOptions.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {IStream} 
     */
    BootImage {
        get => this.get_BootImage()
    }

    /**
     * @type {BSTR} 
     */
    Manufacturer {
        get => this.get_Manufacturer()
        set => this.put_Manufacturer(value)
    }

    /**
     * @type {PlatformId} 
     */
    PlatformId {
        get => this.get_PlatformId()
        set => this.put_PlatformId(value)
    }

    /**
     * @type {EmulationType} 
     */
    Emulation {
        get => this.get_Emulation()
        set => this.put_Emulation(value)
    }

    /**
     * @type {Integer} 
     */
    ImageSize {
        get => this.get_ImageSize()
    }

    /**
     * Retrieves a pointer to the boot image data stream.
     * @returns {IStream} Pointer to the <b>IStream</b> interface associated with the boot image data stream.
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-ibootoptions-get_bootimage
     */
    get_BootImage() {
        result := ComCall(7, this, "ptr*", &pVal := 0, "HRESULT")
        return IStream(pVal)
    }

    /**
     * Retrieves the identifier of the manufacturer of the CD.
     * @returns {BSTR} Identifier of the manufacturer of the CD.
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-ibootoptions-get_manufacturer
     */
    get_Manufacturer() {
        pVal := BSTR.Owned()
        result := ComCall(8, this, BSTR.Ptr, pVal, "HRESULT")
        return pVal
    }

    /**
     * Sets an identifier that identifies the manufacturer or developer of the CD.
     * @param {BSTR} newVal Identifier that identifies the manufacturer or developer of the CD. This is an ANSI string that is limited to 24 bytes. The string does not need to include a NULL character; however, you must set unused bytes to 0x00.
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
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Pointer is not valid.
     * 
     * Value: 0x80004003
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>	IMAPI_E_INVALID_PARAM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The provided <i>newVal</i> parameter is not valid.
     * 
     * Value: 0xC0AAB101
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-ibootoptions-put_manufacturer
     */
    put_Manufacturer(newVal) {
        newVal := newVal is String ? BSTR.Alloc(newVal).Value : newVal

        result := ComCall(9, this, BSTR, newVal, "HRESULT")
        return result
    }

    /**
     * Retrieves the platform identifier that identifies the operating system architecture that the boot image supports.
     * @returns {PlatformId} Identifies the operating system architecture that the boot image supports. For possible values, see the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2fs/ne-imapi2fs-platformid">PlatformId</a> enumeration type.
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-ibootoptions-get_platformid
     */
    get_PlatformId() {
        result := ComCall(10, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * Sets the platform identifier that identifies the operating system architecture that the boot image supports.
     * @param {PlatformId} newVal Identifies the operating system architecture that the boot image supports. For possible values, see the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2fs/ne-imapi2fs-platformid">PlatformId</a> enumeration type. The default value is  <b>PlatformX86</b> for Intel x86–based platforms.
     * @returns {HRESULT} S_OK is returned on success, but other success codes may be returned as a result of implementation.
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-ibootoptions-put_platformid
     */
    put_PlatformId(newVal) {
        result := ComCall(11, this, PlatformId, newVal, "HRESULT")
        return result
    }

    /**
     * Retrieves the media type that the boot image is intended to emulate.
     * @returns {EmulationType} Media type that the boot image is intended to emulate. For possible values, see the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2fs/ne-imapi2fs-emulationtype">EmulationType</a> enumeration type.
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-ibootoptions-get_emulation
     */
    get_Emulation() {
        result := ComCall(12, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * Sets the media type that the boot image is intended to emulate.
     * @param {EmulationType} newVal Media type that the boot image is intended to emulate. For possible values, see the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2fs/ne-imapi2fs-emulationtype">EmulationType</a> enumeration type. The default value is <b>EmulationNone</b>, which means the BIOS will not emulate any device type or special sector size for the CD during boot from the CD.
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
     * <dt><b>IMAPI_E_BOOT_EMULATION_IMAGE_SIZE_MISMATCH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The emulation type requested does not match the boot image size.
     * 
     * Value: 0xC0AAB14A
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-ibootoptions-put_emulation
     */
    put_Emulation(newVal) {
        result := ComCall(13, this, EmulationType, newVal, "HRESULT")
        return result
    }

    /**
     * Retrieves the size of the boot image.
     * @returns {Integer} Size, in bytes, of the boot image.
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-ibootoptions-get_imagesize
     */
    get_ImageSize() {
        result := ComCall(14, this, "uint*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * Sets the data stream that contains the boot image.
     * @remarks
     * If the size of the newly assigned boot image is either 1.2, 1.44. or 2.88 MB, this method will automatically adjust the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2fs/ne-imapi2fs-emulationtype">EmulationType</a> value to the respective "floppy" type value.   It is, however, possible to  override the default or previously assigned <b>EmulationType</b> value by calling the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2fs/nf-imapi2fs-ibootoptions-put_emulation">IBootOptions::put_Emulation</a> method.
     * 
     * The additional specification of the platform on which to use the boot image requires the call to the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2fs/nf-imapi2fs-ibootoptions-put_platformid">IBootOptions::put_PlatformId</a> method.
     * 
     * IMAPI does not include any boot images; developers must provide their own boot images.
     * @param {IStream} newVal An <b>IStream</b> interface of the data stream that contains the boot image.
     * @returns {HRESULT} S_OK is returned on success, but other success codes may be returned as a result of implementation. The following error codes are commonly returned on operation failure, but do not represent the only possible error values:
     * 
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Pointer is not valid.
     * 
     * Value: 0x80004003
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
     * Value: 0xC0AAB142
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-ibootoptions-assignbootimage
     */
    AssignBootImage(newVal) {
        result := ComCall(15, this, "ptr", newVal, "HRESULT")
        return result
    }

    Query(iid) {
        if (IBootOptions.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_BootImage := CallbackCreate(GetMethod(implObj, "get_BootImage"), flags, 2)
        this.vtbl.get_Manufacturer := CallbackCreate(GetMethod(implObj, "get_Manufacturer"), flags, 2)
        this.vtbl.put_Manufacturer := CallbackCreate(GetMethod(implObj, "put_Manufacturer"), flags, 2)
        this.vtbl.get_PlatformId := CallbackCreate(GetMethod(implObj, "get_PlatformId"), flags, 2)
        this.vtbl.put_PlatformId := CallbackCreate(GetMethod(implObj, "put_PlatformId"), flags, 2)
        this.vtbl.get_Emulation := CallbackCreate(GetMethod(implObj, "get_Emulation"), flags, 2)
        this.vtbl.put_Emulation := CallbackCreate(GetMethod(implObj, "put_Emulation"), flags, 2)
        this.vtbl.get_ImageSize := CallbackCreate(GetMethod(implObj, "get_ImageSize"), flags, 2)
        this.vtbl.AssignBootImage := CallbackCreate(GetMethod(implObj, "AssignBootImage"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_BootImage)
        CallbackFree(this.vtbl.get_Manufacturer)
        CallbackFree(this.vtbl.put_Manufacturer)
        CallbackFree(this.vtbl.get_PlatformId)
        CallbackFree(this.vtbl.put_PlatformId)
        CallbackFree(this.vtbl.get_Emulation)
        CallbackFree(this.vtbl.put_Emulation)
        CallbackFree(this.vtbl.get_ImageSize)
        CallbackFree(this.vtbl.AssignBootImage)
    }
}
