#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HWND.ahk
#Include ..\..\Foundation\PSTR.ahk
#Include ..\..\Foundation\HINSTANCE.ahk
#Include ..\..\Foundation\HRSRC.ahk
#Include ..\..\Foundation\HGLOBAL.ahk

/**
 * Contains information that the OLE User Interface Library uses to initialize the Change Icon dialog box, and it contains space for the library to return information when the dialog box is dismissed. (ANSI)
 * @remarks
 * > [!NOTE]
  * > The oledlg.h header defines OLEUICHANGEICON as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/oledlg/ns-oledlg-oleuichangeicona
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 * @charset ANSI
 */
class OLEUICHANGEICONA extends Win32Struct
{
    static sizeof => 344

    static packingSize => 8

    /**
     * The size of the structure, in bytes. This field must be filled on input.
     * @type {Integer}
     */
    cbStruct {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * On input, specifies the initialization and creation flags. On exit, it specifies the user's choices. It can be a combination of the following flags.
     * 
     * | Value                                                                                                                                                                        | Meaning                                                                                                                                                                                                     |
     * |------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
     * | **CIF\_SHOWHELP** | Dialog box will display a **Help** button.                                                                                                                                                       |
     * | **CIF\_SELECTCURRENT**   | On input, selects the **Current** radio button on initialization. On exit, specifies that the user selected **Current**.                                                                      |
     * | **CIF\_SELECTDEFAULT**    | On input, selects the **Default** radio button on initialization. On exit, specifies that the user selected **Default**.                                                                        |
     * | **CIF\_SELECTFROMFILE** | On input, selects the **From File** radio button on initialization. On exit, specifies that the user selected **From File**.                                                                    |
     * | **CIF\_USEICONEXE** | Input only. Extracts the icon from the executable specified in the **szIconExe** member, instead of retrieving it from the class. This is useful for OLE embedding or linking to non-OLE files.  |
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The window that owns the dialog box. This member should not be **NULL**.
     * @type {HWND}
     */
    hWndOwner{
        get {
            if(!this.HasProp("__hWndOwner"))
                this.__hWndOwner := HWND(this.ptr + 8)
            return this.__hWndOwner
        }
    }

    /**
     * Pointer to a string to be used as the title of the dialog box. If **NULL**, then the library uses **Change Icon**.
     * @type {PSTR}
     */
    lpszCaption{
        get {
            if(!this.HasProp("__lpszCaption"))
                this.__lpszCaption := PSTR(this.ptr + 16)
            return this.__lpszCaption
        }
    }

    /**
     * Pointer to a hook function that processes messages intended for the dialog box. The hook function must return zero to pass a message that it didn't process back to the dialog box procedure in the library. The hook function must return a nonzero value to prevent the library's dialog box procedure from processing a message it has already processed.
     * @type {Pointer<Ptr>}
     */
    lpfnHook {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Application-defined data that the library passes to the hook function pointed to by the **lpfnHook** member. The library passes a pointer to the **OLEUICHANGEICON** structure in the lParam parameter of the WM\_INITDIALOG message; this pointer can be used to retrieve the **lCustData** member.
     * @type {Pointer}
     */
    lCustData {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Instance that contains a dialog box template specified by the **lpTemplateName** member.
     * @type {HINSTANCE}
     */
    hInstance{
        get {
            if(!this.HasProp("__hInstance"))
                this.__hInstance := HINSTANCE(this.ptr + 40)
            return this.__hInstance
        }
    }

    /**
     * Pointer to a null-terminated string that specifies the name of the resource file for the dialog box template that is to be substituted for the library's **Change Icon** dialog box template.
     * @type {PSTR}
     */
    lpszTemplate{
        get {
            if(!this.HasProp("__lpszTemplate"))
                this.__lpszTemplate := PSTR(this.ptr + 48)
            return this.__lpszTemplate
        }
    }

    /**
     * Customized template handle.
     * @type {HRSRC}
     */
    hResource{
        get {
            if(!this.HasProp("__hResource"))
                this.__hResource := HRSRC(this.ptr + 56)
            return this.__hResource
        }
    }

    /**
     * Current and final image. The source of the icon is embedded in the metafile itself.
     * @type {HGLOBAL}
     */
    hMetaPict{
        get {
            if(!this.HasProp("__hMetaPict"))
                this.__hMetaPict := HGLOBAL(this.ptr + 64)
            return this.__hMetaPict
        }
    }

    /**
     * Input only. The class to use to get the **Default** icon.
     * @type {Pointer<Guid>}
     */
    clsid {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * Input only. Pointer to the executable to extract the default icon from. This member is ignored unless CIF\_USEICONEXE is included in the **dwFlags** member and an attempt to retrieve the class icon from the specified CLSID fails.
     * @type {String}
     */
    szIconExe {
        get => StrGet(this.ptr + 80, 259, "UTF-8")
        set => StrPut(value, this.ptr + 80, 259, "UTF-8")
    }

    /**
     * Input only. The number of characters in **szIconExe**. This member is ignored unless CIF\_USEICONEXE is included in the **dwFlags** member.
     * @type {Integer}
     */
    cchIconExe {
        get => NumGet(this, 340, "int")
        set => NumPut("int", value, this, 340)
    }
}
