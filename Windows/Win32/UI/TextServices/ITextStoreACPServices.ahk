#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\TF_PERSISTENT_PROPERTY_HEADER_ACP.ahk" { TF_PERSISTENT_PROPERTY_HEADER_ACP }
#Import "..\..\System\Com\IStream.ahk" { IStream }
#Import ".\ITfPersistentPropertyLoaderACP.ahk" { ITfPersistentPropertyLoaderACP }
#Import ".\ITfRange.ahk" { ITfRange }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ITfRangeACP.ahk" { ITfRangeACP }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\ITfProperty.ahk" { ITfProperty }

/**
 * The ITextStoreACPServices interface is implemented by the TSF manager to provide various services to an ACP-based application.
 * @see https://learn.microsoft.com/windows/win32/api/msctf/nn-msctf-itextstoreacpservices
 * @namespace Windows.Win32.UI.TextServices
 */
export default struct ITextStoreACPServices extends IUnknown {
    /**
     * The interface identifier for ITextStoreACPServices
     * @type {Guid}
     */
    static IID := Guid("{aa80e901-2021-11d2-93e0-0060b067b86e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITextStoreACPServices interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Serialize         : IntPtr
        Unserialize       : IntPtr
        ForceLoadProperty : IntPtr
        CreateRange       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITextStoreACPServices.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * ITextStoreACPServices::Serialize method
     * @remarks
     * The property header data placed in <i>pHdr</i> is generic to all properties and must be preserved with the data written into <i>pStream</i>. This same data pair must be passed to <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itextstoreacpservices-unserialize">ITextStoreACPServices::Unserialize</a> to restore the property data.
     * 
     * An application can save all of the properties for the entire document by performing the following steps.
     * 
     * <ul>
     * <li>Enumerate all properties using <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfcontext-enumproperties">ITfContext::EnumProperties</a>.</li>
     * <li>Within each property, enumerate the ranges using <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfreadonlyproperty-enumranges">ITfReadOnlyProperty::EnumRanges</a>.</li>
     * <li>Pass the current property and range to <b>ITextStoreACPServices::Serialize</b>.</li>
     * <li>Write the data placed in <i>pHdr</i> to the file.</li>
     * <li>Write the data added to <i>pStream</i> to the file.</li>
     * </ul>
     * When calling this method, the application must be able to grant a synchronous read-only lock.
     * @param {ITfProperty} pProp Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfproperty">ITfProperty</a> interface that identifies the property to serialize.
     * @param {ITfRange} pRange Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfrange">ITfRange</a> interface that identifies the range that the property is obtained from.
     * @param {IStream} pStream Pointer to an <b>IStream</b> object that the TSF manager will write the property data to.
     * @returns {TF_PERSISTENT_PROPERTY_HEADER_ACP} Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/msctf/ns-msctf-tf_persistent_property_header_acp">TF_PERSISTENT_PROPERTY_HEADER_ACP</a> structure that receives the header data for the property.
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itextstoreacpservices-serialize
     */
    Serialize(pProp, pRange, pStream) {
        pHdr := TF_PERSISTENT_PROPERTY_HEADER_ACP()
        result := ComCall(3, this, "ptr", pProp, "ptr", pRange, TF_PERSISTENT_PROPERTY_HEADER_ACP.Ptr, pHdr, "ptr", pStream, "HRESULT")
        return pHdr
    }

    /**
     * ITextStoreACPServices::Unserialize method
     * @remarks
     * If <i>pStream</i> is specified rather than <i>pLoader</i>, the property data will be read from <i>pStream</i> during the call to <b>Unserialize</b> . If <i>pLoader</i> is specified rather than <i>pStream</i>, the property data will be read from <i>pLoader</i> asynchronously. Using <i>pStream</i> can cause long delays if the property data is large.
     * 
     * While calling this method, the application must be able to grant a synchronous read-only lock.
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
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itextstoreacpservices-unserialize
     */
    Unserialize(pProp, pHdr, pStream, pLoader) {
        result := ComCall(4, this, "ptr", pProp, TF_PERSISTENT_PROPERTY_HEADER_ACP.Ptr, pHdr, "ptr", pStream, "ptr", pLoader, "HRESULT")
        return result
    }

    /**
     * ITextStoreACPServices::ForceLoadProperty method
     * @remarks
     * When calling this method, the application must be able to grant a synchronous read-only lock.
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
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itextstoreacpservices-forceloadproperty
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
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itextstoreacpservices-createrange
     */
    CreateRange(acpStart, acpEnd) {
        result := ComCall(6, this, "int", acpStart, "int", acpEnd, "ptr*", &ppRange := 0, "HRESULT")
        return ITfRangeACP(ppRange)
    }

    Query(iid) {
        if (ITextStoreACPServices.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Serialize := CallbackCreate(GetMethod(implObj, "Serialize"), flags, 5)
        this.vtbl.Unserialize := CallbackCreate(GetMethod(implObj, "Unserialize"), flags, 5)
        this.vtbl.ForceLoadProperty := CallbackCreate(GetMethod(implObj, "ForceLoadProperty"), flags, 2)
        this.vtbl.CreateRange := CallbackCreate(GetMethod(implObj, "CreateRange"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Serialize)
        CallbackFree(this.vtbl.Unserialize)
        CallbackFree(this.vtbl.ForceLoadProperty)
        CallbackFree(this.vtbl.CreateRange)
    }
}
