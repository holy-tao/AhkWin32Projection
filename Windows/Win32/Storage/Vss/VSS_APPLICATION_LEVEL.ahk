#Requires AutoHotkey v2.0.0 64-bit

/**
 * Indicates the application level, the point in the course of the creation of a shadow copy that a writer is notified of a freeze.
 * @remarks
 * 
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
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//vss/ne-vss-vss_application_level
 * @namespace Windows.Win32.Storage.Vss
 * @version v4.0.30319
 */
class VSS_APPLICATION_LEVEL{

    /**
     * The level at which this writer's freeze state will occur is not known. This indicates an application 
 *       error.
     * @type {Integer (Int32)}
     */
    static VSS_APP_UNKNOWN => 0

    /**
     * This writer freeze state will occur at the system application level.
     * @type {Integer (Int32)}
     */
    static VSS_APP_SYSTEM => 1

    /**
     * This writer freeze state will occur at the back-end application level.
     * @type {Integer (Int32)}
     */
    static VSS_APP_BACK_END => 2

    /**
     * This writer freeze state will occur at the front-end application level.
     * @type {Integer (Int32)}
     */
    static VSS_APP_FRONT_END => 3

    /**
     * 
     * @type {Integer (Int32)}
     */
    static VSS_APP_SYSTEM_RM => 4

    /**
     * This writer freeze state will be determined automatically. This enumeration value is reserved for future 
 *       use.
     * @type {Integer (Int32)}
     */
    static VSS_APP_AUTO => -1
}
