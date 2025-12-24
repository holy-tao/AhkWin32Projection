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
     * Writes a number of 32-bit immediate values to the specified buffer locations directly from the command stream.
     * @remarks
     * 
     * <b>WriteBufferImmediate</b> performs <i>Count</i> number of 32-bit writes: one for each value and destination specified in <i>pParams</i>.
     * 
     * The receiving buffer (resource) must be in the <b>D3D12_RESOURCE_STATE_COPY_DEST</b> state to be a valid destination for <b>WriteBufferImmediate</b>.
     * 
     * 
     * @param {Integer} Count The number of <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_writebufferimmediate_parameter">D3D12_WRITEBUFFERIMMEDIATE_PARAMETER</a> structures that are pointed to by <i>pParams</i> and <i>pModes</i>.
     * @param {Pointer<D3D12_WRITEBUFFERIMMEDIATE_PARAMETER>} pParams The address of an array containing a number of <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_writebufferimmediate_parameter">D3D12_WRITEBUFFERIMMEDIATE_PARAMETER</a> structures equal to <i>Count</i>.
     * @param {Pointer<Integer>} pModes The address of an array containing a number of  <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_writebufferimmediate_mode">D3D12_WRITEBUFFERIMMEDIATE_MODE</a> structures equal to <i>Count</i>. The default value is <b>null</b>; passing <b>null</b> causes the system to write all immediate values using <b>D3D12_WRITEBUFFERIMMEDIATE_MODE_DEFAULT</b>.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d12/nf-d3d12-id3d12graphicscommandlist2-writebufferimmediate
     */
    WriteBufferImmediate(Count, pParams, pModes) {
        pModesMarshal := pModes is VarRef ? "int*" : "ptr"

        ComCall(66, this, "uint", Count, "ptr", pParams, pModesMarshal, pModes)
    }
}
