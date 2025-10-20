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
     * 
     * @param {Integer} wStreamNum 
     * @param {Pointer<UInt16>} pcAttributes 
     * @returns {HRESULT} 
     */
    GetAttributeCount(wStreamNum, pcAttributes) {
        result := ComCall(3, this, "ushort", wStreamNum, "ushort*", pcAttributes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} wIndex 
     * @param {Pointer<UInt16>} pwStreamNum 
     * @param {PWSTR} pwszName 
     * @param {Pointer<UInt16>} pcchNameLen 
     * @param {Pointer<Int32>} pType 
     * @param {Pointer<Byte>} pValue 
     * @param {Pointer<UInt16>} pcbLength 
     * @returns {HRESULT} 
     */
    GetAttributeByIndex(wIndex, pwStreamNum, pwszName, pcchNameLen, pType, pValue, pcbLength) {
        pwszName := pwszName is String ? StrPtr(pwszName) : pwszName

        result := ComCall(4, this, "ushort", wIndex, "ushort*", pwStreamNum, "ptr", pwszName, "ushort*", pcchNameLen, "int*", pType, "char*", pValue, "ushort*", pcbLength, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt16>} pwStreamNum 
     * @param {PWSTR} pszName 
     * @param {Pointer<Int32>} pType 
     * @param {Pointer<Byte>} pValue 
     * @param {Pointer<UInt16>} pcbLength 
     * @returns {HRESULT} 
     */
    GetAttributeByName(pwStreamNum, pszName, pType, pValue, pcbLength) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        result := ComCall(5, this, "ushort*", pwStreamNum, "ptr", pszName, "int*", pType, "char*", pValue, "ushort*", pcbLength, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} wStreamNum 
     * @param {PWSTR} pszName 
     * @param {Integer} Type 
     * @param {Pointer<Byte>} pValue 
     * @param {Integer} cbLength 
     * @returns {HRESULT} 
     */
    SetAttribute(wStreamNum, pszName, Type, pValue, cbLength) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        result := ComCall(6, this, "ushort", wStreamNum, "ptr", pszName, "int", Type, "char*", pValue, "ushort", cbLength, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt16>} pcMarkers 
     * @returns {HRESULT} 
     */
    GetMarkerCount(pcMarkers) {
        result := ComCall(7, this, "ushort*", pcMarkers, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} wIndex 
     * @param {PWSTR} pwszMarkerName 
     * @param {Pointer<UInt16>} pcchMarkerNameLen 
     * @param {Pointer<UInt64>} pcnsMarkerTime 
     * @returns {HRESULT} 
     */
    GetMarker(wIndex, pwszMarkerName, pcchMarkerNameLen, pcnsMarkerTime) {
        pwszMarkerName := pwszMarkerName is String ? StrPtr(pwszMarkerName) : pwszMarkerName

        result := ComCall(8, this, "ushort", wIndex, "ptr", pwszMarkerName, "ushort*", pcchMarkerNameLen, "uint*", pcnsMarkerTime, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pwszMarkerName 
     * @param {Integer} cnsMarkerTime 
     * @returns {HRESULT} 
     */
    AddMarker(pwszMarkerName, cnsMarkerTime) {
        pwszMarkerName := pwszMarkerName is String ? StrPtr(pwszMarkerName) : pwszMarkerName

        result := ComCall(9, this, "ptr", pwszMarkerName, "uint", cnsMarkerTime, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} wIndex 
     * @returns {HRESULT} 
     */
    RemoveMarker(wIndex) {
        result := ComCall(10, this, "ushort", wIndex, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt16>} pcScripts 
     * @returns {HRESULT} 
     */
    GetScriptCount(pcScripts) {
        result := ComCall(11, this, "ushort*", pcScripts, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} wIndex 
     * @param {PWSTR} pwszType 
     * @param {Pointer<UInt16>} pcchTypeLen 
     * @param {PWSTR} pwszCommand 
     * @param {Pointer<UInt16>} pcchCommandLen 
     * @param {Pointer<UInt64>} pcnsScriptTime 
     * @returns {HRESULT} 
     */
    GetScript(wIndex, pwszType, pcchTypeLen, pwszCommand, pcchCommandLen, pcnsScriptTime) {
        pwszType := pwszType is String ? StrPtr(pwszType) : pwszType
        pwszCommand := pwszCommand is String ? StrPtr(pwszCommand) : pwszCommand

        result := ComCall(12, this, "ushort", wIndex, "ptr", pwszType, "ushort*", pcchTypeLen, "ptr", pwszCommand, "ushort*", pcchCommandLen, "uint*", pcnsScriptTime, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pwszType 
     * @param {PWSTR} pwszCommand 
     * @param {Integer} cnsScriptTime 
     * @returns {HRESULT} 
     */
    AddScript(pwszType, pwszCommand, cnsScriptTime) {
        pwszType := pwszType is String ? StrPtr(pwszType) : pwszType
        pwszCommand := pwszCommand is String ? StrPtr(pwszCommand) : pwszCommand

        result := ComCall(13, this, "ptr", pwszType, "ptr", pwszCommand, "uint", cnsScriptTime, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} wIndex 
     * @returns {HRESULT} 
     */
    RemoveScript(wIndex) {
        result := ComCall(14, this, "ushort", wIndex, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
