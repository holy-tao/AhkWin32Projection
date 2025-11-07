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
     * Initializes a thread to use Windows Runtime APIs.
     * @param {Pointer<DSOP_INIT_INFO>} pInitInfo 
     * @returns {HRESULT} <ul>
     * <li><b>S_OK</b> - Successfully initialized for the first time on the current thread</li>
     * <li><b>S_FALSE</b> - Successful nested initialization (current thread was already 
     *         initialized for the specified apartment type)</li>
     * <li><b>E_INVALIDARG</b> - Invalid <i>initType</i> value</li>
     * <li><b>CO_E_INIT_TLS</b> - Failed to allocate COM's internal TLS structure</li>
     * <li><b>E_OUTOFMEMORY</b> - Failed to allocate per-thread/per-apartment structures other 
     *         than the TLS</li>
     * <li><b>RPC_E_CHANGED_MODE</b> - The current thread is already initialized for a different 
     *         apartment type from what is specified.</li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//roapi/nf-roapi-initialize
     */
    Initialize(pInitInfo) {
        result := ComCall(3, this, "ptr", pInitInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HWND} hwndParent 
     * @returns {IDataObject} 
     * @see https://learn.microsoft.com/windows/win32/api/objsel/nf-objsel-idsobjectpicker-invokedialog
     */
    InvokeDialog(hwndParent) {
        hwndParent := hwndParent is Win32Handle ? NumGet(hwndParent, "ptr") : hwndParent

        result := ComCall(4, this, "ptr", hwndParent, "ptr*", &ppdoSelections := 0, "HRESULT")
        return IDataObject(ppdoSelections)
    }
}
