#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines the values used by plug-ins to specify which event notifications the plug-ins receive.
 * @remarks
 * The <b>RealTimeStylusDataInterest Enumeration</b> values are used in a bitwise combination that defines the set of data notifications. Use the <b>RealTimeStylusDataInterest Enumeration</b> to specify only the events for which you would like to receive notification. Thus, improving performance.
  * 
  * The <a href="https://docs.microsoft.com/windows/desktop/tablet/realtimestylus-class">RealTimeStylus Class</a> notifies plug-ins when it is retrieving packet data by calling into the respective plug-ins in a specified sequence. You control the sequence and types of plug-ins that receive these notifications. The packet data in the events can be modified by the plug-ins the <b>RealTimeStylus Class</b> object calls into.
  * 
  * You can control which methods are called on your plug-in by implementing the <a href="https://docs.microsoft.com/windows/desktop/api/rtscom/nn-rtscom-istylusplugin">IStylusPlugin Interface</a>:: <a href="https://docs.microsoft.com/windows/desktop/api/rtscom/nf-rtscom-istylusplugin-datainterest">IStylusPlugin::DataInterest Method</a> method.
  * 
  * The following events are the default events:
  * 
  * <ul>
  * <li>RTSDI_RealTimeStylusEnabled</li>
  * <li>RTSDI_RealTimeStylusDisabled</li>
  * <li>RTSDI_StylusDown</li>
  * <li>RTSDI_Packets</li>
  * <li>RTSDI_StylusUp</li>
  * <li>RTSDI_SystemEvents</li>
  * <li>RTSDI_CustomStylusDataAdded</li>
  * </ul>
 * @see https://learn.microsoft.com/windows/win32/api/rtscom/ne-rtscom-realtimestylusdatainterest
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class RealTimeStylusDataInterest{

    /**
     * The plug-in receives notifications for all stylus data.
     * @type {Integer (Int32)}
     */
    static RTSDI_AllData => -1

    /**
     * The plug-in receives no notifications for any stylus data.
     * @type {Integer (Int32)}
     */
    static RTSDI_None => 0

    /**
     * An error has been added to the input queue.
     * @type {Integer (Int32)}
     */
    static RTSDI_Error => 1

    /**
     * The <a href="https://docs.microsoft.com/windows/desktop/tablet/realtimestylus-class">RealTimeStylus Class</a> object has been enabled.
     * @type {Integer (Int32)}
     */
    static RTSDI_RealTimeStylusEnabled => 2

    /**
     * The <a href="https://docs.microsoft.com/windows/desktop/tablet/realtimestylus-class">RealTimeStylus Class</a> object has been disabled.
     * @type {Integer (Int32)}
     */
    static RTSDI_RealTimeStylusDisabled => 4

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/tablet/realtimestylus-class">RealTimeStylus Class</a> object encounters a new Stylus object.
     * @type {Integer (Int32)}
     */
    static RTSDI_StylusNew => 8

    /**
     * The Stylus object is in range of the digitizer. Notifies the implementing plug-in that the stylus is entering the input area of the <a href="https://docs.microsoft.com/windows/desktop/tablet/realtimestylus-class">RealTimeStylus Class</a> object or is entering the detection range of the digitizer above the input area of the <b>RealTimeStylus Class</b> object.
     * @type {Integer (Int32)}
     */
    static RTSDI_StylusInRange => 16

    /**
     * The <a href="https://docs.microsoft.com/windows/desktop/tablet/realtimestylus-class">RealTimeStylus Class</a> object is within range of, but not touching, the digitizer and is moving.
     * @type {Integer (Int32)}
     */
    static RTSDI_InAirPackets => 32

    /**
     * The <a href="https://docs.microsoft.com/windows/desktop/tablet/realtimestylus-class">RealTimeStylus Class</a> object is out of range of the digitizer. Informs the implementing plug-in that the stylus is leaving the input area of the <b>RealTimeStylus Class</b> object or is leaving the detection range of the digitizer above the input area of the <b>RealTimeStylus Class</b> object.
     * @type {Integer (Int32)}
     */
    static RTSDI_StylusOutOfRange => 64

    /**
     * The stylus is in contact with the digitizer.
     * @type {Integer (Int32)}
     */
    static RTSDI_StylusDown => 128

    /**
     * The stylus is moving and is in contact with the digitizer.
     * @type {Integer (Int32)}
     */
    static RTSDI_Packets => 256

    /**
     * The stylus has broken physical contact with the digitizer.
     * @type {Integer (Int32)}
     */
    static RTSDI_StylusUp => 512

    /**
     * A user has released a stylus button.
     * @type {Integer (Int32)}
     */
    static RTSDI_StylusButtonUp => 1024

    /**
     * A user has pressed a stylus button.
     * @type {Integer (Int32)}
     */
    static RTSDI_StylusButtonDown => 2048

    /**
     * A system event has been detected.
     * @type {Integer (Int32)}
     */
    static RTSDI_SystemEvents => 4096

    /**
     * A new tablet device has been detected by the system. Notifies the implementing plug-in when a Microsoft.Ink.Tablet object is added to the system.
     * @type {Integer (Int32)}
     */
    static RTSDI_TabletAdded => 8192

    /**
     * A tablet device has been removed from the system. Notifies the implementing plug-in when a Microsoft.Ink.Tablet object is removed from the system.
     * @type {Integer (Int32)}
     */
    static RTSDI_TabletRemoved => 16384

    /**
     * A plug-in has added data to a queue. You can identify the kind of custom data by either the GUID or Type.
     * @type {Integer (Int32)}
     */
    static RTSDI_CustomStylusDataAdded => 32768

    /**
     * A tablet mapping to the screen has been changed or set.
     * @type {Integer (Int32)}
     */
    static RTSDI_UpdateMapping => 65536

    /**
     * The plug-in receives the default stylus data.
     * @type {Integer (Int32)}
     */
    static RTSDI_DefaultEvents => 37766
}
