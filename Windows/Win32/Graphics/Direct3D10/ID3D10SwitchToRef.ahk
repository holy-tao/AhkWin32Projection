#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * A switch-to-reference interface (see the switch-to-reference layer) enables an application to switch between a hardware and software device.
 * @remarks
 * 
 * This interface is obtained by calling <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> on a <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10device">ID3D10Device Interface</a> created with the <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ne-d3d10-d3d10_create_device_flag">D3D10_CREATE_DEVICE_SWITCH_TO_REF</a> flag.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d10sdklayers/nn-d3d10sdklayers-id3d10switchtoref
 * @namespace Windows.Win32.Graphics.Direct3D10
 * @version v4.0.30319
 */
class ID3D10SwitchToRef extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D10SwitchToRef
     * @type {Guid}
     */
    static IID => Guid("{9b7e4e02-342c-4106-a19f-4f2704f689f0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetUseRef", "GetUseRef"]

    /**
     * Switch between a hardware and a software device.
     * @param {BOOL} UseRef Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * A boolean value. Set this to <b>TRUE</b> to change to a software device, set this to <b>FALSE</b> to change to a hardware device.
     * @returns {BOOL} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * The previous value of <i>UseRef</i>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d10sdklayers/nf-d3d10sdklayers-id3d10switchtoref-setuseref
     */
    SetUseRef(UseRef) {
        result := ComCall(3, this, "int", UseRef, "int")
        return result
    }

    /**
     * Get a boolean value that indicates the type of device being used.
     * @returns {BOOL} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * <b>TRUE</b> if the device is a software device, <b>FALSE</b> if the device is a hardware device. See remarks.
     * @see https://docs.microsoft.com/windows/win32/api//d3d10sdklayers/nf-d3d10sdklayers-id3d10switchtoref-getuseref
     */
    GetUseRef() {
        result := ComCall(4, this, "int")
        return result
    }
}
