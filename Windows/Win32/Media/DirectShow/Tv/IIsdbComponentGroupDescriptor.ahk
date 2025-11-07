#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Implements methods that get data from an Integrated Services Digital Broadcasting (ISDB) component group descriptor.
 * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nn-dvbsiparser-iisdbcomponentgroupdescriptor
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IIsdbComponentGroupDescriptor extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IIsdbComponentGroupDescriptor
     * @type {Guid}
     */
    static IID => Guid("{a494f17f-c592-47d8-8943-64c9a34be7b9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetTag", "GetLength", "GetComponentGroupType", "GetCountOfRecords", "GetRecordGroupId", "GetRecordNumberOfCAUnit", "GetRecordCAUnitCAUnitId", "GetRecordCAUnitNumberOfComponents", "GetRecordCAUnitComponentTag", "GetRecordTotalBitRate", "GetRecordTextW"]

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbcomponentgroupdescriptor-gettag
     */
    GetTag() {
        result := ComCall(3, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbcomponentgroupdescriptor-getlength
     */
    GetLength() {
        result := ComCall(4, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbcomponentgroupdescriptor-getcomponentgrouptype
     */
    GetComponentGroupType() {
        result := ComCall(5, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbcomponentgroupdescriptor-getcountofrecords
     */
    GetCountOfRecords() {
        result := ComCall(6, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * 
     * @param {Integer} bRecordIndex 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbcomponentgroupdescriptor-getrecordgroupid
     */
    GetRecordGroupId(bRecordIndex) {
        result := ComCall(7, this, "char", bRecordIndex, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * 
     * @param {Integer} bRecordIndex 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbcomponentgroupdescriptor-getrecordnumberofcaunit
     */
    GetRecordNumberOfCAUnit(bRecordIndex) {
        result := ComCall(8, this, "char", bRecordIndex, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * 
     * @param {Integer} bRecordIndex 
     * @param {Integer} bCAUnitIndex 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbcomponentgroupdescriptor-getrecordcaunitcaunitid
     */
    GetRecordCAUnitCAUnitId(bRecordIndex, bCAUnitIndex) {
        result := ComCall(9, this, "char", bRecordIndex, "char", bCAUnitIndex, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * 
     * @param {Integer} bRecordIndex 
     * @param {Integer} bCAUnitIndex 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbcomponentgroupdescriptor-getrecordcaunitnumberofcomponents
     */
    GetRecordCAUnitNumberOfComponents(bRecordIndex, bCAUnitIndex) {
        result := ComCall(10, this, "char", bRecordIndex, "char", bCAUnitIndex, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * 
     * @param {Integer} bRecordIndex 
     * @param {Integer} bCAUnitIndex 
     * @param {Integer} bComponentIndex 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbcomponentgroupdescriptor-getrecordcaunitcomponenttag
     */
    GetRecordCAUnitComponentTag(bRecordIndex, bCAUnitIndex, bComponentIndex) {
        result := ComCall(11, this, "char", bRecordIndex, "char", bCAUnitIndex, "char", bComponentIndex, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * 
     * @param {Integer} bRecordIndex 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbcomponentgroupdescriptor-getrecordtotalbitrate
     */
    GetRecordTotalBitRate(bRecordIndex) {
        result := ComCall(12, this, "char", bRecordIndex, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * 
     * @param {Integer} bRecordIndex 
     * @param {Integer} convMode 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbcomponentgroupdescriptor-getrecordtextw
     */
    GetRecordTextW(bRecordIndex, convMode) {
        pbstrText := BSTR()
        result := ComCall(13, this, "char", bRecordIndex, "int", convMode, "ptr", pbstrText, "HRESULT")
        return pbstrText
    }
}
