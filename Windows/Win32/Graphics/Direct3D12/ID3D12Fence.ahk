#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D12Pageable.ahk

/**
 * Represents a fence, an object used for synchronization of the CPU and one or more GPUs.
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/nn-d3d12-id3d12fence
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class ID3D12Fence extends ID3D12Pageable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D12Fence
     * @type {Guid}
     */
    static IID => Guid("{0a753dcf-c4d8-4b91-adf6-be5a60d95a76}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCompletedValue", "SetEventOnCompletion", "Signal"]

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12fence-getcompletedvalue
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
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12fence-seteventoncompletion
     */
    SetEventOnCompletion(Value, hEvent) {
        hEvent := hEvent is Win32Handle ? NumGet(hEvent, "ptr") : hEvent

        result := ComCall(9, this, "uint", Value, "ptr", hEvent, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12fence-signal
     */
    Signal(Value) {
        result := ComCall(10, this, "uint", Value, "HRESULT")
        return result
    }
}
