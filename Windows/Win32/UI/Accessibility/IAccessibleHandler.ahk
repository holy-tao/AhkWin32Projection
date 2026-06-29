#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IAccessible.ahk" { IAccessible }

/**
 * Exposes a method that retrieves an accessible element from an object ID.
 * @see https://learn.microsoft.com/windows/win32/api/oleacc/nn-oleacc-iaccessiblehandler
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct IAccessibleHandler extends IUnknown {
    /**
     * The interface identifier for IAccessibleHandler
     * @type {Guid}
     */
    static IID := Guid("{03022430-abc4-11d0-bde2-00aa001a1953}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAccessibleHandler interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        AccessibleObjectFromID : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAccessibleHandler.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The AccessibleObjectFromID method retrieves an IAccessibleinterface pointer for the interface associated with the given object ID. Oleacc.dll uses this method to obtain an IAccessible interface pointer for proxies that are supplied by other code.
     * @remarks
     * Oleacc calls this function to obtain an <a href="https://docs.microsoft.com/windows/desktop/api/oleacc/nn-oleacc-iaccessible">IAccessible</a> interface pointer for <b>HWND</b>s that have the class name that this handler is registered for.
     * 
     * At startup, Oleacc looks in the registry key HKLM\SOFTWARE\Microsoft\Active Accessibility\Handlers and enumerates over each subkey (Oleacc expects the subkey to be a GUID). Oleacc reads the associated class name from HKCR\CLSID\{guid}\AccClassName, where {guid} was the GUID found under the HKLM\SOFTWARE\Microsoft\Active Accessibility\Handlers key. When Oleacc finds a window with a class name that matches the GUID, it CoCreates the object using the GUID, retrieves the <a href="https://docs.microsoft.com/windows/desktop/api/oleacc/nn-oleacc-iaccessiblehandler">IAccessibleHandler</a> interface pointer, and calls <b>AccessibleObjectFromID</b> on it to get at <a href="https://docs.microsoft.com/windows/desktop/api/oleacc/nn-oleacc-iaccessible">IAccessible</a> interface pointer.
     * 
     * As with other <a href="https://docs.microsoft.com/windows/desktop/api/oleacc/nn-oleacc-iaccessible">IAccessible</a> methods and functions, clients might receive errors for <b>IAccessible</b> interface pointers because of a user action. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WinAuto/receiving-errors-for-iaccessible-interface-pointers">Receiving Errors for IAccessible Interface Pointers</a>.
     * @param {Integer} _hwnd Type: <b>long</b>
     * 
     * Specifies the handle of a window for which an <a href="https://docs.microsoft.com/windows/desktop/api/oleacc/nn-oleacc-iaccessible">IAccessible</a> interface pointer is to be retrieved.
     * @param {Integer} lObjectID Type: <b>long</b>
     * 
     * Specifies the object ID. This value is one of the standard <a href="https://docs.microsoft.com/windows/desktop/WinAuto/object-identifiers">object identifier</a> constants or a custom object ID.
     * @returns {IAccessible} Type: <b>LPACCESSIBLE*</b>
     * 
     * Specifies the address of a pointer variable that receives the address of the object's <a href="https://docs.microsoft.com/windows/desktop/api/oleacc/nn-oleacc-iaccessible">IAccessible</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/oleacc/nf-oleacc-iaccessiblehandler-accessibleobjectfromid
     */
    AccessibleObjectFromID(_hwnd, lObjectID) {
        result := ComCall(3, this, "int", _hwnd, "int", lObjectID, "ptr*", &pIAccessible := 0, "HRESULT")
        return IAccessible(pIAccessible)
    }

    Query(iid) {
        if (IAccessibleHandler.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.AccessibleObjectFromID := CallbackCreate(GetMethod(implObj, "AccessibleObjectFromID"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.AccessibleObjectFromID)
    }
}
