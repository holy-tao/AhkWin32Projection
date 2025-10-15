#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\MSIHANDLE.ahk

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 * @version v4.0.30319
 */
class PMSIHANDLE extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * @type {MSIHANDLE}
     */
    m_h{
        get {
            if(!this.HasProp("__m_h"))
                this.__m_h := MSIHANDLE(this.ptr + 0)
            return this.__m_h
        }
    }
}
