#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IPhotoAcquireSource.ahk" { IPhotoAcquireSource }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\System\Com\IEnumString.ahk" { IEnumString }
#Import ".\IPhotoAcquireProgressCB.ahk" { IPhotoAcquireProgressCB }

/**
 * The IPhotoAcquire interface provides methods for acquiring photos from a device.
 * @see https://learn.microsoft.com/windows/win32/api/photoacquire/nn-photoacquire-iphotoacquire
 * @namespace Windows.Win32.Media.PictureAcquisition
 */
export default struct IPhotoAcquire extends IUnknown {
    /**
     * The interface identifier for IPhotoAcquire
     * @type {Guid}
     */
    static IID := Guid("{00f23353-e31b-4955-a8ad-ca5ebf31e2ce}")

    /**
     * The class identifier for PhotoAcquire
     * @type {Guid}
     */
    static CLSID := Guid("{00f26e02-e9f2-4a9f-9fdd-5a962fb26a98}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPhotoAcquire interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        CreatePhotoSource : IntPtr
        Acquire           : IntPtr
        EnumResults       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPhotoAcquire.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The CreatePhotoSource method initializes an IPhotoAcquireSource object to pass to IPhotoAcquire::Acquire.
     * @remarks
     * The <a href="https://docs.microsoft.com/windows/desktop/api/photoacquire/nn-photoacquire-iphotoacquiresource">IPhotoAcquireSource</a> object created is used as the parameter for the <a href="https://docs.microsoft.com/windows/desktop/api/photoacquire/nf-photoacquire-iphotoacquire-acquire">Acquire</a> method.
     * 
     * If an error occurs in <c>CreatePhotoSource</c>, <i>ppPhotoAcquireSource</i> is initialized to <b>NULL</b>.
     * @param {PWSTR} pszDevice Pointer to a null-terminated string containing the device name.
     * @returns {IPhotoAcquireSource} Returns the initialized photo source to acquire photos from.
     * @see https://learn.microsoft.com/windows/win32/api/photoacquire/nf-photoacquire-iphotoacquire-createphotosource
     */
    CreatePhotoSource(pszDevice) {
        pszDevice := pszDevice is String ? StrPtr(pszDevice) : pszDevice

        result := ComCall(3, this, "ptr", pszDevice, "ptr*", &ppPhotoAcquireSource := 0, "HRESULT")
        return IPhotoAcquireSource(ppPhotoAcquireSource)
    }

    /**
     * The Acquire method acquires photos from a device.
     * @remarks
     * To initialize the <i>pPhotoAcquireSource</i> parameter passed to <c>Acquire</code>, <a href="https://docs.microsoft.com/windows/desktop/api/photoacquire/nf-photoacquire-iphotoacquire-createphotosource">CreatePhotoSource</a> should be called prior to calling <code>Acquire</c>.
     * 
     * <i>pPhotoAcquireProgressCB</i> provides callback methods that allow you to apply further filtering or control as items are acquired.
     * 
     * To verify that there are items in the device before acquisition, or to selectively acquire items from the device, call <a href="https://docs.microsoft.com/windows/desktop/api/photoacquire/nf-photoacquire-iphotoacquiresource-initializeitemlist">IPhotoAcquireSource::InitializeItemList</a> to enumerate the items before calling <c>Acquire</c>.
     * @param {IPhotoAcquireSource} pPhotoAcquireSource Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/photoacquire/nn-photoacquire-iphotoacquiresource">IPhotoAcquireSource</a> object representing the device from which to acquire photos. Initialize this object by calling <a href="https://docs.microsoft.com/windows/desktop/api/photoacquire/nf-photoacquire-iphotoacquire-createphotosource">CreatePhotoSource</a>.
     * @param {BOOL} fShowProgress Flag that, when set to <b>TRUE</b>, indicates that a progress dialog will be shown.
     * @param {HWND} hWndParent Handle to a parent window.
     * @param {PWSTR} pszApplicationName Pointer to a null-terminated string containing the application name.
     * @param {IPhotoAcquireProgressCB} pPhotoAcquireProgressCB Pointer to an optional <a href="https://docs.microsoft.com/windows/desktop/api/photoacquire/nn-photoacquire-iphotoacquireprogresscb">IPhotoAcquireProgressCB</a> object.
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
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Non-<b>NULL</b> pointer was expected.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/photoacquire/nf-photoacquire-iphotoacquire-acquire
     */
    Acquire(pPhotoAcquireSource, fShowProgress, hWndParent, pszApplicationName, pPhotoAcquireProgressCB) {
        pszApplicationName := pszApplicationName is String ? StrPtr(pszApplicationName) : pszApplicationName

        result := ComCall(4, this, "ptr", pPhotoAcquireSource, BOOL, fShowProgress, HWND, hWndParent, "ptr", pszApplicationName, "ptr", pPhotoAcquireProgressCB, "HRESULT")
        return result
    }

    /**
     * The EnumResults method retrieves an enumeration containing the paths of all files successfully transferred during the most recent call to Acquire.
     * @remarks
     * If the file transfer is aborted before any files are transferred, <i>ppEnumFilePaths</i> will be set to <b>NULL</b>.
     * @returns {IEnumString} Returns an enumeration containing the paths to all the transferred files.
     * @see https://learn.microsoft.com/windows/win32/api/photoacquire/nf-photoacquire-iphotoacquire-enumresults
     */
    EnumResults() {
        result := ComCall(5, this, "ptr*", &ppEnumFilePaths := 0, "HRESULT")
        return IEnumString(ppEnumFilePaths)
    }

    Query(iid) {
        if (IPhotoAcquire.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreatePhotoSource := CallbackCreate(GetMethod(implObj, "CreatePhotoSource"), flags, 3)
        this.vtbl.Acquire := CallbackCreate(GetMethod(implObj, "Acquire"), flags, 6)
        this.vtbl.EnumResults := CallbackCreate(GetMethod(implObj, "EnumResults"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreatePhotoSource)
        CallbackFree(this.vtbl.Acquire)
        CallbackFree(this.vtbl.EnumResults)
    }
}
