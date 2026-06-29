#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Is the base interface for all other attachment types.
 * @remarks
 * This interface is used strictly as a common ancestor for the various attachment types and has no members of its own.
 * @see https://learn.microsoft.com/windows/win32/api/wsdattachment/nn-wsdattachment-iwsdattachment
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 */
export default struct IWSDAttachment extends IUnknown {
    /**
     * The interface identifier for IWSDAttachment
     * @type {Guid}
     */
    static IID := Guid("{5d55a616-9df8-4b09-b156-9ba351a48b76}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWSDAttachment interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWSDAttachment.Vtbl()
        }
        super.__New(implObj, flags)
    }

    Query(iid) {
        if (IWSDAttachment.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
    }
}
