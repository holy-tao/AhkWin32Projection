#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The DxTransfer callback function informs the driver to bus master data from a surface to the buffer specified in the memory descriptor list (MDL).
 * @remarks
 * The MDL is defined in <a href="https://docs.microsoft.com/windows-hardware/drivers/">WDM</a> documentation.
 * 
 * As shown in the following code sample, the video miniport driver can use the pointer to the MDL in the <b>lpDestMDL</b> member of the DDTRANSFERININFO structure at the <i>TransferInInfo</i> parameter to bus master data to the physical memory pages that make up a scattered buffer:
 * 
 * ```cpp
 * DWORD 
 * DxTransfer(
 *     DEVICE_EXT *pDeviceExt, 
 *     PDDTRANSFERININFO pTransferInInfo, 
 *     PDDTRANSFEROUTINFO pTransferOutInfo
 *     )
 * {
 *     PMDL pMdl;
 *     UINT uiNbPages;
 *     PPFN_NUMBER pPages;
 *     PVOID MappedSystemVa;
 *     ULONG ByteCount;
 * 
 *     pMdl = pTransferInInfo->lpDestMDL;
 *     MappedSystemVa = MmGetMdlVirtualAddress(pMdl);
 *     ByteCount = MmGetMdlByteCount(pMdl);
 *     uiNbPages = ADDRESS_AND_SIZE_TO_SPAN_PAGES(MappedSystemVa,
 *                                                ByteCount);
 *     pPages = MmGetMdlPfnArray(pMdl)
 *     for (i=0; i<uiNbPages; i++) {
 *         //
 *         // Transfer to page[i]
 *         //
 *         pPages[i];
 *     }
 * }
 * ```
 * 
 * See the <a href="https://docs.microsoft.com/windows-hardware/drivers/kernel/mm-bad-pointer">ADDRESS_AND_SIZE_TO_SPAN_PAGES</a>, <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/wdm/nf-wdm-mmgetmdlbytecount">MmGetMdlByteCount</a>, <a href="https://docs.microsoft.com/windows-hardware/drivers/kernel/mm-bad-pointer">MmGetMdlPfnArray</a>, and <a href="https://docs.microsoft.com/windows-hardware/drivers/kernel/mm-bad-pointer">MmGetMdlVirtualAddress</a> kernel-mode macros for more information.
 * 
 * <i>DxTransfer</i> is called at hardware interrupt time. This means the driver cannot wait for a previous bus master to complete and it cannot call any functions that are not safe to call at interrupt time (that is, most of them).
 * 
 * In addition, the driver should not fail the call just because the hardware is currently busy. Instead, the driver should maintain an internal queue.
 * @see https://learn.microsoft.com/windows/win32/api//content/dxmini/nc-dxmini-pdx_transfer
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class PDX_TRANSFER extends IUnknown {

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Invoke"]

    /**
     * Invokes helper functionality for the IDispatch interface.
     * @param {Pointer<Void>} param0 
     * @param {Pointer<DDTRANSFERININFO>} param1 
     * @param {Pointer<DDTRANSFEROUTINFO>} param2 
     * @returns {Integer} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(param0, param1, param2) {
        param0Marshal := param0 is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, param0Marshal, param0, "ptr", param1, "ptr", param2, "uint")
        return result
    }
}
