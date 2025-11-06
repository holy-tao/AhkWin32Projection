#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWMHeaderInfo interface sets and retrieves information in the header section of an ASF file.
 * @remarks
 * 
  * Although the <b>IWMHeaderInfo</b> interface is accessible from four different objects, not all of the features are available in all cases. The following table summarizes the differences in implementation for the various objects.
  * 
  * <table>
  * <tr>
  * <th>Object
  *             </th>
  * <th>Description
  *             </th>
  * </tr>
  * <tr>
  * <td>Metadata editor</td>
  * <td>Full functionality is implemented.</td>
  * </tr>
  * <tr>
  * <td>Writer</td>
  * <td>All methods that alter header items (those whose names begin with Add, Set, or Remove) are supported only before the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmwriter-beginwriting">IWMWriter::BeginWriting</a> method is called.All marker methods return E_NOTIMPL.
  * 
  * </td>
  * </tr>
  * <tr>
  * <td>Reader and synchronous reader</td>
  * <td>All methods that alter header items (those whose names begin with Add, Set, or Remove) return E_NOTIMPL.</td>
  * </tr>
  * </table>
  *  
  * 
  * For information about using the writer for metadata editing, see <a href="https://docs.microsoft.com/windows/desktop/wmformat/to-edit-metadata-with-the-writer">To Edit Metadata with the Writer</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nn-wmsdkidl-iwmheaderinfo
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class IWMHeaderInfo extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMHeaderInfo
     * @type {Guid}
     */
    static IID => Guid("{96406bda-2b2b-11d3-b36b-00c04f6108ff}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetAttributeCount", "GetAttributeByIndex", "GetAttributeByName", "SetAttribute", "GetMarkerCount", "GetMarker", "AddMarker", "RemoveMarker", "GetScriptCount", "GetScript", "AddScript", "RemoveScript"]

    /**
     * 
     * @param {Integer} wStreamNum 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmheaderinfo-getattributecount
     */
    GetAttributeCount(wStreamNum) {
        result := ComCall(3, this, "ushort", wStreamNum, "ushort*", &pcAttributes := 0, "HRESULT")
        return pcAttributes
    }

    /**
     * 
     * @param {Integer} wIndex 
     * @param {Pointer<Integer>} pwStreamNum 
     * @param {PWSTR} pwszName 
     * @param {Pointer<Integer>} pcchNameLen 
     * @param {Pointer<Integer>} pType 
     * @param {Pointer<Integer>} pValue 
     * @param {Pointer<Integer>} pcbLength 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmheaderinfo-getattributebyindex
     */
    GetAttributeByIndex(wIndex, pwStreamNum, pwszName, pcchNameLen, pType, pValue, pcbLength) {
        pwszName := pwszName is String ? StrPtr(pwszName) : pwszName

        pwStreamNumMarshal := pwStreamNum is VarRef ? "ushort*" : "ptr"
        pcchNameLenMarshal := pcchNameLen is VarRef ? "ushort*" : "ptr"
        pTypeMarshal := pType is VarRef ? "int*" : "ptr"
        pValueMarshal := pValue is VarRef ? "char*" : "ptr"
        pcbLengthMarshal := pcbLength is VarRef ? "ushort*" : "ptr"

        result := ComCall(4, this, "ushort", wIndex, pwStreamNumMarshal, pwStreamNum, "ptr", pwszName, pcchNameLenMarshal, pcchNameLen, pTypeMarshal, pType, pValueMarshal, pValue, pcbLengthMarshal, pcbLength, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pwStreamNum 
     * @param {PWSTR} pszName 
     * @param {Pointer<Integer>} pType 
     * @param {Pointer<Integer>} pValue 
     * @param {Pointer<Integer>} pcbLength 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmheaderinfo-getattributebyname
     */
    GetAttributeByName(pwStreamNum, pszName, pType, pValue, pcbLength) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        pwStreamNumMarshal := pwStreamNum is VarRef ? "ushort*" : "ptr"
        pTypeMarshal := pType is VarRef ? "int*" : "ptr"
        pValueMarshal := pValue is VarRef ? "char*" : "ptr"
        pcbLengthMarshal := pcbLength is VarRef ? "ushort*" : "ptr"

        result := ComCall(5, this, pwStreamNumMarshal, pwStreamNum, "ptr", pszName, pTypeMarshal, pType, pValueMarshal, pValue, pcbLengthMarshal, pcbLength, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} wStreamNum 
     * @param {PWSTR} pszName 
     * @param {Integer} Type 
     * @param {Pointer<Integer>} pValue 
     * @param {Integer} cbLength 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmheaderinfo-setattribute
     */
    SetAttribute(wStreamNum, pszName, Type, pValue, cbLength) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        pValueMarshal := pValue is VarRef ? "char*" : "ptr"

        result := ComCall(6, this, "ushort", wStreamNum, "ptr", pszName, "int", Type, pValueMarshal, pValue, "ushort", cbLength, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmheaderinfo-getmarkercount
     */
    GetMarkerCount() {
        result := ComCall(7, this, "ushort*", &pcMarkers := 0, "HRESULT")
        return pcMarkers
    }

    /**
     * 
     * @param {Integer} wIndex 
     * @param {PWSTR} pwszMarkerName 
     * @param {Pointer<Integer>} pcchMarkerNameLen 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmheaderinfo-getmarker
     */
    GetMarker(wIndex, pwszMarkerName, pcchMarkerNameLen) {
        pwszMarkerName := pwszMarkerName is String ? StrPtr(pwszMarkerName) : pwszMarkerName

        pcchMarkerNameLenMarshal := pcchMarkerNameLen is VarRef ? "ushort*" : "ptr"

        result := ComCall(8, this, "ushort", wIndex, "ptr", pwszMarkerName, pcchMarkerNameLenMarshal, pcchMarkerNameLen, "uint*", &pcnsMarkerTime := 0, "HRESULT")
        return pcnsMarkerTime
    }

    /**
     * 
     * @param {PWSTR} pwszMarkerName 
     * @param {Integer} cnsMarkerTime 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmheaderinfo-addmarker
     */
    AddMarker(pwszMarkerName, cnsMarkerTime) {
        pwszMarkerName := pwszMarkerName is String ? StrPtr(pwszMarkerName) : pwszMarkerName

        result := ComCall(9, this, "ptr", pwszMarkerName, "uint", cnsMarkerTime, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} wIndex 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmheaderinfo-removemarker
     */
    RemoveMarker(wIndex) {
        result := ComCall(10, this, "ushort", wIndex, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmheaderinfo-getscriptcount
     */
    GetScriptCount() {
        result := ComCall(11, this, "ushort*", &pcScripts := 0, "HRESULT")
        return pcScripts
    }

    /**
     * 
     * @param {Integer} wIndex 
     * @param {PWSTR} pwszType 
     * @param {Pointer<Integer>} pcchTypeLen 
     * @param {PWSTR} pwszCommand 
     * @param {Pointer<Integer>} pcchCommandLen 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmheaderinfo-getscript
     */
    GetScript(wIndex, pwszType, pcchTypeLen, pwszCommand, pcchCommandLen) {
        pwszType := pwszType is String ? StrPtr(pwszType) : pwszType
        pwszCommand := pwszCommand is String ? StrPtr(pwszCommand) : pwszCommand

        pcchTypeLenMarshal := pcchTypeLen is VarRef ? "ushort*" : "ptr"
        pcchCommandLenMarshal := pcchCommandLen is VarRef ? "ushort*" : "ptr"

        result := ComCall(12, this, "ushort", wIndex, "ptr", pwszType, pcchTypeLenMarshal, pcchTypeLen, "ptr", pwszCommand, pcchCommandLenMarshal, pcchCommandLen, "uint*", &pcnsScriptTime := 0, "HRESULT")
        return pcnsScriptTime
    }

    /**
     * 
     * @param {PWSTR} pwszType 
     * @param {PWSTR} pwszCommand 
     * @param {Integer} cnsScriptTime 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmheaderinfo-addscript
     */
    AddScript(pwszType, pwszCommand, cnsScriptTime) {
        pwszType := pwszType is String ? StrPtr(pwszType) : pwszType
        pwszCommand := pwszCommand is String ? StrPtr(pwszCommand) : pwszCommand

        result := ComCall(13, this, "ptr", pwszType, "ptr", pwszCommand, "uint", cnsScriptTime, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} wIndex 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmheaderinfo-removescript
     */
    RemoveScript(wIndex) {
        result := ComCall(14, this, "ushort", wIndex, "HRESULT")
        return result
    }
}
