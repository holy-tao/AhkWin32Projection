#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IAccessible.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes a method that retrieves an accessible element from an object ID.
 * @see https://learn.microsoft.com/windows/win32/api//content/oleacc/nn-oleacc-iaccessiblehandler
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class IAccessibleHandler extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAccessibleHandler
     * @type {Guid}
     */
    static IID => Guid("{03022430-abc4-11d0-bde2-00aa001a1953}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AccessibleObjectFromID"]

    /**
     * The AccessibleObjectFromID method retrieves an IAccessibleinterface pointer for the interface associated with the given object ID. Oleacc.dll uses this method to obtain an IAccessible interface pointer for proxies that are supplied by other code.
     * @remarks
     * Oleacc calls this function to obtain an <a href="https://docs.microsoft.com/windows/desktop/api/oleacc/nn-oleacc-iaccessible">IAccessible</a> interface pointer for <b>HWND</b>s that have the class name that this handler is registered for.
     * 
     * At startup, Oleacc looks in the registry key HKLM\SOFTWARE\Microsoft\Active Accessibility\Handlers and enumerates over each subkey (Oleacc expects the subkey to be a GUID). Oleacc reads the associated class name from HKCR\CLSID\{guid}\AccClassName, where {guid} was the GUID found under the HKLM\SOFTWARE\Microsoft\Active Accessibility\Handlers key. When Oleacc finds a window with a class name that matches the GUID, it CoCreates the object using the GUID, retrieves the <a href="https://docs.microsoft.com/windows/desktop/api/oleacc/nn-oleacc-iaccessiblehandler">IAccessibleHandler</a> interface pointer, and calls <b>AccessibleObjectFromID</b> on it to get at <a href="https://docs.microsoft.com/windows/desktop/api/oleacc/nn-oleacc-iaccessible">IAccessible</a> interface pointer.
     * 
     * As with other <a href="https://docs.microsoft.com/windows/desktop/api/oleacc/nn-oleacc-iaccessible">IAccessible</a> methods and functions, clients might receive errors for <b>IAccessible</b> interface pointers because of a user action. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WinAuto/receiving-errors-for-iaccessible-interface-pointers">Receiving Errors for IAccessible Interface Pointers</a>.
     * @param {Integer} hwnd_ Type: <b>long</b>
     * 
     * Specifies the handle of a window for which an <a href="https://docs.microsoft.com/windows/desktop/api/oleacc/nn-oleacc-iaccessible">IAccessible</a> interface pointer is to be retrieved.
     * @param {Integer} lObjectID Type: <b>long</b>
     * 
     * Specifies the object ID. This value is one of the standard <a href="https://docs.microsoft.com/windows/desktop/WinAuto/object-identifiers">object identifier</a> constants or a custom object ID.
     * @returns {IAccessible} Type: <b>LPACCESSIBLE*</b>
     * 
     * Specifies the address of a pointer variable that receives the address of the object's <a href="https://docs.microsoft.com/windows/desktop/api/oleacc/nn-oleacc-iaccessible">IAccessible</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api//content/oleacc/nf-oleacc-iaccessiblehandler-accessibleobjectfromid
     */
    AccessibleObjectFromID(hwnd_, lObjectID) {
        result := ComCall(3, this, "int", hwnd_, "int", lObjectID, "ptr*", &pIAccessible := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAccessible(pIAccessible)
    }
}
