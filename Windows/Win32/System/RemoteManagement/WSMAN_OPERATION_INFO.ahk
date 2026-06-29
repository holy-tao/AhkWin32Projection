#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WSMAN_OPTION_SET.ahk" { WSMAN_OPTION_SET }
#Import ".\WSMAN_SELECTOR_SET.ahk" { WSMAN_SELECTOR_SET }
#Import ".\WSMAN_KEY.ahk" { WSMAN_KEY }
#Import ".\WSMAN_OPTION.ahk" { WSMAN_OPTION }
#Import ".\WSMAN_FILTER.ahk" { WSMAN_FILTER }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\WSMAN_FRAGMENT.ahk" { WSMAN_FRAGMENT }

/**
 * Represents a specific resource endpoint for which the plug-in must perform the request.
 * @see https://learn.microsoft.com/windows/win32/api/wsman/ns-wsman-wsman_operation_info
 * @namespace Windows.Win32.System.RemoteManagement
 */
export default struct WSMAN_OPERATION_INFO {
    #StructPack 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wsman/ns-wsman-wsman_fragment">WSMAN_FRAGMENT</a> structure that specifies the subset of data to be used for the operation. This parameter is reserved for future use and is ignored on receipt.
     */
    fragment : WSMAN_FRAGMENT

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wsman/ns-wsman-wsman_filter">WSMAN_FILTER</a> structure that specifies the filtering that is used for the operation. This parameter is reserved for future use and is ignored on receipt.
     */
    filter : WSMAN_FILTER

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wsman/ns-wsman-wsman_selector_set">WSMAN_SELECTOR_SET</a> structure that identifies the specific resource to use for the request.
     */
    selectorSet : WSMAN_SELECTOR_SET

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wsman/ns-wsman-wsman_option_set">WSMAN_OPTION_SET</a> structure that specifies the set of options for the request.
     */
    optionSet : WSMAN_OPTION_SET

    reserved : IntPtr

    version : UInt32

}
