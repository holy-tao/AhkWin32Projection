#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Foundation\RECT.ahk" { RECT }
#Import "..\..\..\System\WinRT\IInspectable.ahk" { IInspectable }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Represents a XAML Diagnostics session.
 * @see https://learn.microsoft.com/windows/win32/api/xamlom/nn-xamlom-ixamldiagnostics
 * @namespace Windows.Win32.UI.Xaml.Diagnostics
 */
export default struct IXamlDiagnostics extends IUnknown {
    /**
     * The interface identifier for IXamlDiagnostics
     * @type {Guid}
     */
    static IID := Guid("{18c9e2b6-3f43-4116-9f2b-ff935d7770d2}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IXamlDiagnostics interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetDispatcher             : IntPtr
        GetUiLayer                : IntPtr
        GetApplication            : IntPtr
        GetIInspectableFromHandle : IntPtr
        GetHandleFromIInspectable : IntPtr
        HitTest                   : IntPtr
        RegisterInstance          : IntPtr
        GetInitializationData     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IXamlDiagnostics.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the core dispatcher used to access elements on the UI thread.
     * @returns {IInspectable} The core dispatcher.
     * @see https://learn.microsoft.com/windows/win32/api/xamlom/nf-xamlom-ixamldiagnostics-getdispatcher
     */
    GetDispatcher() {
        result := ComCall(3, this, "ptr*", &ppDispatcher := 0, "HRESULT")
        return IInspectable(ppDispatcher)
    }

    /**
     * Gets the visual diagnostics root that can be used to draw on for highlighting elements in the tree.
     * @returns {IInspectable} The visual diagnostics root.
     * @see https://learn.microsoft.com/windows/win32/api/xamlom/nf-xamlom-ixamldiagnostics-getuilayer
     */
    GetUiLayer() {
        result := ComCall(4, this, "ptr*", &ppLayer := 0, "HRESULT")
        return IInspectable(ppLayer)
    }

    /**
     * Gets an instance of the application.
     * @returns {IInspectable} The application.
     * @see https://learn.microsoft.com/windows/win32/api/xamlom/nf-xamlom-ixamldiagnostics-getapplication
     */
    GetApplication() {
        result := ComCall(5, this, "ptr*", &ppApplication := 0, "HRESULT")
        return IInspectable(ppApplication)
    }

    /**
     * Gets the IInspectable from the XAML Diagnostics cache.
     * @remarks
     * This method will fail if XAML Diagnostics no longer has a reference to
     *     the element.
     * @param {Integer} instanceHandle A handle to the object.
     * @returns {IInspectable} The object as an <a href="https://docs.microsoft.com/windows/desktop/api/inspectable/nn-inspectable-iinspectable">IInspectable</a>.
     * @see https://learn.microsoft.com/windows/win32/api/xamlom/nf-xamlom-ixamldiagnostics-getiinspectablefromhandle
     */
    GetIInspectableFromHandle(instanceHandle) {
        result := ComCall(6, this, "uint", instanceHandle, "ptr*", &ppInstance := 0, "HRESULT")
        return IInspectable(ppInstance)
    }

    /**
     * Gets an InstanceHandle representation of an IInspectable.
     * @param {IInspectable} pInstance An instance of the object as an <a href="https://docs.microsoft.com/windows/desktop/api/inspectable/nn-inspectable-iinspectable">IInspectable</a>.
     * @returns {Integer} A handle to the object.
     * @see https://learn.microsoft.com/windows/win32/api/xamlom/nf-xamlom-ixamldiagnostics-gethandlefromiinspectable
     */
    GetHandleFromIInspectable(pInstance) {
        result := ComCall(7, this, "ptr", pInstance, "uint*", &pHandle := 0, "HRESULT")
        return pHandle
    }

    /**
     * Gets all elements in the visual tree that fall within the specified rectangle.
     * @remarks
     * This method performs a hit test on the XAML visual tree and will return all elements
     *     regardless if they are enabled or invisible for hit testing. This method does not return collapsed elements as they do not participate in layout. <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/xamlom/nf-xamlom-ivisualtreeservice-advisevisualtreechange">AdviseVisualTreeChange</a> must be called before this method. The element does not need to be fully enclosed in the 
     *     <i>rect</i> area to be returned.
     * @param {RECT} _rect The area to hit test.
     * @param {Pointer<Integer>} pCount The size of the array.
     * @param {Pointer<Pointer<Integer>>} ppInstanceHandles An array containing all elements.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/xamlom/nf-xamlom-ixamldiagnostics-hittest
     */
    HitTest(_rect, pCount, ppInstanceHandles) {
        pCountMarshal := pCount is VarRef ? "uint*" : "ptr"
        ppInstanceHandlesMarshal := ppInstanceHandles is VarRef ? "ptr*" : "ptr"

        result := ComCall(8, this, RECT, _rect, pCountMarshal, pCount, ppInstanceHandlesMarshal, ppInstanceHandles, "HRESULT")
        return result
    }

    /**
     * Adds an IInspectable to the XAML Diagnostics cache and returns the newly created InstanceHandle for the object.
     * @param {IInspectable} pInstance An instance of the object.
     * @returns {Integer} A handle to the object.
     * @see https://learn.microsoft.com/windows/win32/api/xamlom/nf-xamlom-ixamldiagnostics-registerinstance
     */
    RegisterInstance(pInstance) {
        result := ComCall(9, this, "ptr", pInstance, "uint*", &pInstanceHandle := 0, "HRESULT")
        return pInstanceHandle
    }

    /**
     * Gets the initialization data passed in to XAML Diagnostics.
     * @returns {BSTR} The initialization data.
     * @see https://learn.microsoft.com/windows/win32/api/xamlom/nf-xamlom-ixamldiagnostics-getinitializationdata
     */
    GetInitializationData() {
        pInitializationData := BSTR.Owned()
        result := ComCall(10, this, BSTR.Ptr, pInitializationData, "HRESULT")
        return pInitializationData
    }

    Query(iid) {
        if (IXamlDiagnostics.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetDispatcher := CallbackCreate(GetMethod(implObj, "GetDispatcher"), flags, 2)
        this.vtbl.GetUiLayer := CallbackCreate(GetMethod(implObj, "GetUiLayer"), flags, 2)
        this.vtbl.GetApplication := CallbackCreate(GetMethod(implObj, "GetApplication"), flags, 2)
        this.vtbl.GetIInspectableFromHandle := CallbackCreate(GetMethod(implObj, "GetIInspectableFromHandle"), flags, 3)
        this.vtbl.GetHandleFromIInspectable := CallbackCreate(GetMethod(implObj, "GetHandleFromIInspectable"), flags, 3)
        this.vtbl.HitTest := CallbackCreate(GetMethod(implObj, "HitTest"), flags, 4)
        this.vtbl.RegisterInstance := CallbackCreate(GetMethod(implObj, "RegisterInstance"), flags, 3)
        this.vtbl.GetInitializationData := CallbackCreate(GetMethod(implObj, "GetInitializationData"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetDispatcher)
        CallbackFree(this.vtbl.GetUiLayer)
        CallbackFree(this.vtbl.GetApplication)
        CallbackFree(this.vtbl.GetIInspectableFromHandle)
        CallbackFree(this.vtbl.GetHandleFromIInspectable)
        CallbackFree(this.vtbl.HitTest)
        CallbackFree(this.vtbl.RegisterInstance)
        CallbackFree(this.vtbl.GetInitializationData)
    }
}
