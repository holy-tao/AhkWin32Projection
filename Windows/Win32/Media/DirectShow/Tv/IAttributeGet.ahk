#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 and later. The IAttributeGet interface gets key/value pairs from an object, where the key is a GUID and the value is any binary data.
 * @remarks
 * 
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IAttributeGet)</c>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//dsattrib/nn-dsattrib-iattributeget
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IAttributeGet extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAttributeGet
     * @type {Guid}
     */
    static IID => Guid("{52dbd1ec-e48f-4528-9232-f442a68f0ae1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCount", "GetAttribIndexed", "GetAttrib"]

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 and later.
     * @returns {Integer} Receives the number of attributes.
     * @see https://docs.microsoft.com/windows/win32/api//dsattrib/nf-dsattrib-iattributeget-getcount
     */
    GetCount() {
        result := ComCall(3, this, "int*", &plCount := 0, "HRESULT")
        return plCount
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 and later.
     * @param {Integer} lIndex Zero-based index of the attribute. To get the number of attributes, call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dsattrib/nf-dsattrib-iattributeget-getcount">IAttributeGet::GetCount</a>.
     * @param {Pointer<Integer>} pbAttribute Pointer to a buffer that receives the attribute value. This parameter can be <b>NULL</b>.
     * @param {Pointer<Integer>} pdwAttributeLength If <i>pbAttribute</i> is <b>NULL</b>, this parameter receives the size of the attribute data, in bytes. If <i>pbAttribute</i> is non-<b>NULL</b>, this parameter specifies the size of the <i>pbAttribute</i> buffer, in bytes.
     * @returns {Guid} Receives the <b>GUID</b> for this attribute.
     * @see https://docs.microsoft.com/windows/win32/api//dsattrib/nf-dsattrib-iattributeget-getattribindexed
     */
    GetAttribIndexed(lIndex, pbAttribute, pdwAttributeLength) {
        pbAttributeMarshal := pbAttribute is VarRef ? "char*" : "ptr"
        pdwAttributeLengthMarshal := pdwAttributeLength is VarRef ? "uint*" : "ptr"

        pguidAttribute := Guid()
        result := ComCall(4, this, "int", lIndex, "ptr", pguidAttribute, pbAttributeMarshal, pbAttribute, pdwAttributeLengthMarshal, pdwAttributeLength, "HRESULT")
        return pguidAttribute
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 and later.
     * @param {Guid} guidAttribute <b>GUID</b> that specifies the attribute to retrieve.
     * @param {Pointer<Integer>} pbAttribute Pointer to a buffer that receives the attribute value. This parameter can be <b>NULL</b>.
     * @param {Pointer<Integer>} pdwAttributeLength If <i>pbAttribute</i> is <b>NULL</b>, this parameter receives the size of the attribute data, in bytes. If <i>pbAttribute</i> is non-<b>NULL</b>, this parameter specifies the size of the <i>pbAttribute</i> buffer, in bytes.
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
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>NULL</b> pointer value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NS_E_UNSUPPORTED_PROPERTY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified <b>GUID</b> does not match any attribute on this object.
     * 
     * </td>
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
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dsattrib/nf-dsattrib-iattributeget-getattrib
     */
    GetAttrib(guidAttribute, pbAttribute, pdwAttributeLength) {
        pbAttributeMarshal := pbAttribute is VarRef ? "char*" : "ptr"
        pdwAttributeLengthMarshal := pdwAttributeLength is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "ptr", guidAttribute, pbAttributeMarshal, pbAttribute, pdwAttributeLengthMarshal, pdwAttributeLength, "HRESULT")
        return result
    }
}
