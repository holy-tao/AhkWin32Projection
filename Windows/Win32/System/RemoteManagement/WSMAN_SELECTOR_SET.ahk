#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WSMAN_KEY.ahk" { WSMAN_KEY }

/**
 * Defines a set of keys that represent the identity of a resource.
 * @see https://learn.microsoft.com/windows/win32/api/wsman/ns-wsman-wsman_selector_set
 * @namespace Windows.Win32.System.RemoteManagement
 */
export default struct WSMAN_SELECTOR_SET {
    #StructPack 8

    /**
     * Specifies the number of keys (selectors).
     */
    numberKeys : UInt32

    /**
     * An array of <a href="https://docs.microsoft.com/windows/desktop/api/wsman/ns-wsman-wsman_key">WSMAN_KEY</a>  structures that specify key names and values.
     */
    keys : WSMAN_KEY.Ptr

}
