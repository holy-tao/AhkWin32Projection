#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IStream.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Use this interface to specify the boot image to add to the optical disc. A boot image contains one or more sectors of code used to start the computer.
 * @remarks
 * 
 * This interface supports the "El Torito" Bootable CD-ROM format specification. 
 * 
 * To add the boot image to a file system image, call the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2fs/nf-imapi2fs-ifilesystemimage-put_bootimageoptions">IFileSystemImage::put_BootImageOptions</a> method. 
 * 
 * To get the boot image associated with a file system image, call the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2fs/nf-imapi2fs-ifilesystemimage-get_bootimageoptions">IFileSystemImage::get_BootImageOptions</a> method.
 * 
 * To create the <b>BootOptions</b> object in a script, use IMAPI2.BootOptions as the program identifier when calling <b>CreateObject</b>.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//imapi2fs/nn-imapi2fs-ibootoptions
 * @namespace Windows.Win32.Storage.Imapi
 * @version v4.0.30319
 */
class IBootOptions extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBootOptions
     * @type {Guid}
     */
    static IID => Guid("{2c941fd4-975b-59be-a960-9a2a262853a5}")

    /**
     * The class identifier for BootOptions
     * @type {Guid}
     */
    static CLSID => Guid("{2c941fce-975b-59be-a960-9a2a262853a5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_BootImage", "get_Manufacturer", "put_Manufacturer", "get_PlatformId", "put_PlatformId", "get_Emulation", "put_Emulation", "get_ImageSize", "AssignBootImage"]

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
     * @type {Integer} 
     */
    PlatformId {
        get => this.get_PlatformId()
        set => this.put_PlatformId(value)
    }

    /**
     * @type {Integer} 
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
     * @see https://docs.microsoft.com/windows/win32/api//imapi2fs/nf-imapi2fs-ibootoptions-get_bootimage
     */
    get_BootImage() {
        result := ComCall(7, this, "ptr*", &pVal := 0, "HRESULT")
        return IStream(pVal)
    }

    /**
     * Retrieves the identifier of the manufacturer of the CD.
     * @returns {BSTR} Identifier of the manufacturer of the CD.
     * @see https://docs.microsoft.com/windows/win32/api//imapi2fs/nf-imapi2fs-ibootoptions-get_manufacturer
     */
    get_Manufacturer() {
        pVal := BSTR()
        result := ComCall(8, this, "ptr", pVal, "HRESULT")
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
     * @see https://docs.microsoft.com/windows/win32/api//imapi2fs/nf-imapi2fs-ibootoptions-put_manufacturer
     */
    put_Manufacturer(newVal) {
        newVal := newVal is String ? BSTR.Alloc(newVal).Value : newVal

        result := ComCall(9, this, "ptr", newVal, "HRESULT")
        return result
    }

    /**
     * Retrieves the platform identifier that identifies the operating system architecture that the boot image supports.
     * @returns {Integer} Identifies the operating system architecture that the boot image supports. For possible values, see the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2fs/ne-imapi2fs-platformid">PlatformId</a> enumeration type.
     * @see https://docs.microsoft.com/windows/win32/api//imapi2fs/nf-imapi2fs-ibootoptions-get_platformid
     */
    get_PlatformId() {
        result := ComCall(10, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * Sets the platform identifier that identifies the operating system architecture that the boot image supports.
     * @param {Integer} newVal Identifies the operating system architecture that the boot image supports. For possible values, see the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2fs/ne-imapi2fs-platformid">PlatformId</a> enumeration type. The default value is  <b>PlatformX86</b> for Intel x86–based platforms.
     * @returns {HRESULT} S_OK is returned on success, but other success codes may be returned as a result of implementation.
     * @see https://docs.microsoft.com/windows/win32/api//imapi2fs/nf-imapi2fs-ibootoptions-put_platformid
     */
    put_PlatformId(newVal) {
        result := ComCall(11, this, "int", newVal, "HRESULT")
        return result
    }

    /**
     * Retrieves the media type that the boot image is intended to emulate.
     * @returns {Integer} Media type that the boot image is intended to emulate. For possible values, see the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2fs/ne-imapi2fs-emulationtype">EmulationType</a> enumeration type.
     * @see https://docs.microsoft.com/windows/win32/api//imapi2fs/nf-imapi2fs-ibootoptions-get_emulation
     */
    get_Emulation() {
        result := ComCall(12, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * Sets the media type that the boot image is intended to emulate.
     * @param {Integer} newVal Media type that the boot image is intended to emulate. For possible values, see the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2fs/ne-imapi2fs-emulationtype">EmulationType</a> enumeration type. The default value is <b>EmulationNone</b>, which means the BIOS will not emulate any device type or special sector size for the CD during boot from the CD.
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
     * @see https://docs.microsoft.com/windows/win32/api//imapi2fs/nf-imapi2fs-ibootoptions-put_emulation
     */
    put_Emulation(newVal) {
        result := ComCall(13, this, "int", newVal, "HRESULT")
        return result
    }

    /**
     * Retrieves the size of the boot image.
     * @returns {Integer} Size, in bytes, of the boot image.
     * @see https://docs.microsoft.com/windows/win32/api//imapi2fs/nf-imapi2fs-ibootoptions-get_imagesize
     */
    get_ImageSize() {
        result := ComCall(14, this, "uint*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * Sets the data stream that contains the boot image.
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
     * @see https://docs.microsoft.com/windows/win32/api//imapi2fs/nf-imapi2fs-ibootoptions-assignbootimage
     */
    AssignBootImage(newVal) {
        result := ComCall(15, this, "ptr", newVal, "HRESULT")
        return result
    }
}
