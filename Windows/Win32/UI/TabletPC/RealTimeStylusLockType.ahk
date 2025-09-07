#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the locks within the RealTimeStylus Class object that protect the RealTimeStylus Class object's members and properties from modification.
 * @remarks
 * You can use these locks when you need to protect access to the plug-in collections or properties of the <a href="https://docs.microsoft.com/windows/desktop/tablet/realtimestylus-class">RealTimeStylus Class</a> object through the <a href="https://docs.microsoft.com/windows/desktop/api/rtscom/nn-rtscom-irealtimestylussynchronization">IRealTimeStylusSynchronization Interface</a> interface.
  * 
  * For example, the window's handle can be locked to prevent it from being altered.
 * @see https://learn.microsoft.com/windows/win32/api/rtscom/ne-rtscom-realtimestyluslocktype
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class RealTimeStylusLockType{

    /**
     * The object lock protects the <a href="https://docs.microsoft.com/windows/desktop/tablet/realtimestylus-class">RealTimeStylus Class</a> object's members and properties from modification.
     * @type {Integer (Int32)}
     */
    static RTSLT_ObjLock => 1

    /**
     * The object lock protects the synchronous plug-in collection from modification during event broadcasts.
     * @type {Integer (Int32)}
     */
    static RTSLT_SyncEventLock => 2

    /**
     * The object lock protects the asynchronous plug-in collection from modification during event broadcasts.
     * @type {Integer (Int32)}
     */
    static RTSLT_AsyncEventLock => 4

    /**
     * The system excludes callbacks from the object's event or modification lock.
     * @type {Integer (Int32)}
     */
    static RTSLT_ExcludeCallback => 8

    /**
     * The object lock protects the <a href="https://docs.microsoft.com/windows/desktop/tablet/realtimestylus-class">RealTimeStylus Class</a> synchronous object's members and properties from modification.
     * @type {Integer (Int32)}
     */
    static RTSLT_SyncObjLock => 11

    /**
     * The object lock protects the <a href="https://docs.microsoft.com/windows/desktop/tablet/realtimestylus-class">RealTimeStylus Class</a> asynchronous object's members and properties from modification.
     * @type {Integer (Int32)}
     */
    static RTSLT_AsyncObjLock => 13
}
