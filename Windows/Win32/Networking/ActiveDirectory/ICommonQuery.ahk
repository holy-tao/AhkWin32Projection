#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Used to programmatically display the system-supplied directory service query dialog box.
 * @see https://docs.microsoft.com/windows/win32/api//cmnquery/nn-cmnquery-icommonquery
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class ICommonQuery extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICommonQuery
     * @type {Guid}
     */
    static IID => Guid("{ab50dec0-6f1d-11d0-a1c4-00aa00c16e65}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OpenQueryWindow"]

    /**
     * 
     * @param {HWND} hwndParent 
     * @param {Pointer<OPENQUERYWINDOW>} pQueryWnd 
     * @param {Pointer<IDataObject>} ppDataObject 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/cmnquery/nf-cmnquery-icommonquery-openquerywindow
     */
    OpenQueryWindow(hwndParent, pQueryWnd, ppDataObject) {
        hwndParent := hwndParent is Win32Handle ? NumGet(hwndParent, "ptr") : hwndParent

        result := ComCall(3, this, "ptr", hwndParent, "ptr", pQueryWnd, "ptr*", ppDataObject, "HRESULT")
        return result
    }
}
