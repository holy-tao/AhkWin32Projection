#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The BRUSHOBJ structure contains three public members that describe a brush object.
 * @remarks
 * 
 * Drivers can call <i>BRUSHOBJ_Xxx</i> service routines to realize brushes or to find previously realized brushes.
 * 
 * If the <b>iSolidColor</b> member is 0xFFFFFFFF or the <b>pvRbrush</b> member is <b>NULL</b>, the driver must call the <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-brushobj_pvgetrbrush">BRUSHOBJ_pvGetRbrush</a> function to realize the brush.
 * 
 * If neither BR_HOST_ICM or BR_DEVICE_ICM are set, ICM is not enabled in the graphics engine or in the driver.
 * 
 * For a description of the FLONG data type, see <a href="https://docs.microsoft.com/windows-hardware/drivers/display/gdi-data-types">GDI Data Types</a>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//winddi/ns-winddi-brushobj
 * @namespace Windows.Win32.Devices.Display
 * @version v4.0.30319
 */
class BRUSHOBJ extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Specifies the color index of a solid brush. This index has been translated to the target surface's palette. Drawing can proceed without realization of the brush. A value of 0xFFFFFFFF indicates that a nonsolid brush must be realized.
     * @type {Integer}
     */
    iSolidColor {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Pointer to the driver's realized brush.
     * @type {Pointer<Void>}
     */
    pvRbrush {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * 
     * @type {Integer}
     */
    flColorType {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
