#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * A switch-to-reference interface (see the switch-to-reference layer) enables an application to switch between a hardware and software device.
 * @remarks
 * This interface is obtained by calling <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> on a <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10device">ID3D10Device Interface</a> created with the <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ne-d3d10-d3d10_create_device_flag">D3D10_CREATE_DEVICE_SWITCH_TO_REF</a> flag.
 * @see https://learn.microsoft.com/windows/win32/api/d3d10sdklayers/nn-d3d10sdklayers-id3d10switchtoref
 * @namespace Windows.Win32.Graphics.Direct3D10
 */
export default struct ID3D10SwitchToRef extends IUnknown {
    /**
     * The interface identifier for ID3D10SwitchToRef
     * @type {Guid}
     */
    static IID := Guid("{9b7e4e02-342c-4106-a19f-4f2704f689f0}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D10SwitchToRef interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetUseRef : IntPtr
        GetUseRef : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D10SwitchToRef.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Switch between a hardware and a software device.
     * @remarks
     * This API will fail if the device is not switchable; you must have created a device that is switchable by specifying the D3D10_CREATE_DEVICE_SWITCH_TO_REF flag during device creation (when calling <a href="https://docs.microsoft.com/windows/desktop/api/d3d10misc/nf-d3d10misc-d3d10createdevice">D3D10CreateDevice</a>).
     * 
     * Switching from a software device to a hardware device clears all cached objects from system memory. Switching from a hardware device to a software device causes resources to be downloaded to system memory.
     * @param {BOOL} UseRef Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * A boolean value. Set this to <b>TRUE</b> to change to a software device, set this to <b>FALSE</b> to change to a hardware device.
     * @returns {BOOL} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * The previous value of <i>UseRef</i>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d10sdklayers/nf-d3d10sdklayers-id3d10switchtoref-setuseref
     */
    SetUseRef(UseRef) {
        result := ComCall(3, this, BOOL, UseRef, BOOL)
        return result
    }

    /**
     * Get a boolean value that indicates the type of device being used.
     * @remarks
     * A hardware device is commonly referred to as a HAL device, which stands for a hardware accelerated device. This means that the pipeline is rendering all of the pipeline commands in hardware, using the GPU. Operating the pipeline with a HAL device gives the best performance generally, but it can be more difficult to debug since resources exist on the GPU instead of the CPU.
     * 
     * A software device implements rendering in software using the CPU with no hardware acceleration. A software device is commonly referred to as a reference device or REF device. Because a REF device implements rendering on the CPU, it is generally slower, but is easier to debug since it allows access to resources.
     * @returns {BOOL} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * <b>TRUE</b> if the device is a software device, <b>FALSE</b> if the device is a hardware device. See remarks.
     * @see https://learn.microsoft.com/windows/win32/api/d3d10sdklayers/nf-d3d10sdklayers-id3d10switchtoref-getuseref
     */
    GetUseRef() {
        result := ComCall(4, this, BOOL)
        return result
    }

    Query(iid) {
        if (ID3D10SwitchToRef.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetUseRef := CallbackCreate(GetMethod(implObj, "SetUseRef"), flags, 2)
        this.vtbl.GetUseRef := CallbackCreate(GetMethod(implObj, "GetUseRef"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetUseRef)
        CallbackFree(this.vtbl.GetUseRef)
    }
}
