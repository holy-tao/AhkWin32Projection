#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DRIVEROBJ structure is used to track a resource, allocated by a driver, that requires use GDI services.
 * @remarks
 * A DRIVEROBJ structure allows a display driver to request the GDI service in managing per-process resources. By creating a DRIVEROBJ structure, a display driver can ensure that resources will be released when an application terminates.
  * 
  * Some drivers, in their Escape support, allocate resources on behalf of applications. In such cases, the DRIVEROBJ structure provides a means for the application to notify the driver when it terminates. GDI will call the driver's cleanup function for each DRIVEROBJ structure allocated in an application's context that is not deleted before the application terminates.
  * 
  * This structure provides a locking mechanism for exclusive access to the associated resource.
 * @see https://learn.microsoft.com/windows/win32/api/winddi/ns-winddi-driverobj
 * @namespace Windows.Win32.Devices.Display
 * @version v4.0.30319
 */
class DRIVEROBJ extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Pointer to the driver resource that will be tracked by the DRIVEROBJ structure. The resource is associated with the current client process.
     * @type {Pointer<Void>}
     */
    pvObj {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Pointer to a driver-supplied callback function that frees the resource pointed to by <b>pvObj</b>. This callback function has the following prototype:
     * 
     * 
     * ```
     * BOOL (CALLBACK * FREEOBJPROC) (DRIVEROBJ * pDriverObj);
     * ```
     * 
     * 
     * The callback function returns <b>TRUE</b> if it is able to free the resource, and <b>FALSE</b> otherwise.
     * @type {Pointer<FREEOBJPROC>}
     */
    pFreeProc {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * GDI handle to the physical device associated with the object.
     * @type {Pointer<HDEV>}
     */
    hdev {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Pointer to the driver's private instance data; that is, this member identifies the driver's <a href="https://docs.microsoft.com/windows-hardware/drivers/">PDEV</a>.
     * @type {Pointer<DHPDEV>}
     */
    dhpdev {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
