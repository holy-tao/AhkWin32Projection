#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\CHARRANGE.ahk" { CHARRANGE }
#Import "..\..\..\System\Ole\IOleClientSite.ahk" { IOleClientSite }
#Import "..\..\..\System\Com\IDataObject.ahk" { IDataObject }
#Import ".\RICH_EDIT_GET_OBJECT_FLAGS.ahk" { RICH_EDIT_GET_OBJECT_FLAGS }
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\..\Foundation\HGLOBAL.ahk" { HGLOBAL }
#Import "..\..\..\Foundation\PSTR.ahk" { PSTR }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\..\System\Com\StructuredStorage\IStorage.ahk" { IStorage }
#Import ".\REOBJECT.ahk" { REOBJECT }

/**
 * The IRichEditOle interface exposes the Component Object Model (COM) functionality of a rich edit control. The interface can be obtained by sending the EM_GETOLEINTERFACE message. This interface has the following methods.
 * @see https://learn.microsoft.com/windows/win32/api/richole/nn-richole-iricheditole
 * @namespace Windows.Win32.UI.Controls.RichEdit
 */
export default struct IRichEditOle extends IUnknown {
    /**
     * The interface identifier for IRichEditOle
     * @type {Guid}
     */
    static IID := Guid("{00020d00-0000-0000-c000-000000000046}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRichEditOle interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetClientSite        : IntPtr
        GetObjectCount       : IntPtr
        GetLinkCount         : IntPtr
        GetObject            : IntPtr
        InsertObject         : IntPtr
        ConvertObject        : IntPtr
        ActivateAs           : IntPtr
        SetHostNames         : IntPtr
        SetLinkAvailable     : IntPtr
        SetDvaspect          : IntPtr
        HandsOffStorage      : IntPtr
        SaveCompleted        : IntPtr
        InPlaceDeactivate    : IntPtr
        ContextSensitiveHelp : IntPtr
        GetClipboardData     : IntPtr
        ImportDataObject     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRichEditOle.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves an IOleClientSite interface to be used when creating a new object. All objects inserted into a rich edit control must use client site interfaces returned by this function. A client site may be used with exactly one object.
     * @returns {IOleClientSite} Type: <b>LPOLECLIENTSITE*</b>
     * 
     * The address of the <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nn-oleidl-ioleclientsite">IOleClientSite</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/richole/nf-richole-iricheditole-getclientsite
     */
    GetClientSite() {
        result := ComCall(3, this, "ptr*", &lplpolesite := 0, "HRESULT")
        return IOleClientSite(lplpolesite)
    }

    /**
     * Returns the number of objects currently contained in a rich edit control.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LONG</a></b>
     * 
     * This method returns the number of objects.
     * @see https://learn.microsoft.com/windows/win32/api/richole/nf-richole-iricheditole-getobjectcount
     */
    GetObjectCount() {
        result := ComCall(4, this, Int32)
        return result
    }

    /**
     * Returns the number of objects in a rich edit control that are links.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LONG</a></b>
     * 
     * This method returns the number of links.
     * @see https://learn.microsoft.com/windows/win32/api/richole/nf-richole-iricheditole-getlinkcount
     */
    GetLinkCount() {
        result := ComCall(5, this, Int32)
        return result
    }

    /**
     * Retrieves information, stored in a REOBJECT structure, about an object in a rich edit control.
     * @param {Integer} iob Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LONG</a></b>
     * 
     * Zero-based index that specifies which object to return information about. If this parameter is <b>REO_IOB_USE_CP</b>, information about the object at the character position specified by the <a href="https://docs.microsoft.com/windows/desktop/api/richole/ns-richole-reobject">REOBJECT</a> structure is returned.
     * @param {Pointer<REOBJECT>} lpreobject Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/richole/ns-richole-reobject">REOBJECT</a>*</b>
     * 
     * Structure that receives information about the object. The reference count of the interfaces returned in this structure has been incremented; it is the responsibility of the caller to use the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a> method to decrement the count.
     * @param {RICH_EDIT_GET_OBJECT_FLAGS} dwFlags Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * Returns <b>S_OK</b> if successful, or an error value otherwise. <b>E_INVALIDARG</b> is returned if no buffer for the <a href="https://docs.microsoft.com/windows/desktop/api/richole/ns-richole-reobject">REOBJECT</a> structure was given or if the <i>iob</i> value or character position is invalid.
     * @see https://learn.microsoft.com/windows/win32/api/richole/nf-richole-iricheditole-getobject
     */
    GetObject(iob, lpreobject, dwFlags) {
        result := ComCall(6, this, "int", iob, REOBJECT.Ptr, lpreobject, RICH_EDIT_GET_OBJECT_FLAGS, dwFlags, "HRESULT")
        return result
    }

    /**
     * Inserts an object into a rich edit control.
     * @remarks
     * If the <b>cp</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/richole/ns-richole-reobject">REOBJECT</a> structure is REO_CP_SELECTION, the selection is replaced with the specified object.
     * @param {Pointer<REOBJECT>} lpreobject Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/richole/ns-richole-reobject">REOBJECT</a>*</b>
     * 
     * The object information and interfaces. The rich edit control automatically increments the reference count for the interfaces if it holds onto them, so the caller can safely release the interfaces if they are not needed.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * Returns S_OK on success, or a failure code otherwise. E_OUTOFMEMORY is returned if memory could not be allocated to insert the object.
     * @see https://learn.microsoft.com/windows/win32/api/richole/nf-richole-iricheditole-insertobject
     */
    InsertObject(lpreobject) {
        result := ComCall(7, this, REOBJECT.Ptr, lpreobject, "HRESULT")
        return result
    }

    /**
     * Converts an object to a new type. This call reloads the object but does not force an update; the caller must do this.
     * @param {Integer} iob Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LONG</a></b>
     * 
     * Index of the object to convert. If this parameter is REO_IOB_SELECTION, the selected object is to be converted.
     * @param {Pointer<Guid>} rclsidNew Type: <b>REFCLSID</b>
     * 
     * Class identifier of the class to which the object is converted.
     * @param {PSTR} lpstrUserTypeNew Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCSTR</a></b>
     * 
     * User-visible type name of the class to which the object is converted.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * Returns S_OK on success, or a failure code otherwise. E_INVALIDARG is returned if the index is invalid.
     * @see https://learn.microsoft.com/windows/win32/api/richole/nf-richole-iricheditole-convertobject
     */
    ConvertObject(iob, rclsidNew, lpstrUserTypeNew) {
        lpstrUserTypeNew := lpstrUserTypeNew is String ? StrPtr(lpstrUserTypeNew) : lpstrUserTypeNew

        result := ComCall(8, this, "int", iob, Guid.Ptr, rclsidNew, "ptr", lpstrUserTypeNew, "HRESULT")
        return result
    }

    /**
     * Handles Activate As behavior by unloading all objects of the old class, telling OLE to treat those objects as objects of the new class, and reloading the objects. If objects cannot be reloaded, they are deleted.
     * @param {Pointer<Guid>} rclsid Type: <b>REFCLSID</b>
     * 
     * Class identifier of the old class.
     * @param {Pointer<Guid>} rclsidAs Type: <b>REFCLSID</b>
     * 
     * Class identifier of the new class.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * Returns S_OK on success, or a failure code otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/richole/nf-richole-iricheditole-activateas
     */
    ActivateAs(rclsid, rclsidAs) {
        result := ComCall(9, this, Guid.Ptr, rclsid, Guid.Ptr, rclsidAs, "HRESULT")
        return result
    }

    /**
     * Sets the host names to be given to objects as they are inserted to a rich edit control. The host names are used in the user interface of servers to describe the container context of opened objects.
     * @param {PSTR} lpstrContainerApp Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCSTR</a></b>
     * 
     * Null-terminated name of the container application.
     * @param {PSTR} lpstrContainerObj Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCSTR</a></b>
     * 
     * Null-terminated name of the container document or object.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * Returns S_OK on success, or a failure code otherwise. E_OUTOFMEMORY is returned if memory could not be allocated to remember the strings.
     * @see https://learn.microsoft.com/windows/win32/api/richole/nf-richole-iricheditole-sethostnames
     */
    SetHostNames(lpstrContainerApp, lpstrContainerObj) {
        lpstrContainerApp := lpstrContainerApp is String ? StrPtr(lpstrContainerApp) : lpstrContainerApp
        lpstrContainerObj := lpstrContainerObj is String ? StrPtr(lpstrContainerObj) : lpstrContainerObj

        result := ComCall(10, this, "ptr", lpstrContainerApp, "ptr", lpstrContainerObj, "HRESULT")
        return result
    }

    /**
     * Sets the value of the link-available bit in the object's flags.
     * @param {Integer} iob Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LONG</a></b>
     * 
     * Index of object whose bit is to be set. If this parameter is REO_IOB_SELECTION, the bit on the selected object is to be set.
     * @param {BOOL} fAvailable Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * Value used in the set operation. The value can be <b>TRUE</b> or <b>FALSE</b>.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * Returns S_OK on success, or a failure code otherwise. E_INVALIDARG is returned if the index is invalid.
     * @see https://learn.microsoft.com/windows/win32/api/richole/nf-richole-iricheditole-setlinkavailable
     */
    SetLinkAvailable(iob, fAvailable) {
        result := ComCall(11, this, "int", iob, BOOL, fAvailable, "HRESULT")
        return result
    }

    /**
     * Sets the aspect that a rich edit control uses to draw an object. This call does not change the drawing information cached in the object; this must be done by the caller. The call does cause the object to be redrawn.
     * @param {Integer} iob Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LONG</a></b>
     * 
     * Index of the object whose aspect is to be set. If this parameter is REO_IOB_SELECTION, the aspect of the selected object is to be set.
     * @param {Integer} _dvaspect Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Aspect to use when drawing. The values are defined by OLE.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * Returns S_OK on success, or a failure code otherwise. E_INVALIDARG is returned if the index is invalid.
     * @see https://learn.microsoft.com/windows/win32/api/richole/nf-richole-iricheditole-setdvaspect
     */
    SetDvaspect(iob, _dvaspect) {
        result := ComCall(12, this, "int", iob, "uint", _dvaspect, "HRESULT")
        return result
    }

    /**
     * Indicates when a rich edit control is to release its reference to the storage interface associated with the specified object. This call does not call the object's IRichEditOle::HandsOffStorage method; the caller must do that.
     * @param {Integer} iob Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LONG</a></b>
     * 
     * Index of the object whose storage is to be released. If this parameter is REO_IOB_SELECTION, the storage of the selected object is to be released.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * Returns S_OK on success, or a failure code otherwise. E_INVALIDARG is returned if the index is invalid.
     * @see https://learn.microsoft.com/windows/win32/api/richole/nf-richole-iricheditole-handsoffstorage
     */
    HandsOffStorage(iob) {
        result := ComCall(13, this, "int", iob, "HRESULT")
        return result
    }

    /**
     * Indicates when the most recent save operation has been completed and that the rich edit control should hold onto a different storage for the object.
     * @param {Integer} iob Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LONG</a></b>
     * 
     * Index of the object whose storage is being specified. If this parameter is REO_IOB_SELECTION, the selected object is used.
     * @param {IStorage} lpstg Type: <b>LPSTORAGE</b>
     * 
     * New storage for the object. If the storage is not <b>NULL</b>, the rich edit control releases any storage it is currently holding for the object and uses this new storage instead.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * Returns S_OK on success, or a failure code otherwise. E_INVALIDARG is returned if the index is invalid.
     * @see https://learn.microsoft.com/windows/win32/api/richole/nf-richole-iricheditole-savecompleted
     */
    SaveCompleted(iob, lpstg) {
        result := ComCall(14, this, "int", iob, "ptr", lpstg, "HRESULT")
        return result
    }

    /**
     * Indicates when a rich edit control is to deactivate the currently active in-place object, if any.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * Returns S_OK on success, or a failure code otherwise. If there is no active in-place object, the method succeeds.
     * @see https://learn.microsoft.com/windows/win32/api/richole/nf-richole-iricheditole-inplacedeactivate
     */
    InPlaceDeactivate() {
        result := ComCall(15, this, "HRESULT")
        return result
    }

    /**
     * Indicates if a rich edit control should transition into or out of context-sensitive help mode. A rich edit control calls the IRichEditOle::ContextSensitiveHelp method of any in-place object which is currently active if a state change is occurring.
     * @param {BOOL} fEnterMode Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * Indicator of whether the control is entering context-sensitive help mode (<b>TRUE</b>) or leaving it (<b>FALSE</b>).
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * Returns S_OK on success, or a failure code otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/richole/nf-richole-iricheditole-contextsensitivehelp
     */
    ContextSensitiveHelp(fEnterMode) {
        result := ComCall(16, this, BOOL, fEnterMode, "HRESULT")
        return result
    }

    /**
     * Retrieves a clipboard object for a range in an edit control.
     * @param {Pointer<CHARRANGE>} lpchrg Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-charrange">CHARRANGE</a>*</b>
     * 
     * The range for which to create the clipboard object.
     * @param {Integer} reco Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Unused.
     * @returns {IDataObject} Type: <b>LPDATAOBJECT*</b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-idataobject">IDataObject</a> interface of the clipboard object representing the range specified in the 
     * 					<i>lpchrg</i> parameter.
     * @see https://learn.microsoft.com/windows/win32/api/richole/nf-richole-iricheditole-getclipboarddata
     */
    GetClipboardData(lpchrg, reco) {
        result := ComCall(17, this, CHARRANGE.Ptr, lpchrg, "uint", reco, "ptr*", &lplpdataobj := 0, "HRESULT")
        return IDataObject(lplpdataobj)
    }

    /**
     * Imports a clipboard object into a rich edit control, replacing the current selection.
     * @param {IDataObject} lpdataobj Type: <b>LPDATAOBJECT</b>
     * 
     * The clipboard object to import.
     * @param {Integer} cf Type: <b>CLIPFORMAT</b>
     * 
     * Clipboard format to use. A value of zero will use the best available format.
     * @param {HGLOBAL} hMetaPict Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HGLOBAL</a></b>
     * 
     * Handle to a metafile containing the icon view of an object. The handle is used only if the <b>DVASPECT_ICON</b> display aspect is required by a <a href="https://docs.microsoft.com/windows/desktop/api/oledlg/nf-oledlg-oleuipastespeciala">Paste Special</a> operation.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * Returns <b>S_OK</b> on success. If the method fails, it can return one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There was an invalid argument.
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
     * There was not enough memory to do the operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/richole/nf-richole-iricheditole-importdataobject
     */
    ImportDataObject(lpdataobj, cf, hMetaPict) {
        result := ComCall(18, this, "ptr", lpdataobj, "ushort", cf, HGLOBAL, hMetaPict, "HRESULT")
        return result
    }

    Query(iid) {
        if (IRichEditOle.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetClientSite := CallbackCreate(GetMethod(implObj, "GetClientSite"), flags, 2)
        this.vtbl.GetObjectCount := CallbackCreate(GetMethod(implObj, "GetObjectCount"), flags, 1)
        this.vtbl.GetLinkCount := CallbackCreate(GetMethod(implObj, "GetLinkCount"), flags, 1)
        this.vtbl.GetObject := CallbackCreate(GetMethod(implObj, "GetObject"), flags, 4)
        this.vtbl.InsertObject := CallbackCreate(GetMethod(implObj, "InsertObject"), flags, 2)
        this.vtbl.ConvertObject := CallbackCreate(GetMethod(implObj, "ConvertObject"), flags, 4)
        this.vtbl.ActivateAs := CallbackCreate(GetMethod(implObj, "ActivateAs"), flags, 3)
        this.vtbl.SetHostNames := CallbackCreate(GetMethod(implObj, "SetHostNames"), flags, 3)
        this.vtbl.SetLinkAvailable := CallbackCreate(GetMethod(implObj, "SetLinkAvailable"), flags, 3)
        this.vtbl.SetDvaspect := CallbackCreate(GetMethod(implObj, "SetDvaspect"), flags, 3)
        this.vtbl.HandsOffStorage := CallbackCreate(GetMethod(implObj, "HandsOffStorage"), flags, 2)
        this.vtbl.SaveCompleted := CallbackCreate(GetMethod(implObj, "SaveCompleted"), flags, 3)
        this.vtbl.InPlaceDeactivate := CallbackCreate(GetMethod(implObj, "InPlaceDeactivate"), flags, 1)
        this.vtbl.ContextSensitiveHelp := CallbackCreate(GetMethod(implObj, "ContextSensitiveHelp"), flags, 2)
        this.vtbl.GetClipboardData := CallbackCreate(GetMethod(implObj, "GetClipboardData"), flags, 4)
        this.vtbl.ImportDataObject := CallbackCreate(GetMethod(implObj, "ImportDataObject"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetClientSite)
        CallbackFree(this.vtbl.GetObjectCount)
        CallbackFree(this.vtbl.GetLinkCount)
        CallbackFree(this.vtbl.GetObject)
        CallbackFree(this.vtbl.InsertObject)
        CallbackFree(this.vtbl.ConvertObject)
        CallbackFree(this.vtbl.ActivateAs)
        CallbackFree(this.vtbl.SetHostNames)
        CallbackFree(this.vtbl.SetLinkAvailable)
        CallbackFree(this.vtbl.SetDvaspect)
        CallbackFree(this.vtbl.HandsOffStorage)
        CallbackFree(this.vtbl.SaveCompleted)
        CallbackFree(this.vtbl.InPlaceDeactivate)
        CallbackFree(this.vtbl.ContextSensitiveHelp)
        CallbackFree(this.vtbl.GetClipboardData)
        CallbackFree(this.vtbl.ImportDataObject)
    }
}
