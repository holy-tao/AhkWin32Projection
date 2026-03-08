#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * IParseAndCreateItem interface
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-iparseandcreateitem
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IParseAndCreateItem extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IParseAndCreateItem
     * @type {Guid}
     */
    static IID => Guid("{67efed0e-e827-4408-b493-78f3982b685c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetItem", "GetItem"]

    /**
     * IParseAndCreateItem::SetItem method
     * @param {IShellItem} psi Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>*</b>
     * 
     * Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a> object.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iparseandcreateitem-setitem
     */
    SetItem(psi) {
        result := ComCall(3, this, "ptr", psi, "HRESULT")
        return result
    }

    /**
     * IParseAndCreateItem::GetItem method
     * @remarks
     * We recommend that you use the <b>IID_PPV_ARGS</b> macro, defined in Objbase.h, to package the <i>riid</i> and <i>ppv</i> parameters. This macro provides the correct IID based on the interface pointed to by the value in <i>ppv</i>, which eliminates the possibility of a coding error in <i>riid</i> that could lead to unexpected results.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * A reference to the IID of the interface to retrieve through <i>ppv</i>, typically IID_IShellItem.
     * @returns {Pointer<Void>} Type: <b>void**</b>
     * 
     * When this method returns successfully, contains the interface pointer requested in <i>riid</i>. This is typically <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iparseandcreateitem-getitem
     */
    GetItem(riid) {
        result := ComCall(4, this, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }
}
