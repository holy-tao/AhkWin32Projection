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
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-iisoimagemanager-get_path
     */
    get_Path() {
        pVal := BSTR()
        result := ComCall(7, this, "ptr", pVal, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {IStream} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-iisoimagemanager-get_stream
     */
    get_Stream() {
        result := ComCall(8, this, "ptr*", &data := 0, "HRESULT")
        return IStream(data)
    }

    /**
     * 
     * @param {BSTR} Val 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-iisoimagemanager-setpath
     */
    SetPath(Val) {
        Val := Val is String ? BSTR.Alloc(Val).Value : Val

        result := ComCall(9, this, "ptr", Val, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IStream} data 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-iisoimagemanager-setstream
     */
    SetStream(data) {
        result := ComCall(10, this, "ptr", data, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-iisoimagemanager-validate
     */
    Validate() {
        result := ComCall(11, this, "HRESULT")
        return result
    }
}
