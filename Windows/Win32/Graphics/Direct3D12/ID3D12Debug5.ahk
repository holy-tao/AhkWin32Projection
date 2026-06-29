#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ID3D12Debug4.ahk" { ID3D12Debug4 }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Adds to the debug layer the ability to configure the auto-naming of objects.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12sdklayers/nn-d3d12sdklayers-id3d12debug5
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct ID3D12Debug5 extends ID3D12Debug4 {
    /**
     * The interface identifier for ID3D12Debug5
     * @type {Guid}
     */
    static IID := Guid("{548d6b12-09fa-40e0-9069-5dcd589a52c9}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D12Debug5 interfaces
    */
    struct Vtbl extends ID3D12Debug4.Vtbl {
        SetEnableAutoName : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D12Debug5.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Configures the auto-naming of objects.
     * @remarks
     * By default, objects are not named unless you use [ID3D12Object::SetName](/windows/win32/api/d3d12/nf-d3d12-id3d12object-setname) or [ID3D12Object::SetPrivateData](/windows/win32/api/d3d12/nf-d3d12-id3d12object-setprivatedata) to assign a name.
     * 
     * It's a best practice to name all of your Direct3D 12 objects; at least in debug builds. Failing that, you might find it convenient to allow automatic name assignment in order to cover the gaps. Direct3D 12 objects created with auto-name enabled are automatically assigned a name, which is used for debug layer output and for DRED page fault data.
     * 
     * So as not to create a dependency on a specific auto-naming format, you can't retrieve the auto-name strings by using ID3D12Object::GetName or [ID3D12Object::GetPrivateData](/windows/win32/api/d3d12/nf-d3d12-id3d12object-getprivatedata). But, to generate a unique name string, Direct3D 12 uses the locally-unique identifier (LUID) assigned to every **ID3D12DeviceChild** object at create time. You can retrieve that LUID by using **ID3D12Object::GetPrivateData** with the **REFGUID** value *WKPDID_D3D12UniqueObjectId*. You might find that useful for your own object-naming schemas.
     * 
     * When debugging existing software, you can control auto-naming by using the *D3DConfig* graphics tools utility and the command `d3dconfig.exe device auto-debug-name=forced-on`.
     * 
     * Any object given a name using [ID3D12Object::SetName](/windows/win32/api/d3d12/nf-d3d12-id3d12object-setname) or [ID3D12Object::SetPrivateData](/windows/win32/api/d3d12/nf-d3d12-id3d12object-setprivatedata) uses the assigned name instead of the auto-name.
     * @param {BOOL} Enable Type: **[BOOL](/windows/desktop/winprog/windows-data-types)**
     * 
     * `true` to enable auto-naming; `false` to disable auto-naming.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d12sdklayers/nf-d3d12sdklayers-id3d12debug5-setenableautoname
     */
    SetEnableAutoName(Enable) {
        ComCall(8, this, BOOL, Enable)
    }

    Query(iid) {
        if (ID3D12Debug5.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetEnableAutoName := CallbackCreate(GetMethod(implObj, "SetEnableAutoName"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetEnableAutoName)
    }
}
