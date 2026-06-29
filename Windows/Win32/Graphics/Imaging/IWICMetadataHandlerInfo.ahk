#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\IWICComponentInfo.ahk" { IWICComponentInfo }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Exposes methods that provide basic information about the registered metadata handler.
 * @see https://learn.microsoft.com/windows/win32/api/wincodecsdk/nn-wincodecsdk-iwicmetadatahandlerinfo
 * @namespace Windows.Win32.Graphics.Imaging
 */
export default struct IWICMetadataHandlerInfo extends IWICComponentInfo {
    /**
     * The interface identifier for IWICMetadataHandlerInfo
     * @type {Guid}
     */
    static IID := Guid("{aba958bf-c672-44d1-8d61-ce6df2e682c2}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWICMetadataHandlerInfo interfaces
    */
    struct Vtbl extends IWICComponentInfo.Vtbl {
        GetMetadataFormat     : IntPtr
        GetContainerFormats   : IntPtr
        GetDeviceManufacturer : IntPtr
        GetDeviceModels       : IntPtr
        DoesRequireFullStream : IntPtr
        DoesSupportPadding    : IntPtr
        DoesRequireFixedSize  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWICMetadataHandlerInfo.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves the metadata format of the metadata handler.
     * @returns {Guid} Type: <b>GUID*</b>
     * 
     * Pointer that receives the metadata format GUID.
     * @see https://learn.microsoft.com/windows/win32/api/wincodecsdk/nf-wincodecsdk-iwicmetadatahandlerinfo-getmetadataformat
     */
    GetMetadataFormat() {
        pguidMetadataFormat := Guid()
        result := ComCall(11, this, Guid.Ptr, pguidMetadataFormat, "HRESULT")
        return pguidMetadataFormat
    }

    /**
     * Retrieves the container formats supported by the metadata handler.
     * @param {Integer} cContainerFormats Type: <b>UINT</b>
     * 
     * The size of the <i>pguidContainerFormats</i> array.
     * @param {Pointer<Guid>} pguidContainerFormats Type: <b>GUID*</b>
     * 
     * Pointer to an array that receives the container formats supported by the metadata handler.
     * @returns {Integer} Type: <b>UINT*</b>
     * 
     * The actual number of GUIDs added to the array.
     *                
     * 
     * To obtain the number of supported container formats, pass <c>NULL</c> to <i>pguidContainerFormats</i>.
     * @see https://learn.microsoft.com/windows/win32/api/wincodecsdk/nf-wincodecsdk-iwicmetadatahandlerinfo-getcontainerformats
     */
    GetContainerFormats(cContainerFormats, pguidContainerFormats) {
        result := ComCall(12, this, "uint", cContainerFormats, Guid.Ptr, pguidContainerFormats, "uint*", &pcchActual := 0, "HRESULT")
        return pcchActual
    }

    /**
     * Retrieves the device manufacturer of the metadata handler.
     * @param {Integer} cchDeviceManufacturer Type: <b>UINT</b>
     * 
     * The size of the <i>wzDeviceManufacturer</i> buffer.
     * @param {PWSTR} wzDeviceManufacturer Type: <b>WCHAR*</b>
     * 
     * Pointer to the buffer that receives the name of the device manufacturer.
     * @returns {Integer} Type: <b>UINT*</b>
     * 
     * The actual string buffer length needed to obtain the entire name of the device manufacturer.
     * @see https://learn.microsoft.com/windows/win32/api/wincodecsdk/nf-wincodecsdk-iwicmetadatahandlerinfo-getdevicemanufacturer
     */
    GetDeviceManufacturer(cchDeviceManufacturer, wzDeviceManufacturer) {
        wzDeviceManufacturer := wzDeviceManufacturer is String ? StrPtr(wzDeviceManufacturer) : wzDeviceManufacturer

        result := ComCall(13, this, "uint", cchDeviceManufacturer, "ptr", wzDeviceManufacturer, "uint*", &pcchActual := 0, "HRESULT")
        return pcchActual
    }

    /**
     * Retrieves the device models that support the metadata handler.
     * @param {Integer} cchDeviceModels Type: <b>UINT</b>
     * 
     * The length of the <i>wzDeviceModels</i> buffer.
     * @param {PWSTR} wzDeviceModels Type: <b>WCHAR*</b>
     * 
     * Pointer that receives the device models supported by the metadata handler.
     * @returns {Integer} Type: <b>UINT*</b>
     * 
     * The actual length needed to retrieve the device models.
     * @see https://learn.microsoft.com/windows/win32/api/wincodecsdk/nf-wincodecsdk-iwicmetadatahandlerinfo-getdevicemodels
     */
    GetDeviceModels(cchDeviceModels, wzDeviceModels) {
        wzDeviceModels := wzDeviceModels is String ? StrPtr(wzDeviceModels) : wzDeviceModels

        result := ComCall(14, this, "uint", cchDeviceModels, "ptr", wzDeviceModels, "uint*", &pcchActual := 0, "HRESULT")
        return pcchActual
    }

    /**
     * Determines if the handler requires a full stream.
     * @returns {BOOL} Type: <b>BOOL*</b>
     * 
     * Pointer that receives <b>TRUE</b> if a full stream is required; otherwise, <b>FALSE</b>.
     * @see https://learn.microsoft.com/windows/win32/api/wincodecsdk/nf-wincodecsdk-iwicmetadatahandlerinfo-doesrequirefullstream
     */
    DoesRequireFullStream() {
        result := ComCall(15, this, BOOL.Ptr, &pfRequiresFullStream := 0, "HRESULT")
        return pfRequiresFullStream
    }

    /**
     * Determines if the metadata handler supports padding.
     * @returns {BOOL} Type: <b>BOOL*</b>
     * 
     * Pointer that receives <b>TRUE</b> if padding is supported; otherwise, <b>FALSE</b>.
     * @see https://learn.microsoft.com/windows/win32/api/wincodecsdk/nf-wincodecsdk-iwicmetadatahandlerinfo-doessupportpadding
     */
    DoesSupportPadding() {
        result := ComCall(16, this, BOOL.Ptr, &pfSupportsPadding := 0, "HRESULT")
        return pfSupportsPadding
    }

    /**
     * Determines if the metadata handler requires a fixed size.
     * @returns {BOOL} Type: <b>BOOL*</b>
     * 
     * Pointer that receives <b>TRUE</b> if a fixed size is required; otherwise, <b>FALSE</b>.
     * @see https://learn.microsoft.com/windows/win32/api/wincodecsdk/nf-wincodecsdk-iwicmetadatahandlerinfo-doesrequirefixedsize
     */
    DoesRequireFixedSize() {
        result := ComCall(17, this, BOOL.Ptr, &pfFixedSize := 0, "HRESULT")
        return pfFixedSize
    }

    Query(iid) {
        if (IWICMetadataHandlerInfo.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetMetadataFormat := CallbackCreate(GetMethod(implObj, "GetMetadataFormat"), flags, 2)
        this.vtbl.GetContainerFormats := CallbackCreate(GetMethod(implObj, "GetContainerFormats"), flags, 4)
        this.vtbl.GetDeviceManufacturer := CallbackCreate(GetMethod(implObj, "GetDeviceManufacturer"), flags, 4)
        this.vtbl.GetDeviceModels := CallbackCreate(GetMethod(implObj, "GetDeviceModels"), flags, 4)
        this.vtbl.DoesRequireFullStream := CallbackCreate(GetMethod(implObj, "DoesRequireFullStream"), flags, 2)
        this.vtbl.DoesSupportPadding := CallbackCreate(GetMethod(implObj, "DoesSupportPadding"), flags, 2)
        this.vtbl.DoesRequireFixedSize := CallbackCreate(GetMethod(implObj, "DoesRequireFixedSize"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetMetadataFormat)
        CallbackFree(this.vtbl.GetContainerFormats)
        CallbackFree(this.vtbl.GetDeviceManufacturer)
        CallbackFree(this.vtbl.GetDeviceModels)
        CallbackFree(this.vtbl.DoesRequireFullStream)
        CallbackFree(this.vtbl.DoesSupportPadding)
        CallbackFree(this.vtbl.DoesRequireFixedSize)
    }
}
