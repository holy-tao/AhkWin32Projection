#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D12GraphicsCommandList1.ahk

/**
 * Encapsulates a list of graphics commands for rendering, extending the interface to support writing immediate values directly to a buffer.
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/nn-d3d12-id3d12graphicscommandlist2
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class ID3D12GraphicsCommandList2 extends ID3D12GraphicsCommandList1{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D12GraphicsCommandList2
     * @type {Guid}
     */
    static IID => Guid("{38c3e585-ff17-412c-9150-4fc6f9d72a28}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 66

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["WriteBufferImmediate"]

    /**
     * 
     * @param {Integer} Count 
     * @param {Pointer<D3D12_WRITEBUFFERIMMEDIATE_PARAMETER>} pParams 
     * @param {Pointer<Integer>} pModes 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12graphicscommandlist2-writebufferimmediate
     */
    WriteBufferImmediate(Count, pParams, pModes) {
        ComCall(66, this, "uint", Count, "ptr", pParams, "int*", pModes)
    }
}
