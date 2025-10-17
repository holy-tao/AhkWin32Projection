#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BSTR.ahk

/**
 * The SmartCardApplication structure identifies a smart card application.
 * @see https://docs.microsoft.com/windows/win32/api//bdaiface_enums/ns-bdaiface_enums-smartcardapplication
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
     * @type {BSTR}
     */
    pbstrApplicationName{
        get {
            if(!this.HasProp("__pbstrApplicationName"))
                this.__pbstrApplicationName := BSTR(8, this)
            return this.__pbstrApplicationName
        }
    }

    /**
     * Application URL.
     * @type {BSTR}
     */
    pbstrApplicationURL{
        get {
            if(!this.HasProp("__pbstrApplicationURL"))
                this.__pbstrApplicationURL := BSTR(16, this)
            return this.__pbstrApplicationURL
        }
    }
}
