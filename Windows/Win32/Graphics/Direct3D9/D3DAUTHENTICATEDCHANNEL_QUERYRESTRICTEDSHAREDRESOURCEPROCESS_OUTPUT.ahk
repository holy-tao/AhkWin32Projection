#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D_OMAC.ahk
#Include ..\..\Foundation\HANDLE.ahk
#Include .\D3DAUTHENTICATEDCHANNEL_QUERY_OUTPUT.ahk

/**
 * Contains the response to a D3DAUTHENTICATEDQUERY\_RESTRICTEDSHAREDRESOURCEPROCESS query.
 * @remarks
 * The Desktop Window Manager (DWM) process is identified by setting **ProcessIdentifier** equal to **PROCESSIDTYPE\_DWM**. Other processes are identified by setting the process handle in **ProcessHandle** and setting **ProcessIdentifier** equal to **PROCESSIDTYPE\_HANDLE**.
 * @see https://learn.microsoft.com/windows/win32/medfound/d3dauthenticatedchannel-queryrestrictedsharedresourceprocess-output
 * @namespace Windows.Win32.Graphics.Direct3D9
 * @version v4.0.30319
 */
class D3DAUTHENTICATEDCHANNEL_QUERYRESTRICTEDSHAREDRESOURCEPROCESS_OUTPUT extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * A [**D3DAUTHENTICATEDCHANNEL\_QUERY\_OUTPUT**](d3dauthenticatedchannel-query-output.md) structure that contains a Message Authentication Code (MAC) and other data.
     * @type {D3DAUTHENTICATEDCHANNEL_QUERY_OUTPUT}
     */
    Output{
        get {
            if(!this.HasProp("__Output"))
                this.__Output := D3DAUTHENTICATEDCHANNEL_QUERY_OUTPUT(this.ptr + 0)
            return this.__Output
        }
    }

    /**
     * The index of the process in the list of processes.
     * @type {Integer}
     */
    ProcessIndex {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * A [**D3DAUTHENTICATEDCHANNEL\_PROCESSIDENTIFIERTYPE**](d3dauthenticatedchannel-processidentifiertype.md) value that specifies the type of process.
     * @type {Integer}
     */
    ProcessIdentifer {
        get => NumGet(this, 44, "int")
        set => NumPut("int", value, this, 44)
    }

    /**
     * A process handle. If the **ProcessIdentifier** member equals **PROCESSIDTYPE\_HANDLE**, the **ProcessHandle** member contains a valid handle to a process. Otherwise, this member is ignored.
     * @type {HANDLE}
     */
    ProcessHandle{
        get {
            if(!this.HasProp("__ProcessHandle"))
                this.__ProcessHandle := HANDLE(this.ptr + 48)
            return this.__ProcessHandle
        }
    }
}
