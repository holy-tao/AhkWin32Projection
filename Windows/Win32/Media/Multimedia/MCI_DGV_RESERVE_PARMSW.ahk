#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The MCI_DGV_RESERVE_PARMSW (Unicode) structure (digitalv.h) contains information for the MCI_RESERVE command for digital-video devices.
 * @remarks
 * When assigning data to the members of this structure, set the corresponding flags in the <i>fdwCommand</i> parameter of the <a href="https://docs.microsoft.com/previous-versions/dd757160(v=vs.85)">mciSendCommand</a> function to validate the members.
  * 
  * 
  * 
  * 
  * 
  * > [!NOTE]
  * > The digitalv.h header defines MCI_DGV_RESERVE_PARMS as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/digitalv/ns-digitalv-mci_dgv_reserve_parmsw
 * @namespace Windows.Win32.Media.Multimedia
 * @version v4.0.30319
 * @charset Unicode
 */
class MCI_DGV_RESERVE_PARMSW extends Win32Struct
{
    static sizeof => 20

    static packingSize => 1

    /**
     * The low-order word specifies a window handle used for the MCI_NOTIFY flag.
     * @type {Pointer}
     */
    dwCallback {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Pointer to a null-terminated string containing the location of a temporary file. The buffer contains only the drive and directory path of the file used to hold recorded data; the filename is specified by the device driver.
     * @type {Pointer<PWSTR>}
     */
    lpstrPath {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Size of reserved disk space.
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
