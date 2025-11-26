#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\TF_PERSISTENT_PROPERTY_HEADER_ACP.ahk
#Include .\ITfRangeACP.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ITfContextOwnerServices interface is implemented by the manager and used by a text service or application acting as context owners.
 * @see https://docs.microsoft.com/windows/win32/api//msctf/nn-msctf-itfcontextownerservices
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfContextOwnerServices extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITfContextOwnerServices
     * @type {Guid}
     */
    static IID => Guid("{b23eb630-3e1c-11d3-a745-0050040ab407}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnLayoutChange", "OnStatusChange", "OnAttributeChange", "Serialize", "Unserialize", "ForceLoadProperty", "CreateRange"]

    /**
     * The ITfContextOwnerServices::OnLayoutChange method is called by the context owner when the on-screen representation of the text stream is updated during a composition.
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
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfcontextownerservices-onlayoutchange
     */
    OnLayoutChange() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * The ITfContextOwnerServices::OnStatusChange method is called by the context owner when the dwDynamicFlags member of the TS_STATUS structure returned by the ITfContextOwner::GetStatus method changes.
     * @param {Integer} dwFlags Specifies the dynamic status flag.
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
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfcontextownerservices-onstatuschange
     */
    OnStatusChange(dwFlags) {
        result := ComCall(4, this, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * ITfContextOwnerServices::OnAttributeChange method
     * @param {Pointer<Guid>} rguidAttribute Specifies the GUID of the support attribute.
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
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfcontextownerservices-onattributechange
     */
    OnAttributeChange(rguidAttribute) {
        result := ComCall(5, this, "ptr", rguidAttribute, "HRESULT")
        return result
    }

    /**
     * The ITfContextOwnerServices::Serialize method obtains a property from a range of text and writes the property data into a stream object. This enables an application to store property data, for example, when writing the data to a file.
     * @param {ITfProperty} pProp Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfproperty">ITfProperty</a> interface that identifies the property to serialize.
     * @param {ITfRange} pRange Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfrange">ITfRange</a> interface that identifies the range that the property is obtained from.
     * @param {IStream} pStream Pointer to an <b>IStream</b> object that the TSF manager will write the property data to.
     * @returns {TF_PERSISTENT_PROPERTY_HEADER_ACP} Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/msctf/ns-msctf-tf_persistent_property_header_acp">TF_PERSISTENT_PROPERTY_HEADER_ACP</a> structure that receives the header data for the property.
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfcontextownerservices-serialize
     */
    Serialize(pProp, pRange, pStream) {
        pHdr := TF_PERSISTENT_PROPERTY_HEADER_ACP()
        result := ComCall(6, this, "ptr", pProp, "ptr", pRange, "ptr", pHdr, "ptr", pStream, "HRESULT")
        return pHdr
    }

    /**
     * ITfContextOwnerServices::Unserialize method
     * @param {ITfProperty} pProp Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfproperty">ITfProperty</a> object that receives the property data.
     * @param {Pointer<TF_PERSISTENT_PROPERTY_HEADER_ACP>} pHdr Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/msctf/ns-msctf-tf_persistent_property_header_acp">TF_PERSISTENT_PROPERTY_HEADER_ACP</a> structure that contains the header data for the property.
     * @param {IStream} pStream Pointer to an <b>IStream</b> object that contains the property data. This parameter can be <b>NULL</b> if <i>pLoader</i> is not <b>NULL</b>. This parameter is ignored if <i>pLoader</i> is not <b>NULL</b>.
     * @param {ITfPersistentPropertyLoaderACP} pLoader Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfpersistentpropertyloaderacp">ITfPersistentPropertyLoaderACP</a> object that the TSF manager uses to obtain the property data. This parameter can be <b>NULL</b> if <i>pStream</i> is not <b>NULL</b>.
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
     * The property data is obtained asynchronously.
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
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfcontextownerservices-unserialize
     */
    Unserialize(pProp, pHdr, pStream, pLoader) {
        result := ComCall(7, this, "ptr", pProp, "ptr", pHdr, "ptr", pStream, "ptr", pLoader, "HRESULT")
        return result
    }

    /**
     * ITfContextOwnerServices::ForceLoadProperty method
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
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfcontextownerservices-forceloadproperty
     */
    ForceLoadProperty(pProp) {
        result := ComCall(8, this, "ptr", pProp, "HRESULT")
        return result
    }

    /**
     * The ITfContextOwnerServices::CreateRange method creates a new ranged based upon a specified character position.
     * @param {Integer} acpStart Specifies the starting character position of the range.
     * @param {Integer} acpEnd Specifies the ending character position of the range.
     * @returns {ITfRangeACP} Receives a pointer to the range object within the specified starting and ending character positions.
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfcontextownerservices-createrange
     */
    CreateRange(acpStart, acpEnd) {
        result := ComCall(9, this, "int", acpStart, "int", acpEnd, "ptr*", &ppRange := 0, "HRESULT")
        return ITfRangeACP(ppRange)
    }
}
