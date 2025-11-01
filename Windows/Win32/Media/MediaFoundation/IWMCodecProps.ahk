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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetFormatProp", "GetCodecProp"]

    /**
     * 
     * @param {Pointer<DMO_MEDIA_TYPE>} pmt 
     * @param {PWSTR} pszName 
     * @param {Pointer<Integer>} pType 
     * @param {Pointer<Integer>} pValue 
     * @param {Pointer<Integer>} pdwSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmcodecdsp/nf-wmcodecdsp-iwmcodecprops-getformatprop
     */
    GetFormatProp(pmt, pszName, pType, pValue, pdwSize) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        result := ComCall(3, this, "ptr", pmt, "ptr", pszName, "int*", pType, "char*", pValue, "uint*", pdwSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwFormat 
     * @param {PWSTR} pszName 
     * @param {Pointer<Integer>} pType 
     * @param {Pointer<Integer>} pValue 
     * @param {Pointer<Integer>} pdwSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmcodecdsp/nf-wmcodecdsp-iwmcodecprops-getcodecprop
     */
    GetCodecProp(dwFormat, pszName, pType, pValue, pdwSize) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        result := ComCall(4, this, "uint", dwFormat, "ptr", pszName, "int*", pType, "char*", pValue, "uint*", pdwSize, "HRESULT")
        return result
    }
}
