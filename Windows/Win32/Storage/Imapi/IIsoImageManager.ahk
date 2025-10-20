#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
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
     * 
     * @param {Pointer<BSTR>} pVal 
     * @returns {HRESULT} 
     */
    get_Path(pVal) {
        result := ComCall(7, this, "ptr", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IStream>} data 
     * @returns {HRESULT} 
     */
    get_Stream(data) {
        result := ComCall(8, this, "ptr", data, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} Val 
     * @returns {HRESULT} 
     */
    SetPath(Val) {
        Val := Val is String ? BSTR.Alloc(Val).Value : Val

        result := ComCall(9, this, "ptr", Val, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IStream>} data 
     * @returns {HRESULT} 
     */
    SetStream(data) {
        result := ComCall(10, this, "ptr", data, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Validate() {
        result := ComCall(11, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
