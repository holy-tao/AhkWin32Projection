#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IEnumVdsObject.ahk" { IEnumVdsObject }

/**
 * The IVdsControllerControllerPort (vdshwprv.h) interface provides a method to enumerate controller ports for a class implementing the IVdsController interface.
 * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nn-vdshwprv-ivdscontrollercontrollerport
 * @namespace Windows.Win32.Storage.VirtualDiskService
 */
export default struct IVdsControllerControllerPort extends IUnknown {
    /**
     * The interface identifier for IVdsControllerControllerPort
     * @type {Guid}
     */
    static IID := Guid("{ca5d735f-6bae-42c0-b30e-f2666045ce71}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IVdsControllerControllerPort interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        QueryControllerPorts : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IVdsControllerControllerPort.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The IVdsControllerControllerPort::QueryControllerPorts method (vdshwprv.h) returns an IEnumVdsObject object that enumerates the ports of the controller.
     * @returns {IEnumVdsObject} The address of an <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nn-vdshwprv-ienumvdsobject">IEnumVdsObject</a> interface pointer that can be used to enumerate the controller ports  as <a href="https://docs.microsoft.com/windows/desktop/VDS/controller-port-object">controller port objects</a>. For more information, see <a href="https://docs.microsoft.com/windows/desktop/VDS/working-with-enumeration-objects">Working with Enumeration Objects</a>. Callers must release the interface and each of the controller port objects when they are no longer needed by calling the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> method.
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdscontrollercontrollerport-querycontrollerports
     */
    QueryControllerPorts() {
        result := ComCall(3, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumVdsObject(ppEnum)
    }

    Query(iid) {
        if (IVdsControllerControllerPort.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.QueryControllerPorts := CallbackCreate(GetMethod(implObj, "QueryControllerPorts"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.QueryControllerPorts)
    }
}
