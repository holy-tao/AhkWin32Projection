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
     * 
     * @param {BSTR} bstrFileName 
     * @returns {HRESULT} 
     */
    put_FileName(bstrFileName) {
        bstrFileName := bstrFileName is String ? BSTR.Alloc(bstrFileName).Value : bstrFileName

        result := ComCall(7, this, "ptr", bstrFileName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrFileName 
     * @returns {HRESULT} 
     */
    get_FileName(pbstrFileName) {
        result := ComCall(8, this, "ptr", pbstrFileName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
