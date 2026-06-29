#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\DSOP_INIT_INFO.ahk" { DSOP_INIT_INFO }
#Import "..\..\System\Com\IDataObject.ahk" { IDataObject }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IDsObjectPicker interface is used by an application to initialize and display an object picker dialog box. To create an instance of this interface, call CoCreateInstance with the CLSID_DsObjectPicker class identifier as shown below.
 * @remarks
 * It is acceptable to create and initialize a single instance of the <b>IDsObjectPicker</b> interface and then make multiple 
 * calls to <a href="https://docs.microsoft.com/windows/desktop/api/objsel/nf-objsel-idsobjectpicker-invokedialog">InvokeDialog</a> without having to reinitializing the interface.
 * @see https://learn.microsoft.com/windows/win32/api/objsel/nn-objsel-idsobjectpicker
 * @namespace Windows.Win32.Networking.ActiveDirectory
 */
export default struct IDsObjectPicker extends IUnknown {
    /**
     * The interface identifier for IDsObjectPicker
     * @type {Guid}
     */
    static IID := Guid("{0c87e64e-3b7a-11d2-b9e0-00c04fd8dbf7}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDsObjectPicker interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Initialize   : IntPtr
        InvokeDialog : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDsObjectPicker.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The IDsObjectPicker::Initialize method initializes the object picker dialog box with data about the scopes, filters, and options used by the object picker dialog box.
     * @remarks
     * <b>IDsObjectPicker::Initialize</b> can be called more than once and the last call takes precedence. The <a href="https://docs.microsoft.com/windows/desktop/api/objsel/nn-objsel-idsobjectpicker">IDsObjectPicker</a> object will completely re-initialize itself in response  to this method.
     * @param {Pointer<DSOP_INIT_INFO>} pInitInfo Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objsel/ns-objsel-dsop_init_info">DSOP_INIT_INFO</a> structure that contains the initialization data.
     * @returns {HRESULT} Returns a standard error code or one of the following values.
     * @see https://learn.microsoft.com/windows/win32/api/objsel/nf-objsel-idsobjectpicker-initialize
     */
    Initialize(pInitInfo) {
        result := ComCall(3, this, DSOP_INIT_INFO.Ptr, pInitInfo, "HRESULT")
        return result
    }

    /**
     * Displays a modal object picker dialog box and returns the user selections.
     * @remarks
     * Before <b>IDsObjectPicker::InvokeDialog</b> is called, the <a href="https://docs.microsoft.com/windows/desktop/api/objsel/nn-objsel-idsobjectpicker">IDsObjectPicker</a> object must be initialized by calling <a href="https://docs.microsoft.com/windows/desktop/api/objsel/nf-objsel-idsobjectpicker-initialize">IDsObjectPicker::Initialize</a>. After the <b>IDsObjectPicker</b> object is initialized, <b>InvokeDialog</b> can be called multiple times without reinitializing the interface.
     * @param {HWND} hwndParent Handle to the owner window of the dialog box. This parameter cannot be <b>NULL</b> or the result of the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getdesktopwindow">GetDesktopWindow</a> function.
     * @returns {IDataObject} Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-idataobject">IDataObject</a> interface pointer that receives a data object that contains data about the user selections. This data is supplied in the <a href="https://docs.microsoft.com/windows/desktop/AD/cfstr-dsop-ds-selection-list">CFSTR_DSOP_DS_SELECTION_LIST</a> data format. This parameter receives <b>NULL</b> if the user cancels the dialog box.
     * @see https://learn.microsoft.com/windows/win32/api/objsel/nf-objsel-idsobjectpicker-invokedialog
     */
    InvokeDialog(hwndParent) {
        result := ComCall(4, this, HWND, hwndParent, "ptr*", &ppdoSelections := 0, "HRESULT")
        return IDataObject(ppdoSelections)
    }

    Query(iid) {
        if (IDsObjectPicker.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Initialize := CallbackCreate(GetMethod(implObj, "Initialize"), flags, 2)
        this.vtbl.InvokeDialog := CallbackCreate(GetMethod(implObj, "InvokeDialog"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Initialize)
        CallbackFree(this.vtbl.InvokeDialog)
    }
}
