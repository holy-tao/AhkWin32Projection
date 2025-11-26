#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\TF_PERSISTENT_PROPERTY_HEADER_ACP.ahk
#Include .\ITfRangeACP.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ITextStoreACPServices interface is implemented by the TSF manager to provide various services to an ACP-based application.
 * @see https://docs.microsoft.com/windows/win32/api//msctf/nn-msctf-itextstoreacpservices
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITextStoreACPServices extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITextStoreACPServices
     * @type {Guid}
     */
    static IID => Guid("{aa80e901-2021-11d2-93e0-0060b067b86e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Serialize", "Unserialize", "ForceLoadProperty", "CreateRange"]

    /**
     * ITextStoreACPServices::Serialize method
     * @param {ITfProperty} pProp Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfproperty">ITfProperty</a> interface that identifies the property to serialize.
     * @param {ITfRange} pRange Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfrange">ITfRange</a> interface that identifies the range that the property is obtained from.
     * @param {IStream} pStream Pointer to an <b>IStream</b> object that the TSF manager will write the property data to.
     * @returns {TF_PERSISTENT_PROPERTY_HEADER_ACP} Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/msctf/ns-msctf-tf_persistent_property_header_acp">TF_PERSISTENT_PROPERTY_HEADER_ACP</a> structure that receives the header data for the property.
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itextstoreacpservices-serialize
     */
    Serialize(pProp, pRange, pStream) {
        pHdr := TF_PERSISTENT_PROPERTY_HEADER_ACP()
        result := ComCall(3, this, "ptr", pProp, "ptr", pRange, "ptr", pHdr, "ptr", pStream, "HRESULT")
        return pHdr
    }

    /**
     * ITextStoreACPServices::Unserialize method
     * @param {ITfProperty} pProp Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfproperty">ITfProperty</a> object that receives the property data.
     * @param {Pointer<TF_PERSISTENT_PROPERTY_HEADER_ACP>} pHdr Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/msctf/ns-msctf-tf_persistent_property_header_acp">TF_PERSISTENT_PROPERTY_HEADER_ACP</a> structure that contains the header data for the property.
     * @param {IStream} pStream Pointer to an <b>IStream</b> object that contains the property data. This parameter can be <b>NULL</b> if <i>pLoader</i> is not <b>NULL</b>. This parameter is ignored if <i>pLoader</i> is not <b>NULL</b>.
     * @param {ITfPersistentPropertyLoaderACP} pLoader Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfpersistentpropertyloaderacp">ITfPersistentPropertyLoaderACP</a> object that the TSF manager will use to obtain the property data. This parameter can be <b>NULL</b> if <i>pStream</i> is not <b>NULL</b>.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method was successful.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TF_S_ASYNC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The property data will be obtained asynchronously.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TF_E_SYNCHRONOUS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A synchronous read-only lock cannot be obtained.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unspecified error occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itextstoreacpservices-unserialize
     */
    Unserialize(pProp, pHdr, pStream, pLoader) {
        result := ComCall(4, this, "ptr", pProp, "ptr", pHdr, "ptr", pStream, "ptr", pLoader, "HRESULT")
        return result
    }

    /**
     * ITextStoreACPServices::ForceLoadProperty method
     * @param {ITfProperty} pProp Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfproperty">ITfProperty</a> object that specifies the property to load.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method was successful.
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
     * A memory allocation error occurred.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unspecified error occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itextstoreacpservices-forceloadproperty
     */
    ForceLoadProperty(pProp) {
        result := ComCall(5, this, "ptr", pProp, "HRESULT")
        return result
    }

    /**
     * ITextStoreACPServices::CreateRange method
     * @param {Integer} acpStart Contains the starting position of the range.
     * @param {Integer} acpEnd Contains the ending position of the range.
     * @returns {ITfRangeACP} Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfrangeacp">ITfRangeACP</a> interface pointer that receives the range object.
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itextstoreacpservices-createrange
     */
    CreateRange(acpStart, acpEnd) {
        result := ComCall(6, this, "int", acpStart, "int", acpEnd, "ptr*", &ppRange := 0, "HRESULT")
        return ITfRangeACP(ppRange)
    }
}
