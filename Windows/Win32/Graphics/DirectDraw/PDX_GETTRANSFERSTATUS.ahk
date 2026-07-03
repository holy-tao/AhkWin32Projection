#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DDGETTRANSFERSTATUSOUTINFO.ahk" { DDGETTRANSFERSTATUSOUTINFO }

/**
 * The DxGetTransferStatus callback function is used by DirectDraw to determine which hardware bus master has completed.
 * @remarks
 * The driver identifies the bus master by supplying the transfer ID in the DDGETTRANSFERSTATUSOUTINFO structure. The transfer ID for each bus master is originally supplied by DirectDraw in the <b>dwTransferID</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/dxmini/ns-dxmini-ddtransferininfo">DDTRANSFERININFO</a> structure. DirectDraw passes a pointer to DDTRANSFERININFO in its call to the driver's <a href="https://docs.microsoft.com/windows/desktop/api/dxmini/nc-dxmini-pdx_transfer">DxTransfer</a> function.
 * @see https://learn.microsoft.com/windows/win32/api/dxmini/nc-dxmini-pdx_gettransferstatus
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct PDX_GETTRANSFERSTATUS {
    value : IntPtr

    __value {
        set {
            if (value is PDX_GETTRANSFERSTATUS) {
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
     * @param {Pointer<Void>} param1 Reserved for system use.
     * @param {Pointer<DDGETTRANSFERSTATUSOUTINFO>} param2 Points to a <a href="https://docs.microsoft.com/windows/desktop/api/dxmini/ns-dxmini-ddgettransferstatusoutinfo">DDGETTRANSFERSTATUSOUTINFO</a> structure that contains the transfer status information.
     * @returns {Integer} <i>DxGetTransferStatus</i> returns DX_OK if it succeeds; otherwise, it returns one of the following error values:
     */
    Call(param0, param1, param2) {
        param0Marshal := param0 is VarRef ? "ptr" : "ptr"
        param1Marshal := param1 is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, param0Marshal, param0, param1Marshal, param1, DDGETTRANSFERSTATUSOUTINFO.Ptr, param2, UInt32)
        return result
    }

    /**
     * A PDX_GETTRANSFERSTATUS that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PDX_GETTRANSFERSTATUS {
        /**
         * Creates a PDX_GETTRANSFERSTATUS pointer that invokes the given AHK function when called.
         * @param {Func("ptr", "ptr", DDGETTRANSFERSTATUSOUTINFO) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", "ptr", DDGETTRANSFERSTATUSOUTINFO.Ptr, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
