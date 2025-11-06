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
     * 
     * @returns {Pointer<SAFEARRAY>} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-ifilesystemimage2-get_bootimageoptionsarray
     */
    get_BootImageOptionsArray() {
        result := ComCall(57, this, "ptr*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @param {Pointer<SAFEARRAY>} newVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-ifilesystemimage2-put_bootimageoptionsarray
     */
    put_BootImageOptionsArray(newVal) {
        result := ComCall(58, this, "ptr", newVal, "HRESULT")
        return result
    }
}
