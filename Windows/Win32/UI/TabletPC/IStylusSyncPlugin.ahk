#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IStylusPlugin.ahk

/**
 * Represents a synchronous plug-in that can be added to the RealTimeStylus Class object's synchronous plug-in collection.
 * @remarks
 * 
 * This is the synchronous version of <a href="https://docs.microsoft.com/windows/desktop/api/rtscom/nn-rtscom-istylusplugin">IStylusPlugin Interface</a>. It provides for strong type checking in the synchronous plug-in collections.
 * 
 * This plug-in receives notifications of <a href="https://docs.microsoft.com/windows/desktop/tablet/realtimestylus-class">RealTimeStylus Class</a> events enabling you to do custom processing.
 * 
 * The dynamic renderer and gesture recognizer are examples of plug-ins which implement the <b>IStylusSyncPlugin</b> interface. The dynamic renderer implements the <b>IStylusSyncPlugin</b> interface in order to respond in a timely fashion to the stylus.
 * 
 * In some circumstances, such as when large numbers of gestures are subscribed to, the response time in the gesture recognizer becomes excessively slow. To avoid this problem, the gesture recognizer also implements the <a href="https://docs.microsoft.com/windows/desktop/api/rtscom/nn-rtscom-istylusasyncplugin">IStylusAsyncPlugin</a> interface so it can be placed on the UI thread.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//rtscom/nn-rtscom-istylussyncplugin
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class IStylusSyncPlugin extends IStylusPlugin{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStylusSyncPlugin
     * @type {Guid}
     */
    static IID => Guid("{a157b174-482f-4d71-a3f6-3a41ddd11be9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 20

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => []
}
