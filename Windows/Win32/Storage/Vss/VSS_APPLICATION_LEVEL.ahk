#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicates the application level, the point in the course of the creation of a shadow copy that a writer is notified of a freeze.
 * @remarks
 * <b>VSS_APPLICATION_LEVEL</b> is provided to allow 
 *     application developers to control at what point a writer will receive a Freeze event. This may be important if one 
 *     writer uses or depends on another writer.
 * 
 * For instance, if an application <i>X</i> is storing data using application 
 *     <i>Y</i> as an intermediate layer (for example, if <i>Y</i> implements a 
 *     database used by <i>X</i>), we would describe <i>X</i> as a front-end 
 *     application, and <i>Y</i> as a back-end application.
 * 
 * In this example, when freezing applications that participate in a shadow copy, you would want 
 *     <i>X</i> (the front-end application) to suspend its writes to the database prior to freezing 
 *     <i>Y </i>(the back-end application), the database service itself.
 * 
 * The application level of a writer is set by 
 *     <a href="https://docs.microsoft.com/windows/desktop/api/vswriter/nf-vswriter-cvsswriter-initialize">CVssWriter::Initialize</a> and retrieved by 
 *     <a href="https://docs.microsoft.com/windows/desktop/api/vswriter/nf-vswriter-cvsswriter-getcurrentlevel">CVssWriter::GetCurrentLevel</a>.
 * @see https://learn.microsoft.com/windows/win32/api/vss/ne-vss-vss_application_level
 * @namespace Windows.Win32.Storage.Vss
 */
class VSS_APPLICATION_LEVEL extends Win32Enum {

    /**
     * The level at which this writer's freeze state will occur is not known. This indicates an application 
     *       error.
     * Native name: VSS_APP_UNKNOWN
     * @type {Integer (Int32)}
     */
    static APP_UNKNOWN => 0

    /**
     * This writer freeze state will occur at the system application level.
     * Native name: VSS_APP_SYSTEM
     * @type {Integer (Int32)}
     */
    static APP_SYSTEM => 1

    /**
     * This writer freeze state will occur at the back-end application level.
     * Native name: VSS_APP_BACK_END
     * @type {Integer (Int32)}
     */
    static APP_BACK_END => 2

    /**
     * This writer freeze state will occur at the front-end application level.
     * Native name: VSS_APP_FRONT_END
     * @type {Integer (Int32)}
     */
    static APP_FRONT_END => 3

    /**
     * Native name: VSS_APP_SYSTEM_RM
     * @type {Integer (Int32)}
     */
    static APP_SYSTEM_RM => 4

    /**
     * This writer freeze state will be determined automatically. This enumeration value is reserved for future 
     *       use.
     * Native name: VSS_APP_AUTO
     * @type {Integer (Int32)}
     */
    static APP_AUTO => -1
}
