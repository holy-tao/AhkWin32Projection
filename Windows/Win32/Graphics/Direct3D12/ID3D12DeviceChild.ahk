#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D12Object.ahk

/**
 * An interface from which other core interfaces inherit from, including (but not limited to) ID3D12PipelineLibrary, ID3D12CommandList, ID3D12Pageable, and ID3D12RootSignature. It provides a method to get back to the device object it was created against.
 * @see https://learn.microsoft.com/windows/win32/api//content/d3d12/nn-d3d12-id3d12devicechild
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class ID3D12DeviceChild extends ID3D12Object{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D12DeviceChild
     * @type {Guid}
     */
    static IID => Guid("{905db94b-a00c-4140-9df5-2b64ca9ea357}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDevice"]

    /**
     * Gets a pointer to the device that created this interface.
     * @remarks
     * Any returned interfaces have their reference count incremented by one, so be sure to call ::release() on the returned pointers before they are freed or else you will have a memory leak.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * The globally unique identifier (<b>GUID</b>) for the device interface.
     *             The <b>REFIID</b>, or <b>GUID</b>, of the interface to the device can be obtained by using the __uuidof() macro.
     *             For example, __uuidof(<a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nn-d3d12-id3d12device">ID3D12Device</a>) will get the <b>GUID</b> of the interface to a device.
     * @returns {Pointer<Pointer<Void>>} Type: <b>void**</b>
     * 
     * A pointer to a memory block that receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nn-d3d12-id3d12device">ID3D12Device</a> interface for the device.
     * @see https://learn.microsoft.com/windows/win32/api//content/d3d12/nf-d3d12-id3d12devicechild-getdevice
     */
    GetDevice(riid) {
        result := ComCall(7, this, "ptr", riid, "ptr*", &ppvDevice := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppvDevice
    }
}
