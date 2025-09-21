#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The PORT\_INFO\_3 structure specifies the status value of a printer port.
 * @remarks
 * When you set a printer port status value with the severity value PORT\_STATUS\_TYPE\_ERROR, the print spooler stops sending jobs to the port. The print spooler does not resume sending jobs to the port until another [**SetPort**](setport.md) call is made to clear the status.
 * @see https://learn.microsoft.com/windows/win32/printdocs/port-info-3
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 * @charset ANSI
 */
class PORT_INFO_3A extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * The new port status value. This value is used only if the **pszStatus** member is **NULL**.
     * 
     * This member can be one of the following values.
     * 
     * 
     * 
     * | Value                            | Meaning                                             |
     * |----------------------------------|-----------------------------------------------------|
     * | 0                                | Clears the printer port status.                     |
     * | PORT\_STATUS\_OFFLINE            | The port's printer is offline.                      |
     * | PORT\_STATUS\_PAPER\_JAM         | The port's printer has a paper jam.                 |
     * | PORT\_STATUS\_PAPER\_OUT         | The port's printer is out of paper.                 |
     * | PORT\_STATUS\_OUTPUT\_BIN\_FULL  | The port's printer's output bin is full.            |
     * | PORT\_STATUS\_PAPER\_PROBLEM     | The port's printer has a paper problem.             |
     * | PORT\_STATUS\_NO\_TONER          | The port's printer is out of toner.                 |
     * | PORT\_STATUS\_DOOR\_OPEN         | The door of the port's printer is open.             |
     * | PORT\_STATUS\_USER\_INTERVENTION | The port's printer requires user intervention.      |
     * | PORT\_STATUS\_OUT\_OF\_MEMORY    | The port's printer is out of memory.                |
     * | PORT\_STATUS\_TONER\_LOW         | The port's printer is low on toner.                 |
     * | PORT\_STATUS\_WARMING\_UP        | The port's printer is warming up.                   |
     * | PORT\_STATUS\_POWER\_SAVE        | The port's printer is in a power-conservation mode. |
     * @type {Integer}
     */
    dwStatus {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Pointer to a new printer port status value string to set. Use this member if there is no suitable status value among those listed for **dwStatus**.
     * @type {Pointer<Byte>}
     */
    pszStatus {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The severity of the port status value.
     * 
     * This member can be one of the following values.
     * 
     * 
     * 
     * | Value                       | Meaning                                   |
     * |-----------------------------|-------------------------------------------|
     * | PORT\_STATUS\_TYPE\_ERROR   | The port status value indicates an error. |
     * | PORT\_STATUS\_TYPE\_WARNING | The port status value is a warning.       |
     * | PORT\_STATUS\_TYPE\_INFO    | The port status value is informational.   |
     * @type {Integer}
     */
    dwSeverity {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
