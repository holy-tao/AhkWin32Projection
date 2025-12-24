#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDataObject.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IDsObjectPicker interface is used by an application to initialize and display an object picker dialog box. To create an instance of this interface, call CoCreateInstance with the CLSID_DsObjectPicker class identifier as shown below.
 * @remarks
 * 
 * It is acceptable to create and initialize a single instance of the <b>IDsObjectPicker</b> interface and then make multiple 
 * calls to <a href="https://docs.microsoft.com/windows/desktop/api/objsel/nf-objsel-idsobjectpicker-invokedialog">InvokeDialog</a> without having to reinitializing the interface.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//objsel/nn-objsel-idsobjectpicker
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class IDsObjectPicker extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDsObjectPicker
     * @type {Guid}
     */
    static IID => Guid("{0c87e64e-3b7a-11d2-b9e0-00c04fd8dbf7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize", "InvokeDialog"]

    /**
     * The IDsObjectPicker::Initialize method initializes the object picker dialog box with data about the scopes, filters, and options used by the object picker dialog box.
     * @param {Pointer<DSOP_INIT_INFO>} pInitInfo Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objsel/ns-objsel-dsop_init_info">DSOP_INIT_INFO</a> structure that contains the initialization data.
     * @returns {HRESULT} Returns a standard error code or one of the following values.
     * @see https://docs.microsoft.com/windows/win32/api//objsel/nf-objsel-idsobjectpicker-initialize
     */
    Initialize(pInitInfo) {
        result := ComCall(3, this, "ptr", pInitInfo, "HRESULT")
        return result
    }

    /**
     * Displays a modal object picker dialog box and returns the user selections.
     * @param {HWND} hwndParent Handle to the owner window of the dialog box. This parameter cannot be <b>NULL</b> or the result of the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getdesktopwindow">GetDesktopWindow</a> function.
     * @returns {IDataObject} Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-idataobject">IDataObject</a> interface pointer that receives a data object that contains data about the user selections. This data is supplied in the <a href="https://docs.microsoft.com/windows/desktop/AD/cfstr-dsop-ds-selection-list">CFSTR_DSOP_DS_SELECTION_LIST</a> data format. This parameter receives <b>NULL</b> if the user cancels the dialog box.
     * @see https://docs.microsoft.com/windows/win32/api//objsel/nf-objsel-idsobjectpicker-invokedialog
     */
    InvokeDialog(hwndParent) {
        hwndParent := hwndParent is Win32Handle ? NumGet(hwndParent, "ptr") : hwndParent

        result := ComCall(4, this, "ptr", hwndParent, "ptr*", &ppdoSelections := 0, "HRESULT")
        return IDataObject(ppdoSelections)
    }
}
