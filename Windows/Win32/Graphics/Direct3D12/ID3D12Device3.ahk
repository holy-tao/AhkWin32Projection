#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D12Device2.ahk

/**
 * Represents a virtual adapter. This interface extends ID3D12Device2 to support the creation of special-purpose diagnostic heaps in system memory that persist even in the event of a GPU-fault or device-removed scenario.
 * @remarks
 * 
  * Use <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-d3d12createdevice">D3D12CreateDevice</a> to create a device.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/nn-d3d12-id3d12device3
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class ID3D12Device3 extends ID3D12Device2{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D12Device3
     * @type {Guid}
     */
    static IID => Guid("{81dadc15-2bad-4392-93c5-101345c4aa98}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 48

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OpenExistingHeapFromAddress", "OpenExistingHeapFromFileMapping", "EnqueueMakeResident"]

    /**
     * 
     * @param {Pointer<Void>} pAddress 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12device3-openexistingheapfromaddress
     */
    OpenExistingHeapFromAddress(pAddress, riid) {
        pAddressMarshal := pAddress is VarRef ? "ptr" : "ptr"

        result := ComCall(48, this, pAddressMarshal, pAddress, "ptr", riid, "ptr*", &ppvHeap := 0, "HRESULT")
        return ppvHeap
    }

    /**
     * 
     * @param {HANDLE} hFileMapping 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12device3-openexistingheapfromfilemapping
     */
    OpenExistingHeapFromFileMapping(hFileMapping, riid) {
        hFileMapping := hFileMapping is Win32Handle ? NumGet(hFileMapping, "ptr") : hFileMapping

        result := ComCall(49, this, "ptr", hFileMapping, "ptr", riid, "ptr*", &ppvHeap := 0, "HRESULT")
        return ppvHeap
    }

    /**
     * 
     * @param {Integer} Flags 
     * @param {Integer} NumObjects 
     * @param {Pointer<ID3D12Pageable>} ppObjects 
     * @param {ID3D12Fence} pFenceToSignal 
     * @param {Integer} FenceValueToSignal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12device3-enqueuemakeresident
     */
    EnqueueMakeResident(Flags, NumObjects, ppObjects, pFenceToSignal, FenceValueToSignal) {
        result := ComCall(50, this, "int", Flags, "uint", NumObjects, "ptr*", ppObjects, "ptr", pFenceToSignal, "uint", FenceValueToSignal, "HRESULT")
        return result
    }
}
