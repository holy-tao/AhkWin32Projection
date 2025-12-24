#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\INSSBuffer2.ahk

/**
 * The INSSBuffer3 interface enhances the INSSBuffer interface by adding the ability to set and retrieve single properties for a sample.
 * @see https://docs.microsoft.com/windows/win32/api//wmsbuffer/nn-wmsbuffer-inssbuffer3
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class INSSBuffer3 extends INSSBuffer2{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INSSBuffer3
     * @type {Guid}
     */
    static IID => Guid("{c87ceaaf-75be-4bc4-84eb-ac2798507672}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 10

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetProperty", "GetProperty"]

    /**
     * The SetProperty method is used to specify a property for the sample in the buffer. Buffer properties are used to pass information along with the sample to the writer object when writing ASF files. Sample properties are GUID values.
     * @param {Guid} guidBufferProperty <b>GUID</b> value identifying the property you want to set. The predefined buffer properties are described in the <a href="https://docs.microsoft.com/windows/desktop/wmformat/sample-extension-types">Sample Extension Types</a> section of this documentation. You can also define your own sample extension schemes using your own GUID values.
     * @param {Pointer<Void>} pvBufferProperty Pointer to a buffer containing the property value.
     * @param {Integer} dwBufferPropertySize <b>DWORD</b> value containing the size of the buffer pointed to by <i>pvBufferProperty</i>.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method was unable to allocate memory for the new property.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmsbuffer/nf-wmsbuffer-inssbuffer3-setproperty
     */
    SetProperty(guidBufferProperty, pvBufferProperty, dwBufferPropertySize) {
        pvBufferPropertyMarshal := pvBufferProperty is VarRef ? "ptr" : "ptr"

        result := ComCall(10, this, "ptr", guidBufferProperty, pvBufferPropertyMarshal, pvBufferProperty, "uint", dwBufferPropertySize, "HRESULT")
        return result
    }

    /**
     * The GetProperty method is used to retrieve a property of the sample in the buffer. Buffer properties are used to pass information along with the sample to the writer object when writing ASF files. Sample properties are GUID values.
     * @param {Guid} guidBufferProperty <b>GUID</b> value identifying the property to retrieve. The predefined buffer properties are described in the <a href="https://docs.microsoft.com/windows/desktop/wmformat/sample-extension-types">Sample Extension Types</a> section of this documentation. You can also define your own sample extension schemes using your own GUID values.
     * @param {Pointer<Integer>} pdwBufferPropertySize Pointer to a <b>DWORD</b> value containing the size of the buffer pointed to by <i>pvBufferProperty</i>. If you pass <b>NULL</b> for <i>pvBufferProperty</i>, the method sets the value pointed to by this parameter to the size required to hold the property value. If you pass a non-<b>NULL</b> value for <i>pvBufferProperty</i>, the value pointed to by this parameter must equal the size of the buffer pointed to by <i>pvBufferProperty</i>.
     * @returns {Void} Pointer to a buffer that will receive the value of the property specified by <i>guidBufferProperty</i>.
     * @see https://docs.microsoft.com/windows/win32/api//wmsbuffer/nf-wmsbuffer-inssbuffer3-getproperty
     */
    GetProperty(guidBufferProperty, pdwBufferPropertySize) {
        pdwBufferPropertySizeMarshal := pdwBufferPropertySize is VarRef ? "uint*" : "ptr"

        result := ComCall(11, this, "ptr", guidBufferProperty, "ptr", &pvBufferProperty := 0, pdwBufferPropertySizeMarshal, pdwBufferPropertySize, "HRESULT")
        return pvBufferProperty
    }
}
