#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides methods that retrieve format-specific codec properties.
 * @see https://docs.microsoft.com/windows/win32/api//wmcodecdsp/nn-wmcodecdsp-iwmcodecprops
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IWMCodecProps extends IUnknown{
    /**
     * The interface identifier for IWMCodecProps
     * @type {Guid}
     */
    static IID => Guid("{2573e11a-f01a-4fdd-a98d-63b8e0ba9589}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<DMO_MEDIA_TYPE>} pmt 
     * @param {PWSTR} pszName 
     * @param {Pointer<Int32>} pType 
     * @param {Pointer<Byte>} pValue 
     * @param {Pointer<UInt32>} pdwSize 
     * @returns {HRESULT} 
     */
    GetFormatProp(pmt, pszName, pType, pValue, pdwSize) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        result := ComCall(3, this, "ptr", pmt, "ptr", pszName, "int*", pType, "char*", pValue, "uint*", pdwSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwFormat 
     * @param {PWSTR} pszName 
     * @param {Pointer<Int32>} pType 
     * @param {Pointer<Byte>} pValue 
     * @param {Pointer<UInt32>} pdwSize 
     * @returns {HRESULT} 
     */
    GetCodecProp(dwFormat, pszName, pType, pValue, pdwSize) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        result := ComCall(4, this, "uint", dwFormat, "ptr", pszName, "int*", pType, "char*", pValue, "uint*", pdwSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
