#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ID3D12SDKConfiguration.ahk" { ID3D12SDKConfiguration }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct ID3D12SDKConfiguration1 extends ID3D12SDKConfiguration {
    /**
     * The interface identifier for ID3D12SDKConfiguration1
     * @type {Guid}
     */
    static IID := Guid("{8aaf9303-ad25-48b9-9a57-d9c37e009d9f}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D12SDKConfiguration1 interfaces
    */
    struct Vtbl extends ID3D12SDKConfiguration.Vtbl {
        CreateDeviceFactory : IntPtr
        FreeUnusedSDKs      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D12SDKConfiguration1.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} SDKVersion 
     * @param {PSTR} SDKPath 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     */
    CreateDeviceFactory(SDKVersion, SDKPath, riid) {
        SDKPath := SDKPath is String ? StrPtr(SDKPath) : SDKPath

        result := ComCall(4, this, "uint", SDKVersion, "ptr", SDKPath, Guid.Ptr, riid, "ptr*", &ppvFactory := 0, "HRESULT")
        return ppvFactory
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    FreeUnusedSDKs() {
        ComCall(5, this)
    }

    Query(iid) {
        if (ID3D12SDKConfiguration1.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateDeviceFactory := CallbackCreate(GetMethod(implObj, "CreateDeviceFactory"), flags, 5)
        this.vtbl.FreeUnusedSDKs := CallbackCreate(GetMethod(implObj, "FreeUnusedSDKs"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateDeviceFactory)
        CallbackFree(this.vtbl.FreeUnusedSDKs)
    }
}
