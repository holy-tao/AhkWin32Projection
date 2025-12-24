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
     * Gets the tag that identifies an Integrated Services Digital Broadcasting (ISDB) component group descriptor.
     * @returns {Integer} Receives the tag value. For ISDB component group descriptors, this value is 0xD9.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-iisdbcomponentgroupdescriptor-gettag
     */
    GetTag() {
        result := ComCall(3, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the body length of an Integrated Services Digital Broadcasting (ISDB) component group descriptor, in bytes.
     * @returns {Integer} Receives the descriptor length.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-iisdbcomponentgroupdescriptor-getlength
     */
    GetLength() {
        result := ComCall(4, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the value of the component_group_type field from an Integrated Services Digital Broadcasting (ISDB) component group descriptor. This three-bit field indicates the group type to which the components in the descriptor belong.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-iisdbcomponentgroupdescriptor-getcomponentgrouptype
     */
    GetComponentGroupType() {
        result := ComCall(5, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the number of component records in an Integrated Services Digital Broadcasting (ISDB) component group descriptor.
     * @returns {Integer} Receives the number of records.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-iisdbcomponentgroupdescriptor-getcountofrecords
     */
    GetCountOfRecords() {
        result := ComCall(6, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the component group identifier from an Integrated Services Digital Broadcasting (ISDB) component group descriptor.
     * @param {Integer} bRecordIndex Specifies the component group record number,
     *   indexed from zero. Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-iisdbcomponentgroupdescriptor-getcountofrecords">IIsdbComponentGroupDescriptor::GetCountOfRecords</a>method to get the number of records in the extended event descriptor.
     * @returns {Integer} Receives the component group record number.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-iisdbcomponentgroupdescriptor-getrecordgroupid
     */
    GetRecordGroupId(bRecordIndex) {
        result := ComCall(7, this, "char", bRecordIndex, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the number of conditional access unit records in a component group from an Integrated Services Digital Broadcasting (ISDB) component group descriptor.
     * @param {Integer} bRecordIndex Specifies the component group record number,
     *   indexed from zero. Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-iisdbcomponentgroupdescriptor-getcountofrecords">IIsdbComponentGroupDescriptor::GetCountOfRecords</a>method to get the number of records in the extended event descriptor.
     * @returns {Integer} Receives the number of conditional access unit records.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-iisdbcomponentgroupdescriptor-getrecordnumberofcaunit
     */
    GetRecordNumberOfCAUnit(bRecordIndex) {
        result := ComCall(8, this, "char", bRecordIndex, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets a conditional access unit identifier from a specified component group record in an Integrated Services Digital Broadcasting (ISDB) component group descriptor.
     * @param {Integer} bRecordIndex Specifies the component group record number,
     *   indexed from zero. Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-iisdbcomponentgroupdescriptor-getcountofrecords">IIsdbComponentGroupDescriptor::GetCountOfRecords</a>method to get the number of records in the descriptor.
     * @param {Integer} bCAUnitIndex Specifies the conditional access unit record number,
     *   indexed from zero. Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-iisdbcomponentgroupdescriptor-getrecordcaunitnumberofcomponents">IIsdbComponentGroupDescriptor::GetRecordCAUnitNumberOfComponents</a>method to get the number of conditional access  records in the descriptor.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-iisdbcomponentgroupdescriptor-getrecordcaunitcaunitid
     */
    GetRecordCAUnitCAUnitId(bRecordIndex, bCAUnitIndex) {
        result := ComCall(9, this, "char", bRecordIndex, "char", bCAUnitIndex, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the number of components corresponding to a conditional access unit from an Integrated Services Digital Broadcasting (ISDB) component group descriptor.
     * @param {Integer} bRecordIndex Specifies the component record number,
     *   indexed from zero. Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-iisdbcomponentgroupdescriptor-getcountofrecords">IIsdbComponentGroupDescriptor::GetCountOfRecords</a>method to get the number of component records in the component group descriptor.
     * @param {Integer} bCAUnitIndex Specifies the conditional access unit record number,
     *   indexed from zero. Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-iisdbcomponentgroupdescriptor-getrecordnumberofcaunit">IIsdbComponentGroupDescriptor::GetRecordNumberOfCAUnit</a>method to get the number of conditional access unit records in the component group descriptor.
     * @returns {Integer} Receives the number of components.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-iisdbcomponentgroupdescriptor-getrecordcaunitnumberofcomponents
     */
    GetRecordCAUnitNumberOfComponents(bRecordIndex, bCAUnitIndex) {
        result := ComCall(10, this, "char", bRecordIndex, "char", bCAUnitIndex, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the tag that identifies a component record in an Integrated Services Digital Broadcasting (ISDB) component group descriptor.
     * @param {Integer} bRecordIndex Specifies the component record number,
     *   indexed from zero. Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-iisdbcomponentgroupdescriptor-getcountofrecords">IIsdbComponentGroupDescriptor::GetCountOfRecords</a>method to get the number of records in the extended event descriptor.
     * @param {Integer} bCAUnitIndex Specifies the conditional access unit number within the component group,
     *   indexed from zero. Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-iisdbcomponentgroupdescriptor-getrecordnumberofcaunit">IIsdbComponentGroupDescriptor::GetRecordNumberOfCAUnit</a>method to get the number of records in the extended event descriptor.
     * @param {Integer} bComponentIndex Specifies the component within the component group,
     *   indexed from zero. Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-iisdbcomponentgroupdescriptor-getrecordcaunitnumberofcomponents">IIsdbComponentGroupDescriptor::GetRecordCAUnitNumberOfComponents</a>method to get the number of components for the conditional access unit given by the <i>bCAUnitIndex</i> parameter.
     * @returns {Integer} Receives the component tag value.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-iisdbcomponentgroupdescriptor-getrecordcaunitcomponenttag
     */
    GetRecordCAUnitComponentTag(bRecordIndex, bCAUnitIndex, bComponentIndex) {
        result := ComCall(11, this, "char", bRecordIndex, "char", bCAUnitIndex, "char", bComponentIndex, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the total bit rate from a component within a component group in an Integrated Services Digital Broadcasting (ISDB) component group descriptor.
     * @param {Integer} bRecordIndex Specifies the component group record number,
     *   indexed from zero. Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-iisdbcomponentgroupdescriptor-getcountofrecords">IIsdbComponentGroupDescriptor::GetCountOfRecords</a>method to get the number of records in the extended event descriptor.
     * @returns {Integer} Receives the total bit rate for the component, in units of 250 Kbps.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-iisdbcomponentgroupdescriptor-getrecordtotalbitrate
     */
    GetRecordTotalBitRate(bRecordIndex) {
        result := ComCall(12, this, "char", bRecordIndex, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the text that describes a component group from an Integrated Services Digital Broadcasting (ISDB) component group descriptor.
     * @param {Integer} bRecordIndex Specifies the component group record number,
     *   indexed from zero. Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-iisdbcomponentgroupdescriptor-getcountofrecords">IIsdbComponentGroupDescriptor::GetCountOfRecords</a>method to get the number of records in the extended event descriptor.
     * @param {Integer} convMode 
     * @returns {BSTR} Receives the text that describes the component group, as a <b>BSTR</b>. The caller must free the <b>BSTR</b> by calling <b>SysFreeString</b>.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-iisdbcomponentgroupdescriptor-getrecordtextw
     */
    GetRecordTextW(bRecordIndex, convMode) {
        pbstrText := BSTR()
        result := ComCall(13, this, "char", bRecordIndex, "int", convMode, "ptr", pbstrText, "HRESULT")
        return pbstrText
    }
}
