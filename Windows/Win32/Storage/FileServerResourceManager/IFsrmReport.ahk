#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Used to configure the description and filters for a single report.
 * @see https://docs.microsoft.com/windows/win32/api//fsrmreports/nn-fsrmreports-ifsrmreport
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 * @version v4.0.30319
 */
class IFsrmReport extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFsrmReport
     * @type {Guid}
     */
    static IID => Guid("{d8cc81d9-46b8-4fa4-bfa5-4aa9dec9b638}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Type", "get_Name", "put_Name", "get_Description", "put_Description", "get_LastGeneratedFileNamePrefix", "GetFilter", "SetFilter", "Delete"]

    /**
     * 
     * @param {Pointer<Integer>} reportType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmreport-get_type
     */
    get_Type(reportType) {
        result := ComCall(7, this, "int*", reportType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} name 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmreport-get_name
     */
    get_Name(name) {
        result := ComCall(8, this, "ptr", name, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} name 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmreport-put_name
     */
    put_Name(name) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(9, this, "ptr", name, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} description 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmreport-get_description
     */
    get_Description(description) {
        result := ComCall(10, this, "ptr", description, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} description 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmreport-put_description
     */
    put_Description(description) {
        description := description is String ? BSTR.Alloc(description).Value : description

        result := ComCall(11, this, "ptr", description, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} prefix 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmreport-get_lastgeneratedfilenameprefix
     */
    get_LastGeneratedFileNamePrefix(prefix) {
        result := ComCall(12, this, "ptr", prefix, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} filter 
     * @param {Pointer<VARIANT>} filterValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmreport-getfilter
     */
    GetFilter(filter, filterValue) {
        result := ComCall(13, this, "int", filter, "ptr", filterValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} filter 
     * @param {VARIANT} filterValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmreport-setfilter
     */
    SetFilter(filter, filterValue) {
        result := ComCall(14, this, "int", filter, "ptr", filterValue, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmreport-delete
     */
    Delete() {
        result := ComCall(15, this, "HRESULT")
        return result
    }
}
