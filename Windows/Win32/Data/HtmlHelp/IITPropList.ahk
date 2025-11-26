#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IPersistStreamInit.ahk

/**
 * Use this interface to set properties for build objects such as word wheels and indexes. Call these methods in the document build process to define properties for all build objects.
 * @see https://docs.microsoft.com/windows/win32/api//infotech/nn-infotech-iitproplist
 * @namespace Windows.Win32.Data.HtmlHelp
 * @version v4.0.30319
 */
class IITPropList extends IPersistStreamInit{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IITPropList
     * @type {Guid}
     */
    static IID => Guid("{1f403bb1-9997-11d0-a850-00aa006c7d01}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 9

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Set", "Set1", "Set2", "Add", "Get", "Clear", "SetPersist", "SetPersist1", "GetFirst", "GetNext", "GetPropCount", "SaveHeader", "SaveData", "GetHeaderSize", "GetDataSize", "SaveDataToStream", "LoadFromMem", "SaveToMem"]

    /**
     * 
     * @param {Integer} PropID 
     * @param {PWSTR} lpszwString 
     * @param {Integer} dwOperation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/infotech/nf-infotech-iitproplist-set(propid_lpvoid_dword_dword)
     */
    Set(PropID, lpszwString, dwOperation) {
        lpszwString := lpszwString is String ? StrPtr(lpszwString) : lpszwString

        result := ComCall(9, this, "uint", PropID, "ptr", lpszwString, "uint", dwOperation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} PropID 
     * @param {Pointer<Void>} lpvData 
     * @param {Integer} cbData 
     * @param {Integer} dwOperation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/infotech/nf-infotech-iitproplist-set(propid_lpvoid_dword_dword)
     */
    Set1(PropID, lpvData, cbData, dwOperation) {
        lpvDataMarshal := lpvData is VarRef ? "ptr" : "ptr"

        result := ComCall(10, this, "uint", PropID, lpvDataMarshal, lpvData, "uint", cbData, "uint", dwOperation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} PropID 
     * @param {Integer} dwData 
     * @param {Integer} dwOperation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/infotech/nf-infotech-iitproplist-set(propid_lpvoid_dword_dword)
     */
    Set2(PropID, dwData, dwOperation) {
        result := ComCall(11, this, "uint", PropID, "uint", dwData, "uint", dwOperation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<CProperty>} Prop 
     * @returns {HRESULT} 
     */
    Add(Prop) {
        result := ComCall(12, this, "ptr", Prop, "HRESULT")
        return result
    }

    /**
     * Returns the property object associated with the given property ID.
     * @param {Integer} PropID ID of the property object to get.
     * @param {Pointer<CProperty>} Property The property object returned.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The property was successfully returned.
     * 
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTEXIST</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The requested property does not exist.
     * 
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//infotech/nf-infotech-iitproplist-get
     */
    Get(PropID, Property) {
        result := ComCall(13, this, "uint", PropID, "ptr", Property, "HRESULT")
        return result
    }

    /**
     * Clears memory associated with a property list and reinitializes the list.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The property list was cleared.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//infotech/nf-infotech-iitproplist-clear
     */
    Clear() {
        result := ComCall(14, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} fPersist 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/infotech/nf-infotech-iitproplist-setpersist(propid_bool)
     */
    SetPersist(fPersist) {
        result := ComCall(15, this, "int", fPersist, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} PropID 
     * @param {BOOL} fPersist 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/infotech/nf-infotech-iitproplist-setpersist(propid_bool)
     */
    SetPersist1(PropID, fPersist) {
        result := ComCall(16, this, "uint", PropID, "int", fPersist, "HRESULT")
        return result
    }

    /**
     * Returns the first property object in a property list.
     * @param {Pointer<CProperty>} Property The property object returned.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The property was successfully returned.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTEXIST</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The requested property does not exist.
     * 
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//infotech/nf-infotech-iitproplist-getfirst
     */
    GetFirst(Property) {
        result := ComCall(17, this, "ptr", Property, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<CProperty>} Property 
     * @returns {HRESULT} 
     */
    GetNext(Property) {
        result := ComCall(18, this, "ptr", Property, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} cProp 
     * @returns {HRESULT} 
     */
    GetPropCount(cProp) {
        cPropMarshal := cProp is VarRef ? "int*" : "ptr"

        result := ComCall(19, this, cPropMarshal, cProp, "HRESULT")
        return result
    }

    /**
     * Saves the property ID and data type from the property list to a buffer. Only saves properties marked with a persistence state of TRUE.
     * @param {Pointer<Void>} lpvData Pointer to a buffer to fill.
     * @param {Integer} dwHdrSize Size of the buffer.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The property list was successfully saved.
     * 
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//infotech/nf-infotech-iitproplist-saveheader
     */
    SaveHeader(lpvData, dwHdrSize) {
        lpvDataMarshal := lpvData is VarRef ? "ptr" : "ptr"

        result := ComCall(20, this, lpvDataMarshal, lpvData, "uint", dwHdrSize, "HRESULT")
        return result
    }

    /**
     * Saves the data size and data from the property list to a buffer.
     * @param {Pointer<Void>} lpvHeader Pointer to a buffer containing the header.
     * @param {Integer} dwHdrSize Size of the buffer containing the header.
     * @param {Pointer<Void>} lpvData Pointer to a buffer to fill.
     * @param {Integer} dwBufSize Size of the buffer to fill.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The property list was successfully saved.
     * 
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//infotech/nf-infotech-iitproplist-savedata
     */
    SaveData(lpvHeader, dwHdrSize, lpvData, dwBufSize) {
        lpvHeaderMarshal := lpvHeader is VarRef ? "ptr" : "ptr"
        lpvDataMarshal := lpvData is VarRef ? "ptr" : "ptr"

        result := ComCall(21, this, lpvHeaderMarshal, lpvHeader, "uint", dwHdrSize, lpvDataMarshal, lpvData, "uint", dwBufSize, "HRESULT")
        return result
    }

    /**
     * Returns the number of bytes needed to save the header.
     * @param {Pointer<Integer>} dwHdrSize Size, in bytes.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The size was successfully returned. 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//infotech/nf-infotech-iitproplist-getheadersize
     */
    GetHeaderSize(dwHdrSize) {
        dwHdrSizeMarshal := dwHdrSize is VarRef ? "uint*" : "ptr"

        result := ComCall(22, this, dwHdrSizeMarshal, dwHdrSize, "HRESULT")
        return result
    }

    /**
     * Returns the number of bytes needed to save the property data.
     * @param {Pointer<Void>} lpvHeader Pointer to a buffer containing the header.
     * @param {Integer} dwHdrSize Size of the header buffer.
     * @param {Pointer<Integer>} dwDataSize Size in bytes.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The size was successfully returned. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>lpvHeader</i> parameter is NULL, or <i>dwHdrSize</i> is too small.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_BADVALUE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid header buffer.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//infotech/nf-infotech-iitproplist-getdatasize
     */
    GetDataSize(lpvHeader, dwHdrSize, dwDataSize) {
        lpvHeaderMarshal := lpvHeader is VarRef ? "ptr" : "ptr"
        dwDataSizeMarshal := dwDataSize is VarRef ? "uint*" : "ptr"

        result := ComCall(23, this, lpvHeaderMarshal, lpvHeader, "uint", dwHdrSize, dwDataSizeMarshal, dwDataSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} lpvHeader 
     * @param {Integer} dwHdrSize 
     * @param {IStream} pStream 
     * @returns {HRESULT} 
     */
    SaveDataToStream(lpvHeader, dwHdrSize, pStream) {
        lpvHeaderMarshal := lpvHeader is VarRef ? "ptr" : "ptr"

        result := ComCall(24, this, lpvHeaderMarshal, lpvHeader, "uint", dwHdrSize, "ptr", pStream, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} lpvData 
     * @param {Integer} dwBufSize 
     * @returns {HRESULT} 
     */
    LoadFromMem(lpvData, dwBufSize) {
        lpvDataMarshal := lpvData is VarRef ? "ptr" : "ptr"

        result := ComCall(25, this, lpvDataMarshal, lpvData, "uint", dwBufSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} lpvData 
     * @param {Integer} dwBufSize 
     * @returns {HRESULT} 
     */
    SaveToMem(lpvData, dwBufSize) {
        lpvDataMarshal := lpvData is VarRef ? "ptr" : "ptr"

        result := ComCall(26, this, lpvDataMarshal, lpvData, "uint", dwBufSize, "HRESULT")
        return result
    }
}
