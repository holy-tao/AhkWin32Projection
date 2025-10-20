#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWMCodecInfo2.ahk

/**
 * The IWMCodecInfo3 interface retrieves properties from a codec.You can retrieve a pointer to IWMCodecInfo3 with a call to the QueryInterface method of any other interface of the profile manager object.
 * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nn-wmsdkidl-iwmcodecinfo3
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class IWMCodecInfo3 extends IWMCodecInfo2{
    /**
     * The interface identifier for IWMCodecInfo3
     * @type {Guid}
     */
    static IID => Guid("{7e51f487-4d93-4f98-8ab4-27d0565adc51}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * 
     * @param {Pointer<Guid>} guidType 
     * @param {Integer} dwCodecIndex 
     * @param {Integer} dwFormatIndex 
     * @param {PWSTR} pszName 
     * @param {Pointer<Int32>} pType 
     * @param {Pointer<Byte>} pValue 
     * @param {Pointer<UInt32>} pdwSize 
     * @returns {HRESULT} 
     */
    GetCodecFormatProp(guidType, dwCodecIndex, dwFormatIndex, pszName, pType, pValue, pdwSize) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        result := ComCall(8, this, "ptr", guidType, "uint", dwCodecIndex, "uint", dwFormatIndex, "ptr", pszName, "int*", pType, "char*", pValue, "uint*", pdwSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} guidType 
     * @param {Integer} dwCodecIndex 
     * @param {PWSTR} pszName 
     * @param {Pointer<Int32>} pType 
     * @param {Pointer<Byte>} pValue 
     * @param {Pointer<UInt32>} pdwSize 
     * @returns {HRESULT} 
     */
    GetCodecProp(guidType, dwCodecIndex, pszName, pType, pValue, pdwSize) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        result := ComCall(9, this, "ptr", guidType, "uint", dwCodecIndex, "ptr", pszName, "int*", pType, "char*", pValue, "uint*", pdwSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} guidType 
     * @param {Integer} dwCodecIndex 
     * @param {PWSTR} pszName 
     * @param {Integer} Type 
     * @param {Pointer<Byte>} pValue 
     * @param {Integer} dwSize 
     * @returns {HRESULT} 
     */
    SetCodecEnumerationSetting(guidType, dwCodecIndex, pszName, Type, pValue, dwSize) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        result := ComCall(10, this, "ptr", guidType, "uint", dwCodecIndex, "ptr", pszName, "int", Type, "char*", pValue, "uint", dwSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} guidType 
     * @param {Integer} dwCodecIndex 
     * @param {PWSTR} pszName 
     * @param {Pointer<Int32>} pType 
     * @param {Pointer<Byte>} pValue 
     * @param {Pointer<UInt32>} pdwSize 
     * @returns {HRESULT} 
     */
    GetCodecEnumerationSetting(guidType, dwCodecIndex, pszName, pType, pValue, pdwSize) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        result := ComCall(11, this, "ptr", guidType, "uint", dwCodecIndex, "ptr", pszName, "int*", pType, "char*", pValue, "uint*", pdwSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
