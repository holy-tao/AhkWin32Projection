#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DD_UPDATENONLOCALHEAPDATA structure contains the required heap information.
 * @see https://learn.microsoft.com/windows/win32/api/ddrawint/ns-ddrawint-dd_updatenonlocalheapdata
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class DD_UPDATENONLOCALHEAPDATA extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * Points to the <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_directdraw_global">DD_DIRECTDRAW_GLOBAL</a> structure that describes the driver's device.
     * @type {Pointer<DD_DIRECTDRAW_GLOBAL>}
     */
    lpDD {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Indicates the ordinal number of the heap for which data is being requested.
     * @type {Integer}
     */
    dwHeap {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Points to the linear graphic address remapping table (GART) address of the start of the heap.
     * @type {Pointer}
     */
    fpGARTLin {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Points to the physical GART address of the start of the heap.
     * @type {Pointer}
     */
    fpGARTDev {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Indicates the maximum amount of AGP memory to use.
     * @type {Pointer}
     */
    ulPolicyMaxBytes {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Specifies the location in which the driver writes the return value of the <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_getdriverinfo">DdGetDriverInfo</a> callback for a GUID_UpdateNonLocalHeap query. A return code of DD_OK indicates success. For more information, see <a href="https://docs.microsoft.com/windows-hardware/drivers/display/return-values-for-directdraw">Return Values for DirectDraw</a>.
     * @type {Integer}
     */
    ddRVal {
        get => NumGet(this, 40, "int")
        set => NumPut("int", value, this, 40)
    }

    /**
     * Unused on Microsoft Windows 2000 and later versions of the operating system.
     * @type {Pointer<Void>}
     */
    UpdateNonLocalHeap {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }
}
