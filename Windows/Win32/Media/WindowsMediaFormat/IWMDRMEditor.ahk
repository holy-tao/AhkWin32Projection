#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWMDRMEditor interface is exposed on the metadata editor object.
 * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nn-wmsdkidl-iwmdrmeditor
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class IWMDRMEditor extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMDRMEditor
     * @type {Guid}
     */
    static IID => Guid("{ff130ebc-a6c3-42a6-b401-c3382c3e08b3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDRMProperty"]

    /**
     * 
     * @param {PWSTR} pwstrName 
     * @param {Pointer<Integer>} pdwType 
     * @param {Pointer<Integer>} pValue 
     * @param {Pointer<Integer>} pcbLength 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmdrmeditor-getdrmproperty
     */
    GetDRMProperty(pwstrName, pdwType, pValue, pcbLength) {
        pwstrName := pwstrName is String ? StrPtr(pwstrName) : pwstrName

        result := ComCall(3, this, "ptr", pwstrName, "int*", pdwType, "char*", pValue, "ushort*", pcbLength, "HRESULT")
        return result
    }
}
