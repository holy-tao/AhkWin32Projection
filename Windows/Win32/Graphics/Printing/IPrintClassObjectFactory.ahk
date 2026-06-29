#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct IPrintClassObjectFactory extends IUnknown {
    /**
     * The interface identifier for IPrintClassObjectFactory
     * @type {Guid}
     */
    static IID := Guid("{9af593dd-9b02-48a8-9bad-69ace423f88b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPrintClassObjectFactory interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetPrintClassObject : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPrintClassObjectFactory.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {PWSTR} pszPrinterName 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     */
    GetPrintClassObject(pszPrinterName, riid) {
        pszPrinterName := pszPrinterName is String ? StrPtr(pszPrinterName) : pszPrinterName

        result := ComCall(3, this, "ptr", pszPrinterName, Guid.Ptr, riid, "ptr*", &ppNewObject := 0, "HRESULT")
        return ppNewObject
    }

    Query(iid) {
        if (IPrintClassObjectFactory.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetPrintClassObject := CallbackCreate(GetMethod(implObj, "GetPrintClassObject"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetPrintClassObject)
    }
}
