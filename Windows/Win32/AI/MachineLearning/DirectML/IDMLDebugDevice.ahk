#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Controls the DirectML debug layers.
 * @see https://learn.microsoft.com/windows/win32/api/directml/nn-directml-idmldebugdevice
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 */
export default struct IDMLDebugDevice extends IUnknown {
    /**
     * The interface identifier for IDMLDebugDevice
     * @type {Guid}
     */
    static IID := Guid("{7d6f3ac9-394a-4ac3-92a7-390cc57a8217}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDMLDebugDevice interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetMuteDebugOutput : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDMLDebugDevice.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Determine whether to mute DirectML from sending messages to the ID3D12InfoQueue.
     * @param {BOOL} mute Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * If <b>TRUE</b>, DirectML is muted, and it will not send messages to the <a href="https://docs.microsoft.com/windows/win32/api/d3d12sdklayers/nn-d3d12sdklayers-id3d12infoqueue">ID3D12InfoQueue</a>. If <b>FALSE</b>, DirectML is not muted, and it will send messages to the <b>ID3D12InfoQueue</b>. The default value is <b>FALSE</b>.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/directml/nf-directml-idmldebugdevice-setmutedebugoutput
     */
    SetMuteDebugOutput(mute) {
        ComCall(3, this, BOOL, mute)
    }

    Query(iid) {
        if (IDMLDebugDevice.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetMuteDebugOutput := CallbackCreate(GetMethod(implObj, "SetMuteDebugOutput"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetMuteDebugOutput)
    }
}
