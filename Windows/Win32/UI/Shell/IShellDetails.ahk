#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include Common\SHELLDETAILS.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposed by Shell folders to provide detailed information about the items in a folder.
 * @remarks
 * 
 * For Windows 2000 and later systems, folder objects should implement <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellfolder2">IShellFolder2</a> instead of this interface. However, if your application needs to function on earlier systems, <b>IShellDetails</b> should also be exposed.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//shlobj_core/nn-shlobj_core-ishelldetails
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IShellDetails extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IShellDetails
     * @type {Guid}
     */
    static IID => Guid("{000214ec-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDetailsOf", "ColumnClick"]

    /**
     * 
     * @param {Pointer<ITEMIDLIST>} pidl 
     * @param {Integer} iColumn 
     * @returns {SHELLDETAILS} 
     * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-ishelldetails-getdetailsof
     */
    GetDetailsOf(pidl, iColumn) {
        pDetails := SHELLDETAILS()
        result := ComCall(3, this, "ptr", pidl, "uint", iColumn, "ptr", pDetails, "HRESULT")
        return pDetails
    }

    /**
     * 
     * @param {Integer} iColumn 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-ishelldetails-columnclick
     */
    ColumnClick(iColumn) {
        result := ComCall(4, this, "uint", iColumn, "HRESULT")
        return result
    }
}
