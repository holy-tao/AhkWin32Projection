#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWMIStreamProps interface provides access to the properties of an IStream object.To obtain a pointer to an IWMIStreamProps interface, call IStream::QueryInterface.
 * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nn-wmsdkidl-iwmistreamprops
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class IWMIStreamProps extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMIStreamProps
     * @type {Guid}
     */
    static IID => Guid("{6816dad3-2b4b-4c8e-8149-874c3483a753}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetProperty"]

    /**
     * 
     * @param {PWSTR} pszName 
     * @param {Pointer<Integer>} pType 
     * @param {Pointer<Integer>} pValue 
     * @param {Pointer<Integer>} pdwSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmistreamprops-getproperty
     */
    GetProperty(pszName, pType, pValue, pdwSize) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        result := ComCall(3, this, "ptr", pszName, "int*", pType, "char*", pValue, "uint*", pdwSize, "HRESULT")
        return result
    }
}
