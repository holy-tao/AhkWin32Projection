#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HSEMAPHORE.ahk" { HSEMAPHORE }

/**
 * The ENGSAFESEMAPHORE structure provides the driver with a thread-safe semaphore.
 * @remarks
 * A safe semaphore is a wrapper that contains a handle to a semaphore and a reference count on that semaphore.
 * 
 * The driver allocates an ENGSAFESEMAPHORE structure and passes it to <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-enginitializesafesemaphore">EngInitializeSafeSemaphore</a> for initialization. GDI operates the safe semaphore under a lock and maintains a reference count on it, making it suitable for multithreading.
 * 
 * Once the safe semaphore is initialized, the driver can call <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-engacquiresemaphore">EngAcquireSemaphore</a> and <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-engreleasesemaphore">EngReleaseSemaphore</a> with the <b>hsem</b> for synchronization.
 * @see https://learn.microsoft.com/windows/win32/api/winddi/ns-winddi-engsafesemaphore
 * @namespace Windows.Win32.Devices.Display
 */
export default struct ENGSAFESEMAPHORE {
    #StructPack 8

    /**
     * Handle to the semaphore.
     */
    hsem : HSEMAPHORE

    /**
     * Specifies the reference count on the semaphore.
     */
    lCount : Int32

}
