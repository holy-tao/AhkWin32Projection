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
     * Gets a name, specified by index, from the device's list of name/value pairs.
     * @param {Integer} ulIndex The zero-based index of the name to get.
     * @returns {BSTR} Receives the name as a <b>BSTR</b>. The caller must free the <b>BSTR</b> by calling <b>SysFreeString</b>.
     * @see https://docs.microsoft.com/windows/win32/api//bdaiface/nf-bdaiface-ibda_namevalueservice-getvaluenamebyindex
     */
    GetValueNameByIndex(ulIndex) {
        pbstrName := BSTR()
        result := ComCall(3, this, "uint", ulIndex, "ptr", pbstrName, "HRESULT")
        return pbstrName
    }

    /**
     * Gets a value by name.
     * @param {BSTR} bstrName The name of the value to retrieve.
     * @param {BSTR} bstrLanguage The language for the value. If the value of the name/value pair is localizable, this string must contain an ISO 639-2 language code with a dash followed by an ISO 3166 country/region code. Otherwise, this parameter may contain an empty string.
     * @returns {BSTR} Receives the value as a <b>BSTR</b>. The caller must free the <b>BSTR</b> by calling <b>SysFreeString</b>.
     * @see https://docs.microsoft.com/windows/win32/api//bdaiface/nf-bdaiface-ibda_namevalueservice-getvalue
     */
    GetValue(bstrName, bstrLanguage) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName
        bstrLanguage := bstrLanguage is String ? BSTR.Alloc(bstrLanguage).Value : bstrLanguage

        pbstrValue := BSTR()
        result := ComCall(4, this, "ptr", bstrName, "ptr", bstrLanguage, "ptr", pbstrValue, "HRESULT")
        return pbstrValue
    }

    /**
     * Sets a name/value pair in device memory.
     * @param {Integer} ulDialogRequest Specifies a logical link with a user interface (MMI) dialog box that might be triggered by setting the value.
     * @param {BSTR} bstrLanguage The language of the dialog box. This string contains an ISO 639-2 language code with a dash followed by an ISO 3166 country/region code.
     * @param {BSTR} bstrName The name of the name/value pair to set.
     * @param {BSTR} bstrValue The value to set.
     * @param {Integer} ulReserved Reserved. Set to zero.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//bdaiface/nf-bdaiface-ibda_namevalueservice-setvalue
     */
    SetValue(ulDialogRequest, bstrLanguage, bstrName, bstrValue, ulReserved) {
        bstrLanguage := bstrLanguage is String ? BSTR.Alloc(bstrLanguage).Value : bstrLanguage
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName
        bstrValue := bstrValue is String ? BSTR.Alloc(bstrValue).Value : bstrValue

        result := ComCall(5, this, "uint", ulDialogRequest, "ptr", bstrLanguage, "ptr", bstrName, "ptr", bstrValue, "uint", ulReserved, "HRESULT")
        return result
    }
}
