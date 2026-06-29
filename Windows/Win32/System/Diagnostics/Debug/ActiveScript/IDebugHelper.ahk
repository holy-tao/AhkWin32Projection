#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IDebugApplicationThread.ahk" { IDebugApplicationThread }
#Import "..\..\..\Variant\VARIANT.ahk" { VARIANT }
#Import "..\IDebugProperty.ahk" { IDebugProperty }
#Import "..\..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\..\Com\IUnknown.ahk" { IUnknown }
#Import ".\IDebugFormatter.ahk" { IDebugFormatter }
#Import ".\ISimpleConnectionPoint.ahk" { ISimpleConnectionPoint }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 */
export default struct IDebugHelper extends IUnknown {
    /**
     * The interface identifier for IDebugHelper
     * @type {Guid}
     */
    static IID := Guid("{51973c3f-cb0c-11d0-b5c9-00a0244a0e7a}")

    /**
     * The class identifier for DebugHelper
     * @type {Guid}
     */
    static CLSID := Guid("{0bfcc060-8c1d-11d0-accd-00aa0060275c}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDebugHelper interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        CreatePropertyBrowser       : IntPtr
        CreatePropertyBrowserEx     : IntPtr
        CreateSimpleConnectionPoint : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDebugHelper.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvar 
     * @param {PWSTR} bstrName 
     * @param {IDebugApplicationThread} pdat 
     * @returns {IDebugProperty} 
     */
    CreatePropertyBrowser(pvar, bstrName, pdat) {
        bstrName := bstrName is String ? StrPtr(bstrName) : bstrName

        result := ComCall(3, this, VARIANT.Ptr, pvar, "ptr", bstrName, "ptr", pdat, "ptr*", &ppdob := 0, "HRESULT")
        return IDebugProperty(ppdob)
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvar 
     * @param {PWSTR} bstrName 
     * @param {IDebugApplicationThread} pdat 
     * @param {IDebugFormatter} pdf 
     * @returns {IDebugProperty} 
     */
    CreatePropertyBrowserEx(pvar, bstrName, pdat, pdf) {
        bstrName := bstrName is String ? StrPtr(bstrName) : bstrName

        result := ComCall(4, this, VARIANT.Ptr, pvar, "ptr", bstrName, "ptr", pdat, "ptr", pdf, "ptr*", &ppdob := 0, "HRESULT")
        return IDebugProperty(ppdob)
    }

    /**
     * 
     * @param {IDispatch} pdisp 
     * @returns {ISimpleConnectionPoint} 
     */
    CreateSimpleConnectionPoint(pdisp) {
        result := ComCall(5, this, "ptr", pdisp, "ptr*", &ppscp := 0, "HRESULT")
        return ISimpleConnectionPoint(ppscp)
    }

    Query(iid) {
        if (IDebugHelper.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreatePropertyBrowser := CallbackCreate(GetMethod(implObj, "CreatePropertyBrowser"), flags, 5)
        this.vtbl.CreatePropertyBrowserEx := CallbackCreate(GetMethod(implObj, "CreatePropertyBrowserEx"), flags, 6)
        this.vtbl.CreateSimpleConnectionPoint := CallbackCreate(GetMethod(implObj, "CreateSimpleConnectionPoint"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreatePropertyBrowser)
        CallbackFree(this.vtbl.CreatePropertyBrowserEx)
        CallbackFree(this.vtbl.CreateSimpleConnectionPoint)
    }
}
