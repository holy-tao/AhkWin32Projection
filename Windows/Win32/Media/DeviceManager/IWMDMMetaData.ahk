#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWMDMMetaData interface sets and retrieves metadata properties (such as artist, album, genre, and so on) of a storage.
 * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nn-mswmdm-iwmdmmetadata
 * @namespace Windows.Win32.Media.DeviceManager
 * @version v4.0.30319
 */
class IWMDMMetaData extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMDMMetaData
     * @type {Guid}
     */
    static IID => Guid("{ec3b0663-0951-460a-9a80-0dceed3c043c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddItem", "QueryByName", "QueryByIndex", "GetItemCount"]

    /**
     * The AddItem method adds a metadata property to the interface.
     * @param {Integer} Type An <a href="https://docs.microsoft.com/windows/desktop/WMDM/wmdm-tag-datatype">WMDM_TAG_DATATYPE</a> enumerated value specifying the type of metadata being saved.
     * @param {PWSTR} pwszTagName Pointer to a wide-character, null-terminated string specifying the name of the property to set. A list of standard property name constants is given in <a href="https://docs.microsoft.com/windows/desktop/WMDM/metadata-constants">Metadata Constants</a>.
     * @param {Pointer<Integer>} pValue Pointer to a byte array specifying the value to assign to the property. The submitted value is copied, so the memory can be freed after calling <b>AddItem</b>.
     * @param {Integer} iLength Integer specifying the size of <i>pValue</i>, in bytes.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. All the interface methods in Windows Media Device Manager can return any of the following classes of error codes:
     * 
     * <ul>
     * <li>Standard COM error codes </li>
     * <li>Windows error codes converted to HRESULT values </li>
     * <li>Windows Media Device Manager error codes </li>
     * </ul>
     * For an extensive list of possible error codes, see <a href="/windows/desktop/WMDM/error-codes">Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nf-mswmdm-iwmdmmetadata-additem
     */
    AddItem(Type, pwszTagName, pValue, iLength) {
        pwszTagName := pwszTagName is String ? StrPtr(pwszTagName) : pwszTagName

        pValueMarshal := pValue is VarRef ? "char*" : "ptr"

        result := ComCall(3, this, "int", Type, "ptr", pwszTagName, pValueMarshal, pValue, "uint", iLength, "HRESULT")
        return result
    }

    /**
     * The QueryByName method retrieves the value of a property specified by name.
     * @param {PWSTR} pwszTagName Pointer to a wide-character <b>null</b>-terminated string specifying the property name. A list of standard property name constants is given in <a href="https://docs.microsoft.com/windows/desktop/WMDM/metadata-constants">Metadata Constants</a>.
     * @param {Pointer<Integer>} pType An <a href="https://docs.microsoft.com/windows/desktop/WMDM/wmdm-tag-datatype">WMDM_TAG_DATATYPE</a> enumerated value describing the type of data retrieved by <i>pValue</i>.
     * @param {Pointer<Pointer<Integer>>} pValue Pointer to a pointer to a byte array that receives the content of the value if the method succeeds. Windows Media Device Manager allocates this memory and the caller must free it using <b>CoTaskMemFree</b>.
     * @param {Pointer<Integer>} pcbLength Pointer to the size, in bytes, of the byte array <i>ppValue</i>. If the value is a string, this includes the termination character.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. All the interface methods in Windows Media Device Manager can return any of the following classes of error codes:
     * 
     * <ul>
     * <li>Standard COM error codes </li>
     * <li>Windows error codes converted to HRESULT values </li>
     * <li>Windows Media Device Manager error codes </li>
     * </ul>
     * For an extensive list of possible error codes, see <a href="/windows/desktop/WMDM/error-codes">Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nf-mswmdm-iwmdmmetadata-querybyname
     */
    QueryByName(pwszTagName, pType, pValue, pcbLength) {
        pwszTagName := pwszTagName is String ? StrPtr(pwszTagName) : pwszTagName

        pTypeMarshal := pType is VarRef ? "int*" : "ptr"
        pValueMarshal := pValue is VarRef ? "ptr*" : "ptr"
        pcbLengthMarshal := pcbLength is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "ptr", pwszTagName, pTypeMarshal, pType, pValueMarshal, pValue, pcbLengthMarshal, pcbLength, "HRESULT")
        return result
    }

    /**
     * The QueryByIndex method retrieves the value of a property specified by index.
     * @param {Integer} iIndex Integer specifying the zero-based index of the property. The number of items is obtained through the <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nf-mswmdm-iwmdmmetadata-getitemcount">GetItemCount</a> call.
     * @param {Pointer<Pointer<Integer>>} ppwszName Name of the property. Windows Media Device Manager allocates this memory, and the caller must free it using <b>CoTaskMemFree</b>.
     * @param {Pointer<Integer>} pType An <a href="https://docs.microsoft.com/windows/desktop/WMDM/wmdm-tag-datatype">WMDM_TAG_DATATYPE</a> enumerated value describing the type of data returned in <i>ppValue</i>.
     * @param {Pointer<Pointer<Integer>>} ppValue Pointer to a pointer to a byte array that receives the content of the value if the method succeeds. This memory is allocated by Windows Media Device Manager, and the caller must free it using <b>CoTaskMemFree</b>.
     * @param {Pointer<Integer>} pcbLength Pointer to the size, in bytes, of the byte array <i>ppValue</i>. If the value is a string, this includes the termination character.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. All the interface methods in Windows Media Device Manager can return any of the following classes of error codes:
     * 
     * <ul>
     * <li>Standard COM error codes </li>
     * <li>Windows error codes converted to HRESULT values </li>
     * <li>Windows Media Device Manager error codes </li>
     * </ul>
     * For an extensive list of possible error codes, see <a href="/windows/desktop/WMDM/error-codes">Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nf-mswmdm-iwmdmmetadata-querybyindex
     */
    QueryByIndex(iIndex, ppwszName, pType, ppValue, pcbLength) {
        ppwszNameMarshal := ppwszName is VarRef ? "ptr*" : "ptr"
        pTypeMarshal := pType is VarRef ? "int*" : "ptr"
        ppValueMarshal := ppValue is VarRef ? "ptr*" : "ptr"
        pcbLengthMarshal := pcbLength is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "uint", iIndex, ppwszNameMarshal, ppwszName, pTypeMarshal, pType, ppValueMarshal, ppValue, pcbLengthMarshal, pcbLength, "HRESULT")
        return result
    }

    /**
     * The GetItemCount method retrieves the total number of properties held by the interface.
     * @returns {Integer} Pointer to an integer that receives the total number of metadata properties stored by the interface.
     * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nf-mswmdm-iwmdmmetadata-getitemcount
     */
    GetItemCount() {
        result := ComCall(6, this, "uint*", &iCount := 0, "HRESULT")
        return iCount
    }
}
