#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\VisualElementState.ahk" { VisualElementState }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IVisualTreeServiceCallback.ahk" { IVisualTreeServiceCallback }

/**
 * Represents additional capabilities of an IVisualTreeServiceCallback object.
 * @see https://learn.microsoft.com/windows/win32/api/xamlom/nn-xamlom-ivisualtreeservicecallback2
 * @namespace Windows.Win32.UI.Xaml.Diagnostics
 */
export default struct IVisualTreeServiceCallback2 extends IVisualTreeServiceCallback {
    /**
     * The interface identifier for IVisualTreeServiceCallback2
     * @type {Guid}
     */
    static IID := Guid("{bad9eb88-ae77-4397-b948-5fa2db0a19ea}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IVisualTreeServiceCallback2 interfaces
    */
    struct Vtbl extends IVisualTreeServiceCallback.Vtbl {
        OnElementStateChanged : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IVisualTreeServiceCallback2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Communicates the state of an element in the visual tree when it changes.
     * @remarks
     * When any XAML diagnostics API results in a resource reference becoming invalid, this callback will be notified of the invalid reference. An instance handle will be given that corresponds to an element in the tree, and a string representation of the path to the invalid reference. The grammar for the syntax is: PropertyName:Full.Dotted.TypeName[Indexer] and paths can be separated with a forward slash ("/") to be chained together.
     * @param {Integer} element The XAML element in the visual tree.
     * @param {VisualElementState} elementState The state of the element.
     * @param {PWSTR} _context The path to the element.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/xamlom/nf-xamlom-ivisualtreeservicecallback2-onelementstatechanged
     */
    OnElementStateChanged(element, elementState, _context) {
        _context := _context is String ? StrPtr(_context) : _context

        result := ComCall(4, this, "uint", element, VisualElementState, elementState, "ptr", _context, "HRESULT")
        return result
    }

    Query(iid) {
        if (IVisualTreeServiceCallback2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnElementStateChanged := CallbackCreate(GetMethod(implObj, "OnElementStateChanged"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnElementStateChanged)
    }
}
