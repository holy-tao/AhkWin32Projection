#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct IPrintOemDriverUI extends IUnknown {
    /**
     * The interface identifier for IPrintOemDriverUI
     * @type {Guid}
     */
    static IID := Guid("{92b05d50-78bc-11d1-9480-00a0c90640b8}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPrintOemDriverUI interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        DrvGetDriverSetting       : IntPtr
        DrvUpgradeRegistrySetting : IntPtr
        DrvUpdateUISetting        : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPrintOemDriverUI.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<Void>} pci 
     * @param {PSTR} Feature 
     * @param {Pointer<Void>} pOutput 
     * @param {Integer} cbSize 
     * @param {Pointer<Integer>} pcbNeeded 
     * @param {Pointer<Integer>} pdwOptionsReturned 
     * @returns {HRESULT} 
     */
    DrvGetDriverSetting(pci, Feature, pOutput, cbSize, pcbNeeded, pdwOptionsReturned) {
        Feature := Feature is String ? StrPtr(Feature) : Feature

        pciMarshal := pci is VarRef ? "ptr" : "ptr"
        pOutputMarshal := pOutput is VarRef ? "ptr" : "ptr"
        pcbNeededMarshal := pcbNeeded is VarRef ? "uint*" : "ptr"
        pdwOptionsReturnedMarshal := pdwOptionsReturned is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, pciMarshal, pci, "ptr", Feature, pOutputMarshal, pOutput, "uint", cbSize, pcbNeededMarshal, pcbNeeded, pdwOptionsReturnedMarshal, pdwOptionsReturned, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HANDLE} hPrinter 
     * @param {PSTR} pFeature 
     * @param {PSTR} pOption 
     * @returns {HRESULT} 
     */
    DrvUpgradeRegistrySetting(hPrinter, pFeature, pOption) {
        pFeature := pFeature is String ? StrPtr(pFeature) : pFeature
        pOption := pOption is String ? StrPtr(pOption) : pOption

        result := ComCall(4, this, HANDLE, hPrinter, "ptr", pFeature, "ptr", pOption, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pci 
     * @param {Pointer<Void>} pOptItem 
     * @param {Integer} dwPreviousSelection 
     * @param {Integer} dwMode 
     * @returns {HRESULT} 
     */
    DrvUpdateUISetting(pci, pOptItem, dwPreviousSelection, dwMode) {
        pciMarshal := pci is VarRef ? "ptr" : "ptr"
        pOptItemMarshal := pOptItem is VarRef ? "ptr" : "ptr"

        result := ComCall(5, this, pciMarshal, pci, pOptItemMarshal, pOptItem, "uint", dwPreviousSelection, "uint", dwMode, "HRESULT")
        return result
    }

    Query(iid) {
        if (IPrintOemDriverUI.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.DrvGetDriverSetting := CallbackCreate(GetMethod(implObj, "DrvGetDriverSetting"), flags, 7)
        this.vtbl.DrvUpgradeRegistrySetting := CallbackCreate(GetMethod(implObj, "DrvUpgradeRegistrySetting"), flags, 4)
        this.vtbl.DrvUpdateUISetting := CallbackCreate(GetMethod(implObj, "DrvUpdateUISetting"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.DrvGetDriverSetting)
        CallbackFree(this.vtbl.DrvUpgradeRegistrySetting)
        CallbackFree(this.vtbl.DrvUpdateUISetting)
    }
}
