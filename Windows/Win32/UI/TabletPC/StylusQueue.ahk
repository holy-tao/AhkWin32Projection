#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the queue to which stylus data is added.
 * @remarks
 * 
  * After the packet data is processed by the synchronous plug-in, it is added to the output queue. The asynchronous plug-in extracts the data from the queue. The amount of data that can be held in the queue is based on the Pen Input Service internal queue and is limited to approximately 10 seconds worth of data. After the queue is full, all successive packets are lost. The queue is used only as a data store. You can process the data from the queue or add your customized data to the queue.
  * 
  * The input queue is an alternative input source for the <a href="https://docs.microsoft.com/windows/desktop/tablet/realtimestylus-class">RealTimeStylus Class</a> object. The Pen Input Service is given priority when the <b>RealTimeStylus Class</b> object checks for the next packet data to process. The input queue can be used to send data to all plug-ins while the output queue is used to send data to asynchronous plug-ins only.
  * 
  * The packet data process flow is the following:
  * 
  * <ol>
  * <li>The <a href="https://docs.microsoft.com/windows/desktop/tablet/realtimestylus-class">RealTimeStylus Class</a> object sends packet data to the synchronous plug-ins.</li>
  * <li>The <a href="https://docs.microsoft.com/windows/desktop/tablet/realtimestylus-class">RealTimeStylus Class</a> object stores the processed packet data in the output queue.</li>
  * <li>The <a href="https://docs.microsoft.com/windows/desktop/tablet/realtimestylus-class">RealTimeStylus Class</a> object checks for pending packet data in the input queue. If there is pending packet data, that packet data is picked up and processed from step 1.</li>
  * <li>The <a href="https://docs.microsoft.com/windows/desktop/tablet/realtimestylus-class">RealTimeStylus Class</a> object checks for any pending packet data from the Pen Input Service. If there is pending packet data, it is picked up and processed from step 1.</li>
  * <li>Repeat steps 3 and 4.</li>
  * </ol>
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//rtscom/ne-rtscom-stylusqueue
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class StylusQueue{

    /**
     * Data is added to the input queue. When data is added to the input queue, it is automatically added to the output queue.
     * @type {Integer (Int32)}
     */
    static SyncStylusQueue => 1

    /**
     * Data is added to the output queue. The data is added before any data currently being processed.
     * @type {Integer (Int32)}
     */
    static AsyncStylusQueueImmediate => 2

    /**
     * Data is added to the output queue.
     * @type {Integer (Int32)}
     */
    static AsyncStylusQueue => 3
}
