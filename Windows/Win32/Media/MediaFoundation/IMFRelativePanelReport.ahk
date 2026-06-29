#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * This interface is used to retrieve the current relative panel location for a display region.
 * @remarks
 * Use the methods of the [IMFRelativePanelWatcher](nn-mfidl-imfrelativepanelwatcher.md) interface to get an instance of this interface.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nn-mfidl-imfrelativepanelreport
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFRelativePanelReport extends IUnknown {
    /**
     * The interface identifier for IMFRelativePanelReport
     * @type {Guid}
     */
    static IID := Guid("{f25362ea-2c0e-447f-81e2-755914cdc0c3}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFRelativePanelReport interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetRelativePanel : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFRelativePanelReport.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets a value from the ACPI_PLD_PANEL enumeration indicating the location of the capture device.
     * @returns {Integer} Receives a pointer to a **ULONG** value from the **ACPI_PLD_PANEL** enumeration.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfrelativepanelreport-getrelativepanel
     */
    GetRelativePanel() {
        result := ComCall(3, this, "uint*", &panel := 0, "HRESULT")
        return panel
    }

    Query(iid) {
        if (IMFRelativePanelReport.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetRelativePanel := CallbackCreate(GetMethod(implObj, "GetRelativePanel"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetRelativePanel)
    }
}
