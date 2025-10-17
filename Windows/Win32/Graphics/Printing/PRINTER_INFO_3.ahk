#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Security\PSECURITY_DESCRIPTOR.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class PRINTER_INFO_3 extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * @type {PSECURITY_DESCRIPTOR}
     */
    pSecurityDescriptor{
        get {
            if(!this.HasProp("__pSecurityDescriptor"))
                this.__pSecurityDescriptor := PSECURITY_DESCRIPTOR(0, this)
            return this.__pSecurityDescriptor
        }
    }
}
