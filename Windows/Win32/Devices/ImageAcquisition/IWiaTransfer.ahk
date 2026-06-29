#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IEnumWIA_FORMAT_INFO.ahk" { IEnumWIA_FORMAT_INFO }
#Import "..\..\System\Com\IStream.ahk" { IStream }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IWiaTransferCallback.ahk" { IWiaTransferCallback }

/**
 * The IWiaTransfer interface provides stream-based transfer of data.
 * @remarks
 * The **IWiaTransfer** interface inherits from the [**IUnknown**](/windows/win32/api/unknwn/nn-unknwn-iunknown) interface. **IWiaTransfer** also has these types of members:
 * 
 * -   [Methods](#methods)
 * 
 * 
 * The **IWiaTransfer** interface, like all Component Object Model (COM) interfaces, inherits the [IUnknown](/windows/win32/api/unknwn/nn-unknwn-iunknown) interface methods.
 * 
 * 
 * 
 * | IUnknown Methods                                        | Description                               |
 * |---------------------------------------------------------|-------------------------------------------|
 * | [IUnknown::QueryInterface](/windows/win32/api/unknwn/nf-unknwn-iunknown-queryinterface(q)) | Returns pointers to supported interfaces. |
 * | [IUnknown::AddRef](/windows/win32/api/unknwn/nf-unknwn-iunknown-addref)                 | Increments reference count.               |
 * | [IUnknown::Release](/windows/win32/api/unknwn/nf-unknwn-iunknown-release)               | Decrements reference count.               |
 * @see https://learn.microsoft.com/windows/win32/wia/-wia-iwiatransfer
 * @namespace Windows.Win32.Devices.ImageAcquisition
 */
export default struct IWiaTransfer extends IUnknown {
    /**
     * The interface identifier for IWiaTransfer
     * @type {Guid}
     */
    static IID := Guid("{c39d6942-2f4e-4d04-92fe-4ef4d3a1de5a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWiaTransfer interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Download            : IntPtr
        Upload              : IntPtr
        Cancel              : IntPtr
        EnumWIA_FORMAT_INFO : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWiaTransfer.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Initiates a data download to the caller.
     * @remarks
     * If a folder is downloaded, then all the child items of that folder are also transferred. Each item is transferred in a separate stream.
     * @param {Integer} lFlags Type: **LONG**
     * 
     * Currently unused. Should be set to zero.
     * @param {IWiaTransferCallback} pIWiaTransferCallback Type: **[**IWiaTransferCallback**](-wia-iwiatransfercallback.md)\***
     * 
     * Specifies a pointer to the caller's [**IWiaTransferCallback**](-wia-iwiatransfercallback.md) interface.
     * @returns {HRESULT} Type: **HRESULT**
     * 
     * If this method succeeds, it returns **S\_OK**. Otherwise, it returns an **HRESULT** error code.
     * @see https://learn.microsoft.com/windows/win32/wia/-wia-iwiatransfer-download
     */
    Download(lFlags, pIWiaTransferCallback) {
        result := ComCall(3, this, "int", lFlags, "ptr", pIWiaTransferCallback, "HRESULT")
        return result
    }

    /**
     * Initiates a data upload of a single item from the caller.
     * @param {Integer} lFlags Type: **LONG**
     * 
     * Currently unused. Should be set to zero.
     * @param {IStream} pSource Type: **[IStream](/windows/win32/api/objidl/nn-objidl-istream)\***
     * 
     * Specifies a pointer to the [IStream](/windows/win32/api/objidl/nn-objidl-istream) data.
     * @param {IWiaTransferCallback} pIWiaTransferCallback Type: **[**IWiaTransferCallback**](-wia-iwiatransfercallback.md)\***
     * 
     * Specifies a pointer to the caller's [**IWiaTransferCallback**](-wia-iwiatransfercallback.md) interface.
     * @returns {HRESULT} Type: **HRESULT**
     * 
     * If this method succeeds, it returns **S\_OK**. Otherwise, it returns an **HRESULT** error code.
     * @see https://learn.microsoft.com/windows/win32/wia/-wia-iwiatransfer-upload
     */
    Upload(lFlags, pSource, pIWiaTransferCallback) {
        result := ComCall(4, this, "int", lFlags, "ptr", pSource, "ptr", pIWiaTransferCallback, "HRESULT")
        return result
    }

    /**
     * Cancels the current transfer operation.
     * @returns {HRESULT} This method has no parameters.
     * 
     * 
     * Type: **HRESULT**
     * 
     * If this method succeeds, it returns **S\_OK**. Otherwise, it returns an **HRESULT** error code.
     * @see https://learn.microsoft.com/windows/win32/wia/-wia-iwiatransfer-cancel
     */
    Cancel() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * Creates an enumerator for the transfer formats that the Windows Image Acquisition (WIA) 2.0 device supports.
     * @remarks
     * Applications must call the [IUnknown::Release](/windows/win32/api/unknwn/nf-unknwn-iunknown-release) method on the interface pointer received through the *ppIEnum* parameter.
     * @returns {IEnumWIA_FORMAT_INFO} 
     * @see https://learn.microsoft.com/windows/win32/wia/-wia-iwiatransfer-enumwia-format-info
     */
    EnumWIA_FORMAT_INFO() {
        result := ComCall(6, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumWIA_FORMAT_INFO(ppEnum)
    }

    Query(iid) {
        if (IWiaTransfer.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Download := CallbackCreate(GetMethod(implObj, "Download"), flags, 3)
        this.vtbl.Upload := CallbackCreate(GetMethod(implObj, "Upload"), flags, 4)
        this.vtbl.Cancel := CallbackCreate(GetMethod(implObj, "Cancel"), flags, 1)
        this.vtbl.EnumWIA_FORMAT_INFO := CallbackCreate(GetMethod(implObj, "EnumWIA_FORMAT_INFO"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Download)
        CallbackFree(this.vtbl.Upload)
        CallbackFree(this.vtbl.Cancel)
        CallbackFree(this.vtbl.EnumWIA_FORMAT_INFO)
    }
}
