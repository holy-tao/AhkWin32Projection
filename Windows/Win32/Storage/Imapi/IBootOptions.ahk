#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
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
     * 
     * @param {Pointer<IStream>} pVal 
     * @returns {HRESULT} 
     */
    get_BootImage(pVal) {
        result := ComCall(7, this, "ptr", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pVal 
     * @returns {HRESULT} 
     */
    get_Manufacturer(pVal) {
        result := ComCall(8, this, "ptr", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} newVal 
     * @returns {HRESULT} 
     */
    put_Manufacturer(newVal) {
        newVal := newVal is String ? BSTR.Alloc(newVal).Value : newVal

        result := ComCall(9, this, "ptr", newVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pVal 
     * @returns {HRESULT} 
     */
    get_PlatformId(pVal) {
        result := ComCall(10, this, "int*", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} newVal 
     * @returns {HRESULT} 
     */
    put_PlatformId(newVal) {
        result := ComCall(11, this, "int", newVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pVal 
     * @returns {HRESULT} 
     */
    get_Emulation(pVal) {
        result := ComCall(12, this, "int*", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} newVal 
     * @returns {HRESULT} 
     */
    put_Emulation(newVal) {
        result := ComCall(13, this, "int", newVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pVal 
     * @returns {HRESULT} 
     */
    get_ImageSize(pVal) {
        result := ComCall(14, this, "uint*", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IStream>} newVal 
     * @returns {HRESULT} 
     */
    AssignBootImage(newVal) {
        result := ComCall(15, this, "ptr", newVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
