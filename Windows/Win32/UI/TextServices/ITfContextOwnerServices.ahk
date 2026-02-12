#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\TF_PERSISTENT_PROPERTY_HEADER_ACP.ahk
#Include .\ITfRangeACP.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ITfContextOwnerServices interface is implemented by the manager and used by a text service or application acting as context owners.
 * @see https://learn.microsoft.com/windows/win32/api//content/msctf/nn-msctf-itfcontextownerservices
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
     * @remarks
     * A call to <b>ITfContextOwnerServices::OnLayoutChange</b> could be in response to a text edit, font size change, window movement/resizing, and so on.
     * 
     * If a call to <a href="https://docs.microsoft.com/windows/desktop/api/textstor/nf-textstor-itextstoreacp-gettextext">ITfContextView::GetTextExt</a> or <a href="https://docs.microsoft.com/windows/desktop/api/textstor/nf-textstor-itextstoreacp-getacpfrompoint">ITfContextOwner::GetACPFromPoint</a> fails because the application did not calculate the screen layout (Return Value: TS_E_NOLAYOUT), the application must then call <b>ITfContextOwnerServices::OnLayoutChange</b> when the information is ready.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/msctf/nf-msctf-itfcontextownerservices-onlayoutchange
     */
    OnLayoutChange() {
        result := ComCall(3, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/api//content/msctf/nf-msctf-itfcontextownerservices-onstatuschange
     */
    OnStatusChange(dwFlags) {
        result := ComCall(4, this, "uint", dwFlags, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * ITfContextOwnerServices::OnAttributeChange method
     * @remarks
     * A support attribute is a read-only property maintained by the context owner. The supported attributes are in the Tsattrs.h header file.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/msctf/nf-msctf-itfcontextownerservices-onattributechange
     */
    OnAttributeChange(rguidAttribute) {
        result := ComCall(5, this, "ptr", rguidAttribute, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The ITfContextOwnerServices::Serialize method obtains a property from a range of text and writes the property data into a stream object. This enables an application to store property data, for example, when writing the data to a file.
     * @remarks
     * The property header data placed in <i>pHdr</i> is common to all properties and must be preserved with the data written into <i>pStream</i>. This same data pair must be passed to <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itextstoreacpservices-unserialize">ITfContextOwnerServices::Unserialize</a> to restore the property data.
     * 
     * An application can save all of the properties for the entire document by performing the following steps.
     * 
     * <ul>
     * <li>Enumerate all properties using <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfcontext-enumproperties">ITfContext::EnumProperties</a>.</li>
     * <li>Within each property, enumerate the ranges using <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfreadonlyproperty-enumranges">ITfReadOnlyProperty::EnumRanges</a>.</li>
     * <li>Pass the current property and range to this method.</li>
     * <li>Write the data placed in <i>pHdr</i> to the file.</li>
     * <li>Write the data added to <i>pStream</i> to the file.</li>
     * </ul>
     * When calling this method, the application must be able to grant a synchronous read-only lock.
     * @param {ITfProperty} pProp Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfproperty">ITfProperty</a> interface that identifies the property to serialize.
     * @param {ITfRange} pRange Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfrange">ITfRange</a> interface that identifies the range that the property is obtained from.
     * @param {IStream} pStream Pointer to an <b>IStream</b> object that the TSF manager will write the property data to.
     * @returns {TF_PERSISTENT_PROPERTY_HEADER_ACP} Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/msctf/ns-msctf-tf_persistent_property_header_acp">TF_PERSISTENT_PROPERTY_HEADER_ACP</a> structure that receives the header data for the property.
     * @see https://learn.microsoft.com/windows/win32/api//content/msctf/nf-msctf-itfcontextownerservices-serialize
     */
    Serialize(pProp, pRange, pStream) {
        pHdr := TF_PERSISTENT_PROPERTY_HEADER_ACP()
        result := ComCall(6, this, "ptr", pProp, "ptr", pRange, "ptr", pHdr, "ptr", pStream, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pHdr
    }

    /**
     * ITfContextOwnerServices::Unserialize method
     * @remarks
     * If <i>pStream</i> is specified rather than <i>pLoader</i>, the property data is read from <i>pStream</i> during the call to this method. If <i>pLoader</i> is specified rather than <i>pStream</i>, the property data is read from <i>pLoader</i> asynchronously. Using <i>pStream</i> can cause long delays if the property data is large.
     * 
     * When calling this method, the application must be able to grant a synchronous read-only lock.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/msctf/nf-msctf-itfcontextownerservices-unserialize
     */
    Unserialize(pProp, pHdr, pStream, pLoader) {
        result := ComCall(7, this, "ptr", pProp, "ptr", pHdr, "ptr", pStream, "ptr", pLoader, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * ITfContextOwnerServices::ForceLoadProperty method
     * @remarks
     * The application must be able to grant a synchronous read-only lock before calling this method.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/msctf/nf-msctf-itfcontextownerservices-forceloadproperty
     */
    ForceLoadProperty(pProp) {
        result := ComCall(8, this, "ptr", pProp, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The ITfContextOwnerServices::CreateRange method creates a new ranged based upon a specified character position.
     * @param {Integer} acpStart Specifies the starting character position of the range.
     * @param {Integer} acpEnd Specifies the ending character position of the range.
     * @returns {ITfRangeACP} Receives a pointer to the range object within the specified starting and ending character positions.
     * @see https://learn.microsoft.com/windows/win32/api//content/msctf/nf-msctf-itfcontextownerservices-createrange
     */
    CreateRange(acpStart, acpEnd) {
        result := ComCall(9, this, "int", acpStart, "int", acpEnd, "ptr*", &ppRange := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ITfRangeACP(ppRange)
    }
}
