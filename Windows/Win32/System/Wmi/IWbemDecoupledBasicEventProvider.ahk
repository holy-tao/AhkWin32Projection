#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IWbemDecoupledRegistrar.ahk" { IWbemDecoupledRegistrar }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IWbemServices.ahk" { IWbemServices }
#Import ".\IWbemContext.ahk" { IWbemContext }
#Import ".\IWbemObjectSink.ahk" { IWbemObjectSink }

/**
 * The IWbemDecoupledBasicEventProvider interface is a cocreatable interface that registers decoupled providers with WMI. The object created should be passed into the pUnknown argument of IWbemDecoupledRegistrar::Register.
 * @see https://learn.microsoft.com/windows/win32/api/wbemprov/nn-wbemprov-iwbemdecoupledbasiceventprovider
 * @namespace Windows.Win32.System.Wmi
 */
export default struct IWbemDecoupledBasicEventProvider extends IWbemDecoupledRegistrar {
    /**
     * The interface identifier for IWbemDecoupledBasicEventProvider
     * @type {Guid}
     */
    static IID := Guid("{86336d20-ca11-4786-9ef1-bc8a946b42fc}")

    /**
     * The class identifier for WbemDecoupledBasicEventProvider
     * @type {Guid}
     */
    static CLSID := Guid("{f5f75737-2843-4f22-933d-c76a97cda62f}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWbemDecoupledBasicEventProvider interfaces
    */
    struct Vtbl extends IWbemDecoupledRegistrar.Vtbl {
        GetSink    : IntPtr
        GetService : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWbemDecoupledBasicEventProvider.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The IWbemDecoupledBasicEventProvider::GetSink method retrieves an IWbemObjectSink object for event forwarding to WMI. This method provides for fully concurrent access.
     * @param {Integer} a_Flags Reserved for future use.
     * @param {IWbemContext} a_Context Reserved for future use.
     * @returns {IWbemObjectSink} Pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/iwbemobjectsink">IWbemObjectSink</a> instance used to forward events to WMI.
     * @see https://learn.microsoft.com/windows/win32/api/wbemprov/nf-wbemprov-iwbemdecoupledbasiceventprovider-getsink
     */
    GetSink(a_Flags, a_Context) {
        result := ComCall(5, this, "int", a_Flags, "ptr", a_Context, "ptr*", &a_Sink := 0, "HRESULT")
        return IWbemObjectSink(a_Sink)
    }

    /**
     * The IWbemDecoupledBasicEventProvider::GetService method retrieves an IWbemService object to be used to call back into WMI. This method provides for fully concurrent access.
     * @param {Integer} a_Flags Reserved for future use.
     * @param {IWbemContext} a_Context Reserved for future use.
     * @returns {IWbemServices} Pointer to an <b>IWbemService</b> object that can be used to retrieve information from WMI.
     * @see https://learn.microsoft.com/windows/win32/api/wbemprov/nf-wbemprov-iwbemdecoupledbasiceventprovider-getservice
     */
    GetService(a_Flags, a_Context) {
        result := ComCall(6, this, "int", a_Flags, "ptr", a_Context, "ptr*", &a_Service := 0, "HRESULT")
        return IWbemServices(a_Service)
    }

    Query(iid) {
        if (IWbemDecoupledBasicEventProvider.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetSink := CallbackCreate(GetMethod(implObj, "GetSink"), flags, 4)
        this.vtbl.GetService := CallbackCreate(GetMethod(implObj, "GetService"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetSink)
        CallbackFree(this.vtbl.GetService)
    }
}
