#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Win32\Foundation\UNICODE_STRING.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class PROCESS_REVOKE_FILE_HANDLES_INFORMATION extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {UNICODE_STRING}
     */
    TargetDevicePath{
        get {
            if(!this.HasProp("__TargetDevicePath"))
                this.__TargetDevicePath := UNICODE_STRING(0, this)
            return this.__TargetDevicePath
        }
    }
}
