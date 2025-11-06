#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Retrieves name/value pairs from a media transform device (MTD) through the device's General Purpose Name Value Service (GPNVS). Name/value pairs are used to get the capabilities of the device.
 * @remarks
 * 
  * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IBDA_NameValueService)</c>.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//bdaiface/nn-bdaiface-ibda_namevalueservice
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IBDA_NameValueService extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBDA_NameValueService
     * @type {Guid}
     */
    static IID => Guid("{7f0b3150-7b81-4ad4-98e3-7e9097094301}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetValueNameByIndex", "GetValue", "SetValue"]

    /**
     * 
     * @param {Integer} ulIndex 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_namevalueservice-getvaluenamebyindex
     */
    GetValueNameByIndex(ulIndex) {
        pbstrName := BSTR()
        result := ComCall(3, this, "uint", ulIndex, "ptr", pbstrName, "HRESULT")
        return pbstrName
    }

    /**
     * 
     * @param {BSTR} bstrName 
     * @param {BSTR} bstrLanguage 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_namevalueservice-getvalue
     */
    GetValue(bstrName, bstrLanguage) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName
        bstrLanguage := bstrLanguage is String ? BSTR.Alloc(bstrLanguage).Value : bstrLanguage

        pbstrValue := BSTR()
        result := ComCall(4, this, "ptr", bstrName, "ptr", bstrLanguage, "ptr", pbstrValue, "HRESULT")
        return pbstrValue
    }

    /**
     * 
     * @param {Integer} ulDialogRequest 
     * @param {BSTR} bstrLanguage 
     * @param {BSTR} bstrName 
     * @param {BSTR} bstrValue 
     * @param {Integer} ulReserved 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_namevalueservice-setvalue
     */
    SetValue(ulDialogRequest, bstrLanguage, bstrName, bstrValue, ulReserved) {
        bstrLanguage := bstrLanguage is String ? BSTR.Alloc(bstrLanguage).Value : bstrLanguage
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName
        bstrValue := bstrValue is String ? BSTR.Alloc(bstrValue).Value : bstrValue

        result := ComCall(5, this, "uint", ulDialogRequest, "ptr", bstrLanguage, "ptr", bstrName, "ptr", bstrValue, "uint", ulReserved, "HRESULT")
        return result
    }
}
