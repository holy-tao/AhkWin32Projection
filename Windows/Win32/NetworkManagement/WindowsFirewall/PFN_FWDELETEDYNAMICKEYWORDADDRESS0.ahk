#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Function pointer type of the entry point in the service that you call to delete the dynamic keyword address with the specified ID.
 * @remarks
 * > [!NOTE]
 * > This function returns **ERROR_SUCCESS** even if the object with the specified ID doesn't exist.
 * @see https://learn.microsoft.com/windows/win32/api/netfw/nc-netfw-pfn_fwdeletedynamickeywordaddress0
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 */
export default struct PFN_FWDELETEDYNAMICKEYWORDADDRESS0 {
    value : IntPtr

    __value {
        set {
            if (value is PFN_FWDELETEDYNAMICKEYWORDADDRESS0) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Guid} dynamicKeywordAddressId Type: **[GUID](/windows/win32/api/guiddef/ns-guiddef-guid)**
     * 
     * The id of the dynamic keyword address object to delete.
     * @returns {Integer} Type: **[DWORD](/windows/win32/winprog/windows-data-types)**
     * 
     * If the function succeeds (the object was successfully deleted, or no object with the specified ID exists), then it returns **ERROR_SUCCESS**. Otherwise, it returns one of the following values.
     * 
     * |Return value|Description|
     * |-|-|
     * |ERROR_ACCESS_DENIED|The caller doesn't have proper permissions to operate on the object with the specified ID. This likely means that the object is managed by MDM (it has origin type **FW_DYNAMIC_KEYWORD_ORIGIN_MDM**.|
     */
    Call(dynamicKeywordAddressId) {
        result := DllCall(this.value, Guid, dynamicKeywordAddressId, UInt32)
        return result
    }

    /**
     * A PFN_FWDELETEDYNAMICKEYWORDADDRESS0 that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_FWDELETEDYNAMICKEYWORDADDRESS0 {
        /**
         * Creates a PFN_FWDELETEDYNAMICKEYWORDADDRESS0 pointer that invokes the given AHK function when called.
         * @param {Func(Guid) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [Guid, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
