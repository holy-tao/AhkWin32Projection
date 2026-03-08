#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Represents service status notification information. (ANSI)
 * @remarks
 * The callback function is declared as follows:
 * 
 * 
 * ``` syntax
 * typedef VOID( CALLBACK * PFN_SC_NOTIFY_CALLBACK ) (
 *     IN PVOID pParameter 
 * );
 * ```
 * 
 * The callback function receives a pointer to the <b>SERVICE_NOTIFY</b> structure provided by the caller.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The winsvc.h header defines SERVICE_NOTIFY_2 as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/winsvc/ns-winsvc-service_notify_2a
 * @namespace Windows.Win32.System.Services
 * @version v4.0.30319
 */
class SERVICE_NOTIFY extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_NOTIFY_CREATED => 128

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_NOTIFY_CONTINUE_PENDING => 16

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_NOTIFY_DELETE_PENDING => 512

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_NOTIFY_DELETED => 256

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_NOTIFY_PAUSE_PENDING => 32

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_NOTIFY_PAUSED => 64

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_NOTIFY_RUNNING => 8

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_NOTIFY_START_PENDING => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_NOTIFY_STOP_PENDING => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_NOTIFY_STOPPED => 1
}
