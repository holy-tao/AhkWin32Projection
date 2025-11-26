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
     * 
     * @returns {IStream} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-ibootoptions-get_bootimage
     */
    get_BootImage() {
        result := ComCall(7, this, "ptr*", &pVal := 0, "HRESULT")
        return IStream(pVal)
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-ibootoptions-get_manufacturer
     */
    get_Manufacturer() {
        pVal := BSTR()
        result := ComCall(8, this, "ptr", pVal, "HRESULT")
        return pVal
    }

    /**
     * 
     * @param {BSTR} newVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-ibootoptions-put_manufacturer
     */
    put_Manufacturer(newVal) {
        newVal := newVal is String ? BSTR.Alloc(newVal).Value : newVal

        result := ComCall(9, this, "ptr", newVal, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-ibootoptions-get_platformid
     */
    get_PlatformId() {
        result := ComCall(10, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @param {Integer} newVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-ibootoptions-put_platformid
     */
    put_PlatformId(newVal) {
        result := ComCall(11, this, "int", newVal, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-ibootoptions-get_emulation
     */
    get_Emulation() {
        result := ComCall(12, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @param {Integer} newVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-ibootoptions-put_emulation
     */
    put_Emulation(newVal) {
        result := ComCall(13, this, "int", newVal, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-ibootoptions-get_imagesize
     */
    get_ImageSize() {
        result := ComCall(14, this, "uint*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @param {IStream} newVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-ibootoptions-assignbootimage
     */
    AssignBootImage(newVal) {
        result := ComCall(15, this, "ptr", newVal, "HRESULT")
        return result
    }
}
