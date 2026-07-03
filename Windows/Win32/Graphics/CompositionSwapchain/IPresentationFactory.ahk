#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IPresentationManager.ahk" { IPresentationManager }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * This interface is used to query system support for presentation, and create a presentation manager.
 * @see https://learn.microsoft.com/windows/win32/api/presentation/nn-presentation-ipresentationfactory
 * @namespace Windows.Win32.Graphics.CompositionSwapchain
 */
export default struct IPresentationFactory extends IUnknown {
    /**
     * The interface identifier for IPresentationFactory
     * @type {Guid}
     */
    static IID := Guid("{8fb37b58-1d74-4f64-a49c-1f97a80a2ec0}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPresentationFactory interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        IsPresentationSupported                    : IntPtr
        IsPresentationSupportedWithIndependentFlip : IntPtr
        CreatePresentationManager                  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPresentationFactory.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets a value that indicates whether presentation of any sort (with or without independent flip) is supported on the backing D3D device.
     * @returns {Integer} Type: **[BOOLEAN](/windows/win32/winprog/windows-data-types)**
     * 
     * `TRUE` if presentation is supported; otherwise, `FALSE`.
     * @see https://learn.microsoft.com/windows/win32/api/presentation/nf-presentation-ipresentationfactory-ispresentationsupported
     */
    IsPresentationSupported() {
        result := ComCall(3, this, Int8)
        return result
    }

    /**
     * Gets a value that indicates whether independent-flip-enabled presentation is supported on the backing D3D device.
     * @returns {Integer} Type: **[BOOLEAN](/windows/win32/winprog/windows-data-types)**
     * 
     * `TRUE` if independent-flip-enabled presentation is supported; otherwise, `FALSE`.
     * @see https://learn.microsoft.com/windows/win32/api/presentation/nf-presentation-ipresentationfactory-ispresentationsupportedwithindependentflip
     */
    IsPresentationSupportedWithIndependentFlip() {
        result := ComCall(4, this, Int8)
        return result
    }

    /**
     * Creates a presentation manager.
     * @returns {IPresentationManager} Type: **[IPresentationManager](nn-presentation-ipresentationmanager.md) \*\***
     * 
     * The address of a pointer to the created presentation manager.
     * @see https://learn.microsoft.com/windows/win32/api/presentation/nf-presentation-ipresentationfactory-createpresentationmanager
     */
    CreatePresentationManager() {
        result := ComCall(5, this, "ptr*", &ppPresentationManager := 0, "HRESULT")
        return IPresentationManager(ppPresentationManager)
    }

    Query(iid) {
        if (IPresentationFactory.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.IsPresentationSupported := CallbackCreate(GetMethod(implObj, "IsPresentationSupported"), flags, 1)
        this.vtbl.IsPresentationSupportedWithIndependentFlip := CallbackCreate(GetMethod(implObj, "IsPresentationSupportedWithIndependentFlip"), flags, 1)
        this.vtbl.CreatePresentationManager := CallbackCreate(GetMethod(implObj, "CreatePresentationManager"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.IsPresentationSupported)
        CallbackFree(this.vtbl.IsPresentationSupportedWithIndependentFlip)
        CallbackFree(this.vtbl.CreatePresentationManager)
    }
}
