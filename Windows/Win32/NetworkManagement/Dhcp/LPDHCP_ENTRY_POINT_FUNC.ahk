#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DHCP_CALLOUT_TABLE.ahk" { DHCP_CALLOUT_TABLE }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * The DhcpServerCalloutEntry function is called by Microsoft DHCP Server to initialize a third-party DLL, and to discover for which events the third-party DLL wants notification. The DhcpServerCalloutEntry function is implemented by third-party DLLs.
 * @remarks
 * Upon successful loading of a third-party DLL, Microsoft DHCP Server calls the DLL's 
 * <b>DhcpServerCalloutEntry</b> function. If this function call succeeds, Microsoft DHCP Server does not attempt to load any further third-party DLLs, and instead passes the list of remaining third-party DLLs in the <i>ChainDlls</i> parameter. It is the responsibility of the loaded third-party DLL to ensure that:
 * 
 * <ul>
 * <li>other third-party DLLs are loaded</li>
 * <li>their 
 * <b>DhcpServerCalloutEntry</b> function called</li>
 * <li>the merged list of requested notification entry points are returned to Microsoft DHCP Server in the <i>CalloutTbl</i> parameter.</li>
 * </ul>
 * The initially loaded third-party DLL is responsible for maintaining a table of cumulative notification entry points, and upon notification of a particular event, must call all chained third-party DLLs before returning to Microsoft DHCP Server.
 * 
 * <div class="alert"><b>Note</b>  For version negotiation, Microsoft DHCP Server may call the 
 * <b>DhcpServerCalloutEntry</b> function until a compatible version is found.</div>
 * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api/dhcpssdk/nc-dhcpssdk-lpdhcp_entry_point_func
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 */
export default struct LPDHCP_ENTRY_POINT_FUNC {
    value : IntPtr

    __value {
        set {
            if (value is LPDHCP_ENTRY_POINT_FUNC) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {PWSTR} ChainDlls Collection of remaining third-party DLLs that provided registry entries requesting notification of DHCP Server events, in REG_MULTI_SZ format.
     * @param {Integer} CalloutVersion Version of the DHCP Server API that the third-party DLL is expected to support. The current version number is zero.
     * @param {Pointer<DHCP_CALLOUT_TABLE>} CalloutTbl Cumulative set of notification hooks requested by all third-party DLLs, in the form of a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dhcpssdk/ns-dhcpssdk-dhcp_callout_table">DHCP_CALLOUT_TABLE</a> structure.
     * @returns {Integer} Return values are defined by the application providing the callback.
     */
    Call(ChainDlls, CalloutVersion, CalloutTbl) {
        ChainDlls := ChainDlls is String ? StrPtr(ChainDlls) : ChainDlls

        result := DllCall(this.value, "ptr", ChainDlls, UInt32, CalloutVersion, DHCP_CALLOUT_TABLE.Ptr, CalloutTbl, UInt32)
        return result
    }

    /**
     * A LPDHCP_ENTRY_POINT_FUNC that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPDHCP_ENTRY_POINT_FUNC {
        /**
         * Creates a LPDHCP_ENTRY_POINT_FUNC pointer that invokes the given AHK function when called.
         * @param {Func(PWSTR, UInt32, DHCP_CALLOUT_TABLE) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PWSTR, UInt32, DHCP_CALLOUT_TABLE.Ptr, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
