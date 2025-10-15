#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOL.ahk
#Include ..\..\Foundation\HANDLE.ahk

/**
 * The DD_MAPMEMORYDATA structure contains the information necessary to map or unmap a frame buffer into user-mode memory.
 * @see https://docs.microsoft.com/windows/win32/api//ddrawint/ns-ddrawint-dd_mapmemorydata
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class DD_MAPMEMORYDATA extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * Points to a <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_directdraw_global">DD_DIRECTDRAW_GLOBAL</a> structure that describes the driver's device.
     * @type {Pointer<DD_DIRECTDRAW_GLOBAL>}
     */
    lpDD {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Specifies the memory operation that the driver should perform. A value of <b>TRUE</b> indicates that the driver should map memory; <b>FALSE</b> means that the driver should unmap memory.
     * @type {BOOL}
     */
    bMap{
        get {
            if(!this.HasProp("__bMap"))
                this.__bMap := BOOL(this.ptr + 8)
            return this.__bMap
        }
    }

    /**
     * Handle to the process whose address space is affected.
     * @type {HANDLE}
     */
    hProcess{
        get {
            if(!this.HasProp("__hProcess"))
                this.__hProcess := HANDLE(this.ptr + 16)
            return this.__hProcess
        }
    }

    /**
     * Specifies the location in which the driver should return the base address of the process's memory-mapped space when <b>bMap</b> is <b>TRUE</b>. When <b>bMap</b> is <b>FALSE</b>, <b>fpProcess</b> contains the base address of the memory to be unmapped by the driver.
     * @type {Pointer}
     */
    fpProcess {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Specifies the location in which the driver writes the return value of the <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_mapmemory">DdMapMemory</a> callback. A return code of DD_OK indicates success. For more information, see <a href="https://docs.microsoft.com/windows-hardware/drivers/display/return-values-for-directdraw">Return Values for DirectDraw</a>.
     * @type {HRESULT}
     */
    ddRVal {
        get => NumGet(this, 32, "int")
        set => NumPut("int", value, this, 32)
    }
}
