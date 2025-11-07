#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The VMRGUID structure is a member of the VMRMONITORINFO structure and is used to identify a monitor on the system (VMR-7 only).
 * @remarks
 * 
 * In DirectX 9.0 and later, the monitor is identified by an integer index, not by a GUID.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//strmif/ns-strmif-vmrguid
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class VMRGUID extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Pointer to the GUID member of the structure. <b>pGUID</b> is <b>NULL</b> if the monitor is the default DirectDraw device.
     * @type {Pointer<Guid>}
     */
    pGUID {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Specifies the GUID for the monitor.
     * @type {Pointer<Guid>}
     */
    GUID {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
