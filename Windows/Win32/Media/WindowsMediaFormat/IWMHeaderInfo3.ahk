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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetAttributeCountEx", "GetAttributeIndices", "GetAttributeByIndexEx", "ModifyAttribute", "AddAttribute", "DeleteAttribute", "AddCodecInfo"]

    /**
     * 
     * @param {Integer} wStreamNum 
     * @param {Pointer<Integer>} pcAttributes 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmheaderinfo3-getattributecountex
     */
    GetAttributeCountEx(wStreamNum, pcAttributes) {
        result := ComCall(17, this, "ushort", wStreamNum, "ushort*", pcAttributes, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} wStreamNum 
     * @param {PWSTR} pwszName 
     * @param {Pointer<Integer>} pwLangIndex 
     * @param {Pointer<Integer>} pwIndices 
     * @param {Pointer<Integer>} pwCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmheaderinfo3-getattributeindices
     */
    GetAttributeIndices(wStreamNum, pwszName, pwLangIndex, pwIndices, pwCount) {
        pwszName := pwszName is String ? StrPtr(pwszName) : pwszName

        result := ComCall(18, this, "ushort", wStreamNum, "ptr", pwszName, "ushort*", pwLangIndex, "ushort*", pwIndices, "ushort*", pwCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} wStreamNum 
     * @param {Integer} wIndex 
     * @param {PWSTR} pwszName 
     * @param {Pointer<Integer>} pwNameLen 
     * @param {Pointer<Integer>} pType 
     * @param {Pointer<Integer>} pwLangIndex 
     * @param {Pointer<Integer>} pValue 
     * @param {Pointer<Integer>} pdwDataLength 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmheaderinfo3-getattributebyindexex
     */
    GetAttributeByIndexEx(wStreamNum, wIndex, pwszName, pwNameLen, pType, pwLangIndex, pValue, pdwDataLength) {
        pwszName := pwszName is String ? StrPtr(pwszName) : pwszName

        result := ComCall(19, this, "ushort", wStreamNum, "ushort", wIndex, "ptr", pwszName, "ushort*", pwNameLen, "int*", pType, "ushort*", pwLangIndex, "char*", pValue, "uint*", pdwDataLength, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} wStreamNum 
     * @param {Integer} wIndex 
     * @param {Integer} Type 
     * @param {Integer} wLangIndex 
     * @param {Pointer<Integer>} pValue 
     * @param {Integer} dwLength 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmheaderinfo3-modifyattribute
     */
    ModifyAttribute(wStreamNum, wIndex, Type, wLangIndex, pValue, dwLength) {
        result := ComCall(20, this, "ushort", wStreamNum, "ushort", wIndex, "int", Type, "ushort", wLangIndex, "char*", pValue, "uint", dwLength, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} wStreamNum 
     * @param {PWSTR} pszName 
     * @param {Pointer<Integer>} pwIndex 
     * @param {Integer} Type 
     * @param {Integer} wLangIndex 
     * @param {Pointer<Integer>} pValue 
     * @param {Integer} dwLength 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmheaderinfo3-addattribute
     */
    AddAttribute(wStreamNum, pszName, pwIndex, Type, wLangIndex, pValue, dwLength) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        result := ComCall(21, this, "ushort", wStreamNum, "ptr", pszName, "ushort*", pwIndex, "int", Type, "ushort", wLangIndex, "char*", pValue, "uint", dwLength, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} wStreamNum 
     * @param {Integer} wIndex 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmheaderinfo3-deleteattribute
     */
    DeleteAttribute(wStreamNum, wIndex) {
        result := ComCall(22, this, "ushort", wStreamNum, "ushort", wIndex, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwszName 
     * @param {PWSTR} pwszDescription 
     * @param {Integer} codecType 
     * @param {Integer} cbCodecInfo 
     * @param {Pointer<Integer>} pbCodecInfo 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmheaderinfo3-addcodecinfo
     */
    AddCodecInfo(pwszName, pwszDescription, codecType, cbCodecInfo, pbCodecInfo) {
        pwszName := pwszName is String ? StrPtr(pwszName) : pwszName
        pwszDescription := pwszDescription is String ? StrPtr(pwszDescription) : pwszDescription

        result := ComCall(23, this, "ptr", pwszName, "ptr", pwszDescription, "int", codecType, "ushort", cbCodecInfo, "char*", pbCodecInfo, "HRESULT")
        return result
    }
}
