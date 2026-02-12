#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HGLOBAL.ahk

/**
 * Contains information about a registry value. The RegQueryMultipleValues function uses this structure. (Unicode)
 * @remarks
 * > [!NOTE]
 * > The winreg.h header defines VALENT as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api//content/winreg/ns-winreg-valentw
 * @namespace Windows.Win32.Devices.ImageAcquisition
 * @version v4.0.30319
 */
class VAL extends Win32Struct
{
    static sizeof => 576

    static packingSize => 8

    /**
     * @type {Integer}
     */
    lVal {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Float}
     */
    dblVal {
        get => NumGet(this, 8, "double")
        set => NumPut("double", value, this, 8)
    }

    /**
     * @type {Pointer<Guid>}
     */
    pGuid {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Pointer<SCANINFO>}
     */
    pScanInfo {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {HGLOBAL}
     */
    handle{
        get {
            if(!this.HasProp("__handle"))
                this.__handle := HGLOBAL(32, this)
            return this.__handle
        }
    }

    /**
     * @type {Pointer<Pointer<Integer>>}
     */
    ppButtonNames {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * @type {Pointer<HANDLE>}
     */
    pHandle {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * @type {Integer}
     */
    lReserved {
        get => NumGet(this, 56, "int")
        set => NumPut("int", value, this, 56)
    }

    /**
     * @type {String}
     */
    szVal {
        get => StrGet(this.ptr + 60, 254, "UTF-16")
        set => StrPut(value, this.ptr + 60, 254, "UTF-16")
    }
}
