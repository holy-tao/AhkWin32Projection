#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWMHeaderInfo2.ahk

/**
 * The IWMHeaderInfo3 interface supports the following new metadata features:Attribute data in excess of 64 kilobytes.Multiple attributes with the same name.Attributes in multiple languages.Because the attributes created using this interface can have duplicate names, the methods of this interface use index values to identify attributes.The IWMHeaderInfo3 interface is implemented by the metadata editor object, the writer object, the reader object, and the synchronous reader object. To obtain a pointer to an instance, call the QueryInterface method of any other interface in the desired object.
 * @remarks
 * 
  * For information about using the writer for metadata editing, see <a href="https://docs.microsoft.com/windows/desktop/wmformat/to-edit-metadata-with-the-writer">To Edit Metadata with the Writer</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nn-wmsdkidl-iwmheaderinfo3
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class IWMHeaderInfo3 extends IWMHeaderInfo2{
    /**
     * The interface identifier for IWMHeaderInfo3
     * @type {Guid}
     */
    static IID => Guid("{15cc68e3-27cc-4ecd-b222-3f5d02d80bd5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 17

    /**
     * 
     * @param {Integer} wStreamNum 
     * @param {Pointer<UInt16>} pcAttributes 
     * @returns {HRESULT} 
     */
    GetAttributeCountEx(wStreamNum, pcAttributes) {
        result := ComCall(17, this, "ushort", wStreamNum, "ushort*", pcAttributes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} wStreamNum 
     * @param {PWSTR} pwszName 
     * @param {Pointer<UInt16>} pwLangIndex 
     * @param {Pointer<UInt16>} pwIndices 
     * @param {Pointer<UInt16>} pwCount 
     * @returns {HRESULT} 
     */
    GetAttributeIndices(wStreamNum, pwszName, pwLangIndex, pwIndices, pwCount) {
        pwszName := pwszName is String ? StrPtr(pwszName) : pwszName

        result := ComCall(18, this, "ushort", wStreamNum, "ptr", pwszName, "ushort*", pwLangIndex, "ushort*", pwIndices, "ushort*", pwCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} wStreamNum 
     * @param {Integer} wIndex 
     * @param {PWSTR} pwszName 
     * @param {Pointer<UInt16>} pwNameLen 
     * @param {Pointer<Int32>} pType 
     * @param {Pointer<UInt16>} pwLangIndex 
     * @param {Pointer<Byte>} pValue 
     * @param {Pointer<UInt32>} pdwDataLength 
     * @returns {HRESULT} 
     */
    GetAttributeByIndexEx(wStreamNum, wIndex, pwszName, pwNameLen, pType, pwLangIndex, pValue, pdwDataLength) {
        pwszName := pwszName is String ? StrPtr(pwszName) : pwszName

        result := ComCall(19, this, "ushort", wStreamNum, "ushort", wIndex, "ptr", pwszName, "ushort*", pwNameLen, "int*", pType, "ushort*", pwLangIndex, "char*", pValue, "uint*", pdwDataLength, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} wStreamNum 
     * @param {Integer} wIndex 
     * @param {Integer} Type 
     * @param {Integer} wLangIndex 
     * @param {Pointer<Byte>} pValue 
     * @param {Integer} dwLength 
     * @returns {HRESULT} 
     */
    ModifyAttribute(wStreamNum, wIndex, Type, wLangIndex, pValue, dwLength) {
        result := ComCall(20, this, "ushort", wStreamNum, "ushort", wIndex, "int", Type, "ushort", wLangIndex, "char*", pValue, "uint", dwLength, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} wStreamNum 
     * @param {PWSTR} pszName 
     * @param {Pointer<UInt16>} pwIndex 
     * @param {Integer} Type 
     * @param {Integer} wLangIndex 
     * @param {Pointer<Byte>} pValue 
     * @param {Integer} dwLength 
     * @returns {HRESULT} 
     */
    AddAttribute(wStreamNum, pszName, pwIndex, Type, wLangIndex, pValue, dwLength) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        result := ComCall(21, this, "ushort", wStreamNum, "ptr", pszName, "ushort*", pwIndex, "int", Type, "ushort", wLangIndex, "char*", pValue, "uint", dwLength, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} wStreamNum 
     * @param {Integer} wIndex 
     * @returns {HRESULT} 
     */
    DeleteAttribute(wStreamNum, wIndex) {
        result := ComCall(22, this, "ushort", wStreamNum, "ushort", wIndex, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pwszName 
     * @param {PWSTR} pwszDescription 
     * @param {Integer} codecType 
     * @param {Integer} cbCodecInfo 
     * @param {Pointer<Byte>} pbCodecInfo 
     * @returns {HRESULT} 
     */
    AddCodecInfo(pwszName, pwszDescription, codecType, cbCodecInfo, pbCodecInfo) {
        pwszName := pwszName is String ? StrPtr(pwszName) : pwszName
        pwszDescription := pwszDescription is String ? StrPtr(pwszDescription) : pwszDescription

        result := ComCall(23, this, "ptr", pwszName, "ptr", pwszDescription, "int", codecType, "ushort", cbCodecInfo, "char*", pbCodecInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
