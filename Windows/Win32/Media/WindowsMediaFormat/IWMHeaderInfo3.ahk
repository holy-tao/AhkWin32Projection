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
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmheaderinfo3-getattributecountex
     */
    GetAttributeCountEx(wStreamNum) {
        result := ComCall(17, this, "ushort", wStreamNum, "ushort*", &pcAttributes := 0, "HRESULT")
        return pcAttributes
    }

    /**
     * 
     * @param {Integer} wStreamNum 
     * @param {PWSTR} pwszName 
     * @param {Pointer<Integer>} pwLangIndex 
     * @param {Pointer<Integer>} pwCount 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmheaderinfo3-getattributeindices
     */
    GetAttributeIndices(wStreamNum, pwszName, pwLangIndex, pwCount) {
        pwszName := pwszName is String ? StrPtr(pwszName) : pwszName

        pwLangIndexMarshal := pwLangIndex is VarRef ? "ushort*" : "ptr"
        pwCountMarshal := pwCount is VarRef ? "ushort*" : "ptr"

        result := ComCall(18, this, "ushort", wStreamNum, "ptr", pwszName, pwLangIndexMarshal, pwLangIndex, "ushort*", &pwIndices := 0, pwCountMarshal, pwCount, "HRESULT")
        return pwIndices
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

        pwNameLenMarshal := pwNameLen is VarRef ? "ushort*" : "ptr"
        pTypeMarshal := pType is VarRef ? "int*" : "ptr"
        pwLangIndexMarshal := pwLangIndex is VarRef ? "ushort*" : "ptr"
        pValueMarshal := pValue is VarRef ? "char*" : "ptr"
        pdwDataLengthMarshal := pdwDataLength is VarRef ? "uint*" : "ptr"

        result := ComCall(19, this, "ushort", wStreamNum, "ushort", wIndex, "ptr", pwszName, pwNameLenMarshal, pwNameLen, pTypeMarshal, pType, pwLangIndexMarshal, pwLangIndex, pValueMarshal, pValue, pdwDataLengthMarshal, pdwDataLength, "HRESULT")
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
        pValueMarshal := pValue is VarRef ? "char*" : "ptr"

        result := ComCall(20, this, "ushort", wStreamNum, "ushort", wIndex, "int", Type, "ushort", wLangIndex, pValueMarshal, pValue, "uint", dwLength, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} wStreamNum 
     * @param {PWSTR} pszName 
     * @param {Integer} Type 
     * @param {Integer} wLangIndex 
     * @param {Pointer<Integer>} pValue 
     * @param {Integer} dwLength 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmheaderinfo3-addattribute
     */
    AddAttribute(wStreamNum, pszName, Type, wLangIndex, pValue, dwLength) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        pValueMarshal := pValue is VarRef ? "char*" : "ptr"

        result := ComCall(21, this, "ushort", wStreamNum, "ptr", pszName, "ushort*", &pwIndex := 0, "int", Type, "ushort", wLangIndex, pValueMarshal, pValue, "uint", dwLength, "HRESULT")
        return pwIndex
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

        pbCodecInfoMarshal := pbCodecInfo is VarRef ? "char*" : "ptr"

        result := ComCall(23, this, "ptr", pwszName, "ptr", pwszDescription, "int", codecType, "ushort", cbCodecInfo, pbCodecInfoMarshal, pbCodecInfo, "HRESULT")
        return result
    }
}
