#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWMWriterAdvanced.ahk

/**
 * The IWMWriterAdvanced2 interface provides the ability to set and retrieve named settings for an input.IWMWriterAdvanced2 exists for every instance of the writer object. To obtain a pointer to this interface, call QueryInterface on the writer object.
 * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nn-wmsdkidl-iwmwriteradvanced2
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class IWMWriterAdvanced2 extends IWMWriterAdvanced{
    /**
     * The interface identifier for IWMWriterAdvanced2
     * @type {Guid}
     */
    static IID => Guid("{962dc1ec-c046-4db8-9cc7-26ceae500817}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 14

    /**
     * 
     * @param {Integer} dwInputNum 
     * @param {PWSTR} pszName 
     * @param {Pointer<Int32>} pType 
     * @param {Pointer<Byte>} pValue 
     * @param {Pointer<UInt16>} pcbLength 
     * @returns {HRESULT} 
     */
    GetInputSetting(dwInputNum, pszName, pType, pValue, pcbLength) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        result := ComCall(14, this, "uint", dwInputNum, "ptr", pszName, "int*", pType, "char*", pValue, "ushort*", pcbLength, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwInputNum 
     * @param {PWSTR} pszName 
     * @param {Integer} Type 
     * @param {Pointer<Byte>} pValue 
     * @param {Integer} cbLength 
     * @returns {HRESULT} 
     */
    SetInputSetting(dwInputNum, pszName, Type, pValue, cbLength) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        result := ComCall(15, this, "uint", dwInputNum, "ptr", pszName, "int", Type, "char*", pValue, "ushort", cbLength, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
