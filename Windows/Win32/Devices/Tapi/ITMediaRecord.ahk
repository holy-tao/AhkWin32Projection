#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The ITMediaRecord interface provides recording-specific methods that allow an application to set and get the names of files to record.
 * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nn-tapi3if-itmediarecord
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class ITMediaRecord extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITMediaRecord
     * @type {Guid}
     */
    static IID => Guid("{f5dd4592-5476-4cc1-9d4d-fad3eefe7db2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_FileName", "get_FileName"]

    /**
     * @type {BSTR} 
     */
    FileName {
        get => this.get_FileName()
        set => this.put_FileName(value)
    }

    /**
     * The put_FileName method sets the name of the file to record.
     * @param {BSTR} bstrFileName The <b>BSTR</b> representation of the file name.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itmediarecord-put_filename
     */
    put_FileName(bstrFileName) {
        bstrFileName := bstrFileName is String ? BSTR.Alloc(bstrFileName).Value : bstrFileName

        result := ComCall(7, this, "ptr", bstrFileName, "HRESULT")
        return result
    }

    /**
     * The get_FileName method retrieves the name of the file that was used for recording by this terminal.
     * @returns {BSTR} The <b>BSTR</b> representation of the file name. The <b>BSTR</b> is allocated using 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysallocstring">SysAllocString</a>. The <b>BSTR</b> argument should be deallocated by the client.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itmediarecord-get_filename
     */
    get_FileName() {
        pbstrFileName := BSTR()
        result := ComCall(8, this, "ptr", pbstrFileName, "HRESULT")
        return pbstrFileName
    }
}
