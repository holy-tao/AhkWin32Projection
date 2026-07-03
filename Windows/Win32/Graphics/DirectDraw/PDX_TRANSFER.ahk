#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DDTRANSFERININFO.ahk" { DDTRANSFERININFO }
#Import ".\DDTRANSFEROUTINFO.ahk" { DDTRANSFEROUTINFO }

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
 * @see https://learn.microsoft.com/windows/win32/api/dxmini/nc-dxmini-pdx_transfer
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct PDX_TRANSFER {
    value : IntPtr

    __value {
        set {
            if (value is PDX_TRANSFER) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} param0 Points to the miniport driver's device extension.
     * @param {Pointer<DDTRANSFERININFO>} param1 Points to a <a href="https://docs.microsoft.com/windows/desktop/api/dxmini/ns-dxmini-ddtransferininfo">DDTRANSFERININFO</a> structure that contains the transfer information for the surface.
     * @param {Pointer<DDTRANSFEROUTINFO>} param2 Points to a <a href="https://docs.microsoft.com/windows/desktop/api/dxmini/ns-dxmini-ddtransferoutinfo">DDTRANSFEROUTINFO</a> structure that contains the polarity of the field being captured.
     * @returns {Integer} <i>DxTransfer</i> returns DX_OK if it succeeds; otherwise, it returns one of the following error values:
     */
    Call(param0, param1, param2) {
        param0Marshal := param0 is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, param0Marshal, param0, DDTRANSFERININFO.Ptr, param1, DDTRANSFEROUTINFO.Ptr, param2, UInt32)
        return result
    }

    /**
     * A PDX_TRANSFER that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PDX_TRANSFER {
        /**
         * Creates a PDX_TRANSFER pointer that invokes the given AHK function when called.
         * @param {Func("ptr", DDTRANSFERININFO, DDTRANSFEROUTINFO) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", DDTRANSFERININFO.Ptr, DDTRANSFEROUTINFO.Ptr, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
