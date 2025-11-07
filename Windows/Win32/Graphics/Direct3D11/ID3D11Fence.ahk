#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\HANDLE.ahk
#Include .\ID3D11DeviceChild.ahk

/**
 * Represents a fence, an object used for synchronization of the CPU and one or more GPUs.
 * @see https://docs.microsoft.com/windows/win32/api//d3d11_3/nn-d3d11_3-id3d11fence
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class ID3D11Fence extends ID3D11DeviceChild{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D11Fence
     * @type {Guid}
     */
    static IID => Guid("{affde9d1-1df7-4bb7-8a34-0f46251dab80}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateSharedHandle", "GetCompletedValue", "SetEventOnCompletion"]

    /**
     * 
     * @param {Pointer<SECURITY_ATTRIBUTES>} pAttributes 
     * @param {Integer} dwAccess 
     * @param {PWSTR} lpName 
     * @returns {HANDLE} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11_3/nf-d3d11_3-id3d11fence-createsharedhandle
     */
    CreateSharedHandle(pAttributes, dwAccess, lpName) {
        lpName := lpName is String ? StrPtr(lpName) : lpName

        pHandle := HANDLE()
        result := ComCall(7, this, "ptr", pAttributes, "uint", dwAccess, "ptr", lpName, "ptr", pHandle, "HRESULT")
        return pHandle
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11_3/nf-d3d11_3-id3d11fence-getcompletedvalue
     */
    GetCompletedValue() {
        result := ComCall(8, this, "uint")
        return result
    }

    /**
     * 
     * @param {Integer} Value 
     * @param {HANDLE} hEvent 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11_3/nf-d3d11_3-id3d11fence-seteventoncompletion
     */
    SetEventOnCompletion(Value, hEvent) {
        hEvent := hEvent is Win32Handle ? NumGet(hEvent, "ptr") : hEvent

        result := ComCall(9, this, "uint", Value, "ptr", hEvent, "HRESULT")
        return result
    }
}
