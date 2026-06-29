#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HDEV.ahk" { HDEV }
#Import ".\DHPDEV.ahk" { DHPDEV }

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
 */
export default struct DRIVEROBJ {
    #StructPack 8

    /**
     * Pointer to the driver resource that will be tracked by the DRIVEROBJ structure. The resource is associated with the current client process.
     */
    pvObj : IntPtr

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
     */
    pFreeProc : IntPtr

    /**
     * GDI handle to the physical device associated with the object.
     */
    hdev : HDEV

    /**
     * Pointer to the driver's private instance data; that is, this member identifies the driver's <a href="https://docs.microsoft.com/windows-hardware/drivers/">PDEV</a>.
     */
    dhpdev : DHPDEV

}
