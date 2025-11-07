#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\HSEMAPHORE.ahk

/**
 * The ENGSAFESEMAPHORE structure provides the driver with a thread-safe semaphore.
 * @remarks
 * 
 * A safe semaphore is a wrapper that contains a handle to a semaphore and a reference count on that semaphore.
 * 
 * The driver allocates an ENGSAFESEMAPHORE structure and passes it to <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-enginitializesafesemaphore">EngInitializeSafeSemaphore</a> for initialization. GDI operates the safe semaphore under a lock and maintains a reference count on it, making it suitable for multithreading.
 * 
 * Once the safe semaphore is initialized, the driver can call <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-engacquiresemaphore">EngAcquireSemaphore</a> and <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-engreleasesemaphore">EngReleaseSemaphore</a> with the <b>hsem</b> for synchronization.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//winddi/ns-winddi-engsafesemaphore
 * @namespace Windows.Win32.Devices.Display
 * @version v4.0.30319
 */
class ENGSAFESEMAPHORE extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Handle to the semaphore.
     * @type {HSEMAPHORE}
     */
    hsem{
        get {
            if(!this.HasProp("__hsem"))
                this.__hsem := HSEMAPHORE(0, this)
            return this.__hsem
        }
    }

    /**
     * Specifies the reference count on the semaphore.
     * @type {Integer}
     */
    lCount {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }
}
