#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\Gdi\DEVMODEA.ahk" { DEVMODEA }
#Import ".\PRINTER_HANDLE.ahk" { PRINTER_HANDLE }
#Import "..\..\Foundation\RECTL.ahk" { RECTL }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct IPrintOemUIMXDC extends IUnknown {
    /**
     * The interface identifier for IPrintOemUIMXDC
     * @type {Guid}
     */
    static IID := Guid("{7349d725-e2c1-4dca-afb5-c13e91bc9306}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPrintOemUIMXDC interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        AdjustImageableArea    : IntPtr
        AdjustImageCompression : IntPtr
        AdjustDPI              : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPrintOemUIMXDC.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {PRINTER_HANDLE} hPrinter 
     * @param {Integer} cbDevMode 
     * @param {Pointer<DEVMODEA>} pDevMode 
     * @param {Integer} cbOEMDM 
     * @param {Pointer<Void>} pOEMDM 
     * @param {Pointer<RECTL>} prclImageableArea 
     * @returns {HRESULT} 
     */
    AdjustImageableArea(hPrinter, cbDevMode, pDevMode, cbOEMDM, pOEMDM, prclImageableArea) {
        pOEMDMMarshal := pOEMDM is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, PRINTER_HANDLE, hPrinter, "uint", cbDevMode, DEVMODEA.Ptr, pDevMode, "uint", cbOEMDM, pOEMDMMarshal, pOEMDM, RECTL.Ptr, prclImageableArea, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PRINTER_HANDLE} hPrinter 
     * @param {Integer} cbDevMode 
     * @param {Pointer<DEVMODEA>} pDevMode 
     * @param {Integer} cbOEMDM 
     * @param {Pointer<Void>} pOEMDM 
     * @param {Pointer<Integer>} pCompressionMode 
     * @returns {HRESULT} 
     */
    AdjustImageCompression(hPrinter, cbDevMode, pDevMode, cbOEMDM, pOEMDM, pCompressionMode) {
        pOEMDMMarshal := pOEMDM is VarRef ? "ptr" : "ptr"
        pCompressionModeMarshal := pCompressionMode is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, PRINTER_HANDLE, hPrinter, "uint", cbDevMode, DEVMODEA.Ptr, pDevMode, "uint", cbOEMDM, pOEMDMMarshal, pOEMDM, pCompressionModeMarshal, pCompressionMode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PRINTER_HANDLE} hPrinter 
     * @param {Integer} cbDevMode 
     * @param {Pointer<DEVMODEA>} pDevMode 
     * @param {Integer} cbOEMDM 
     * @param {Pointer<Void>} pOEMDM 
     * @param {Pointer<Integer>} pDPI 
     * @returns {HRESULT} 
     */
    AdjustDPI(hPrinter, cbDevMode, pDevMode, cbOEMDM, pOEMDM, pDPI) {
        pOEMDMMarshal := pOEMDM is VarRef ? "ptr" : "ptr"
        pDPIMarshal := pDPI is VarRef ? "int*" : "ptr"

        result := ComCall(5, this, PRINTER_HANDLE, hPrinter, "uint", cbDevMode, DEVMODEA.Ptr, pDevMode, "uint", cbOEMDM, pOEMDMMarshal, pOEMDM, pDPIMarshal, pDPI, "HRESULT")
        return result
    }

    Query(iid) {
        if (IPrintOemUIMXDC.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.AdjustImageableArea := CallbackCreate(GetMethod(implObj, "AdjustImageableArea"), flags, 7)
        this.vtbl.AdjustImageCompression := CallbackCreate(GetMethod(implObj, "AdjustImageCompression"), flags, 7)
        this.vtbl.AdjustDPI := CallbackCreate(GetMethod(implObj, "AdjustDPI"), flags, 7)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.AdjustImageableArea)
        CallbackFree(this.vtbl.AdjustImageCompression)
        CallbackFree(this.vtbl.AdjustDPI)
    }
}
