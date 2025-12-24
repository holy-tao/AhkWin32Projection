#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nn-dvbsiparser-iisdbdatacontentdescriptor
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IIsdbDataContentDescriptor extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IIsdbDataContentDescriptor
     * @type {Guid}
     */
    static IID => Guid("{a428100a-e646-4bd6-aa14-6087bdc08cd5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetTag", "GetLength", "GetDataComponentId", "GetEntryComponent", "GetSelectorLength", "GetSelectorBytes", "GetCountOfRecords", "GetRecordComponentRef", "GetLanguageCode", "GetTextW"]

    /**
     * Gets the tag that identifies an Integrated Services Digital Broadcasting (ISDB) data content descriptor.
     * @returns {Integer} Receives the tag value. For ISDB data content descriptors, this value is 0xC7.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-iisdbdatacontentdescriptor-gettag
     */
    GetTag() {
        result := ComCall(3, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the body length of an Integrated Services Digital Broadcasting (ISDB) data content descriptor, in bytes.
     * @returns {Integer} Receives the descriptor length.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-iisdbdatacontentdescriptor-getlength
     */
    GetLength() {
        result := ComCall(4, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets a data component identifier from an Integrated Services Digital Broadcasting (ISDB) data content descriptor. This identifier identifies a component in the descriptor and appears in the data component descriptor for the component.
     * @returns {Integer} Receives the data component identifier.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-iisdbdatacontentdescriptor-getdatacomponentid
     */
    GetDataComponentId() {
        result := ComCall(5, this, "ushort*", &pwVal := 0, "HRESULT")
        return pwVal
    }

    /**
     * Gets the value of the entry_component field from an Integrated Services Digital Broadcasting (ISDB) data content descriptor. This field indicates the first component stream that is referenced in the descriptor.
     * @returns {Integer} Returns the entry_component field value.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-iisdbdatacontentdescriptor-getentrycomponent
     */
    GetEntryComponent() {
        result := ComCall(6, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the length of the selector part of an Integrated Services Digital Broadcasting (ISDB) data content descriptor, in bytes.
     * @returns {Integer} Receives the selector length.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-iisdbdatacontentdescriptor-getselectorlength
     */
    GetSelectorLength() {
        result := ComCall(7, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the selector data from an Integrated Services Digital Broadcasting (ISDB) data content descriptor. The contents of the selector depend on the type of data transmitted in the data component.
     * @param {Integer} bBufLength Specifies the length of the buffer that receives the selector data.
     * @returns {Integer} Receives the selector data.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-iisdbdatacontentdescriptor-getselectorbytes
     */
    GetSelectorBytes(bBufLength) {
        result := ComCall(8, this, "char", bBufLength, "char*", &pbBuf := 0, "HRESULT")
        return pbBuf
    }

    /**
     * Gets the number of records in an Integrated Services Digital Broadcasting (ISDB) data content descriptor.
     * @returns {Integer} Receives the number of records.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-iisdbdatacontentdescriptor-getcountofrecords
     */
    GetCountOfRecords() {
        result := ComCall(9, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the value of the component_ref field from a specified component record in an Integrated Services Digital Broadcasting (ISDB) data content descriptor. This field contains the broadcaster-defined component tag that identifies a component stream.
     * @param {Integer} bRecordIndex Zero-based index of the component record containing the tag. To get the number of components, call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-iisdbtsinformationdescriptor-getcountofrecords">IIsdbDataContentDescriptor::GetCountOfRecords</a>.
     * @returns {Integer} Receives the component tag.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-iisdbdatacontentdescriptor-getrecordcomponentref
     */
    GetRecordComponentRef(bRecordIndex) {
        result := ComCall(10, this, "char", bRecordIndex, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the three-character ISO 639 language code from an Integrated Services Digital Broadcasting (ISDB) data content descriptor.
     * @returns {Integer} Pointer to the buffer that receives the language code. The caller is responsible for freeing this memory.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-iisdbdatacontentdescriptor-getlanguagecode
     */
    GetLanguageCode() {
        result := ComCall(11, this, "char*", &pszCode := 0, "HRESULT")
        return pszCode
    }

    /**
     * Gets the text from an Integrated Services Digital Broadcasting (ISDB) data content descriptor that describes the contents of the descriptor, in Unicode text format.
     * @param {Integer} convMode 
     * @returns {BSTR} Pointer to a buffer that receives the description text. The caller is responsible for freeing this memory.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-iisdbdatacontentdescriptor-gettextw
     */
    GetTextW(convMode) {
        pbstrText := BSTR()
        result := ComCall(12, this, "int", convMode, "ptr", pbstrText, "HRESULT")
        return pbstrText
    }
}
