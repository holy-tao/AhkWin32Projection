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
     * The GetDRMProperty method retrieves the specified DRM property.
     * @param {PWSTR} pwstrName Specifies the DRM file attribute to retrieve.
     * @param {Pointer<Integer>} pdwType Pointer that receives the data type of the returned value.
     * @param {Pointer<Integer>} pValue Pointer to the value requested in <i>pwstrName</i>.
     * @param {Pointer<Integer>} pcbLength Length of <i>pValue</i> in bytes.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmdrmeditor-getdrmproperty
     */
    GetDRMProperty(pwstrName, pdwType, pValue, pcbLength) {
        pwstrName := pwstrName is String ? StrPtr(pwstrName) : pwstrName

        pdwTypeMarshal := pdwType is VarRef ? "int*" : "ptr"
        pValueMarshal := pValue is VarRef ? "char*" : "ptr"
        pcbLengthMarshal := pcbLength is VarRef ? "ushort*" : "ptr"

        result := ComCall(3, this, "ptr", pwstrName, pdwTypeMarshal, pdwType, pValueMarshal, pValue, pcbLengthMarshal, pcbLength, "HRESULT")
        return result
    }
}
