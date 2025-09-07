#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BSTR.ahk

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 * @version v4.0.30319
 */
class PM_INVOCATIONINFO extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {BSTR}
     */
    URIBaseOrAUMID{
        get {
            if(!this.HasProp("__URIBaseOrAUMID"))
                this.__URIBaseOrAUMID := BSTR(this.ptr + 0)
            return this.__URIBaseOrAUMID
        }
    }

    /**
     * @type {BSTR}
     */
    URIFragmentOrArgs{
        get {
            if(!this.HasProp("__URIFragmentOrArgs"))
                this.__URIFragmentOrArgs := BSTR(this.ptr + 8)
            return this.__URIFragmentOrArgs
        }
    }
}
