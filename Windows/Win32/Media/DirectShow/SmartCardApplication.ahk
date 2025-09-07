#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The SmartCardApplication structure identifies a smart card application.
 * @see https://learn.microsoft.com/windows/win32/api/bdaiface_enums/ns-bdaiface_enums-smartcardapplication
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class SmartCardApplication extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/applicationtypetype">ApplicationTypeType</a> enumeration.
     * @type {Integer}
     */
    ApplicationType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Application version.
     * @type {Integer}
     */
    ApplicationVersion {
        get => NumGet(this, 4, "ushort")
        set => NumPut("ushort", value, this, 4)
    }

    /**
     * Application name.
     * @type {Pointer<Ptr>}
     */
    pbstrApplicationName {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Application URL.
     * @type {Pointer<Ptr>}
     */
    pbstrApplicationURL {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
