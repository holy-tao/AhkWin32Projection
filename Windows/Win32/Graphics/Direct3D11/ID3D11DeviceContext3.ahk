#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D11DeviceContext2.ahk

/**
 * The device context interface represents a device context; it is used to render commands. ID3D11DeviceContext3 adds new methods to those in ID3D11DeviceContext2.
 * @see https://docs.microsoft.com/windows/win32/api//d3d11_3/nn-d3d11_3-id3d11devicecontext3
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class ID3D11DeviceContext3 extends ID3D11DeviceContext2{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D11DeviceContext3
     * @type {Guid}
     */
    static IID => Guid("{b4e3c01d-e79e-4637-91b2-510e9f4c9b8f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 144

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Flush1", "SetHardwareProtectionState", "GetHardwareProtectionState"]

    /**
     * 
     * @param {Integer} ContextType 
     * @param {HANDLE} hEvent 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11_3/nf-d3d11_3-id3d11devicecontext3-flush1
     */
    Flush1(ContextType, hEvent) {
        hEvent := hEvent is Win32Handle ? NumGet(hEvent, "ptr") : hEvent

        ComCall(144, this, "int", ContextType, "ptr", hEvent)
    }

    /**
     * 
     * @param {BOOL} HwProtectionEnable 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11_3/nf-d3d11_3-id3d11devicecontext3-sethardwareprotectionstate
     */
    SetHardwareProtectionState(HwProtectionEnable) {
        ComCall(145, this, "int", HwProtectionEnable)
    }

    /**
     * 
     * @param {Pointer<BOOL>} pHwProtectionEnable 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11_3/nf-d3d11_3-id3d11devicecontext3-gethardwareprotectionstate
     */
    GetHardwareProtectionState(pHwProtectionEnable) {
        pHwProtectionEnableMarshal := pHwProtectionEnable is VarRef ? "int*" : "ptr"

        ComCall(146, this, pHwProtectionEnableMarshal, pHwProtectionEnable)
    }
}
