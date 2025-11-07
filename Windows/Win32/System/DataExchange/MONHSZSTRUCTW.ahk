#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\HSZ.ahk
#Include ..\..\Foundation\HANDLE.ahk

/**
 * Contains information about a Dynamic Data Exchange (DDE) string handle. A DDE monitoring application can use this structure when monitoring the activity of the string manager component of the DDE Management Library.
 * @remarks
 * 
 * > [!NOTE]
 * > The ddeml.h header defines MONHSZSTRUCT as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * 
 * @see https://docs.microsoft.com/windows/win32/api//ddeml/ns-ddeml-monhszstructw
 * @namespace Windows.Win32.System.DataExchange
 * @version v4.0.30319
 * @charset Unicode
 */
class MONHSZSTRUCTW extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * Type: <b>UINT</b>
     * 
     * The structure's size, in bytes.
     * @type {Integer}
     */
    cb {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>BOOL</b>
     * 
     * The action being performed on the string identified by the <b>hsz</b> member. 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MH_CLEANUP"></a><a id="mh_cleanup"></a><dl>
     * <dt><b>MH_CLEANUP</b></dt>
     * <dt>4</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An application is freeing its DDE resources, causing the system to delete string handles the application had created. (The application called the <a href="https://docs.microsoft.com/windows/desktop/api/ddeml/nf-ddeml-ddeuninitialize">DdeUninitialize</a> function.)
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MH_CREATE"></a><a id="mh_create"></a><dl>
     * <dt><b>MH_CREATE</b></dt>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An application is creating a string handle. (The application called the <a href="https://docs.microsoft.com/windows/desktop/api/ddeml/nf-ddeml-ddecreatestringhandlea">DdeCreateStringHandle</a> function.)
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MH_DELETE"></a><a id="mh_delete"></a><dl>
     * <dt><b>MH_DELETE</b></dt>
     * <dt>3</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An application is deleting a string handle. (The application called the <a href="https://docs.microsoft.com/windows/desktop/api/ddeml/nf-ddeml-ddefreestringhandle">DdeFreeStringHandle</a> function.)
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MH_KEEP"></a><a id="mh_keep"></a><dl>
     * <dt><b>MH_KEEP</b></dt>
     * <dt>2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An application is increasing the usage count of a string handle. (The application called the <a href="https://docs.microsoft.com/windows/desktop/api/ddeml/nf-ddeml-ddekeepstringhandle">DdeKeepStringHandle</a> function.)
     * 
     * </td>
     * </tr>
     * </table>
     * @type {BOOL}
     */
    fsAction {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The Windows time at which the action specified by the <b>fsAction</b> member takes place. Windows time is the number of milliseconds that have elapsed since the system was booted.
     * @type {Integer}
     */
    dwTime {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Type: <b>HSZ</b>
     * 
     * A handle to the string. Because string handles are local to the process, this member is a global atom.
     * @type {HSZ}
     */
    hsz{
        get {
            if(!this.HasProp("__hsz"))
                this.__hsz := HSZ(16, this)
            return this.__hsz
        }
    }

    /**
     * Type: <b>HANDLE</b>
     * 
     * A handle to the task (application instance) performing the action on the string handle.
     * @type {HANDLE}
     */
    hTask{
        get {
            if(!this.HasProp("__hTask"))
                this.__hTask := HANDLE(24, this)
            return this.__hTask
        }
    }

    /**
     * Type: <b>TCHAR[1]</b>
     * 
     * Pointer to the string identified by the <b>hsz</b> member.
     * @type {String}
     */
    str {
        get => StrGet(this.ptr + 32, 0, "UTF-16")
        set => StrPut(value, this.ptr + 32, 0, "UTF-16")
    }
}
