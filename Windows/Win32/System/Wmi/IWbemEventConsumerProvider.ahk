#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWbemUnboundObjectSink.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Provides the primary interface for an event consumer provider. Through this interface and the FindConsumer method, an event consumer provider can indicate which event consumers should receive a given event.
 * @see https://learn.microsoft.com/windows/win32/api/wbemprov/nn-wbemprov-iwbemeventconsumerprovider
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class IWbemEventConsumerProvider extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWbemEventConsumerProvider
     * @type {Guid}
     */
    static IID => Guid("{e246107a-b06e-11d0-ad61-00c04fd8fdff}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["FindConsumer"]

    /**
     * The FindConsumer function locates and returns sink objects to which WMI can send events.
     * @remarks
     * Windows Management delivers events in the form of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nn-wbemcli-iwbemclassobject">IWbemClassObject</a> to logical consumers registered within the schema. A consumer provider implements 
     * <b>FindConsumer</b> to provide an event sink to Windows Management whenever events must be delivered to the logical consumer.
     * 
     * Windows Management recognizes the logical consumer object and has the event objects ready for delivery. To deliver an event object, WMI then calls 
     * <b>FindConsumer</b>. The consumer provider must create an event sink object (a pointer to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemprov/nn-wbemprov-iwbemunboundobjectsink">IWbemUnboundObjectSink</a>), and return the pointer to Windows Management so that the events can be delivered.
     * 
     * Using this technique, a single event consumer provider can handle delivery of events to many different logical consumers by returning different 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemprov/nn-wbemprov-iwbemunboundobjectsink">IWbemUnboundObjectSink</a> pointers for each.
     * 
     * You may implement 
     * <b>FindConsumer</b> in several ways:
     * 
     * <ul>
     * <li>
     * Provide a single sink for all logical consumers.
     * 
     * This approach is the most efficient in terms of space because only one COM object is stored in memory. For example, consider an event consumer provider supplying sinks for logical consumers that log messages to files: The single sink bears the responsibility for examining the data included with each logical consumer and determining how to proceed. Most likely, each event received involves opening a log file, logging the message, and closing the file. While efficient in terms of space, this strategy involves a significant amount of processing time.
     * 
     * </li>
     * <li>
     * Provide a different sink for each logical consumer.
     * 
     * This approach optimizes performance by having a dedicated sink ready to receive an event as the event occurs. This strategy is faster than a single sink, but less efficient because of its cost in terms of memory. Because each sink maintains its own log file, the file can always be open and ready to log messages as events occur. The sink can then close the file when WMI releases the sink after a time-out, providing efficient performance both in high-speed and in low-speed delivery scenarios.
     * 
     * </li>
     * <li>
     * Divide logical consumers into groups and provide a different sink for each group.
     * 
     * This approach compromises between performance and efficiency. The hybrid approach can involve having a few different log files, possibly with each tied to the type of message to be logged. Multiple COM objects handle multiple open files. An event consumer provider taking this approach reads the log file name during the 
     * <b>FindConsumer</b> call, opens the file, and returns the sink that logs all messages into this file. The provider closes the file on the last call to the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a> method. With this approach, the consumer preserves efficiency because it has information on exactly which file to use; the consumer is not required to search for or open a new file. Also, the consumer can save memory by combining sinks that log different messages to the same file.
     * 
     * </li>
     * </ul>
     * Regardless of approach, your implementation should depend on the existence of an event consumer provider. WMI releases an event consumer provider after a designated interval has elapsed between calls. Because WMI needs your event consumer provider only to supply pointers to sinks for new logical consumers, WMI can release your event consumer provider after your provider services all logical consumers in question. The sinks, however, must remain to receive all of the events that occur.
     * @param {IWbemClassObject} pLogicalConsumer Pointer to the logical consumer object to which the event objects are to be delivered.
     * @returns {IWbemUnboundObjectSink} Returns an event object sink to Windows Management. Windows Management calls <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">AddRef</a> for this pointer and deliver the events associated with the logical consumer to this sink. Eventually, after a suitable time-out, Windows Management calls <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a> for the pointer.
     * @see https://learn.microsoft.com/windows/win32/api/wbemprov/nf-wbemprov-iwbemeventconsumerprovider-findconsumer
     */
    FindConsumer(pLogicalConsumer) {
        result := ComCall(3, this, "ptr", pLogicalConsumer, "ptr*", &ppConsumer := 0, "HRESULT")
        return IWbemUnboundObjectSink(ppConsumer)
    }
}
