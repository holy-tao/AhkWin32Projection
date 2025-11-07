#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IStylusPlugin.ahk

/**
 * Represents an asynchronous plug-in that can be added to the asynchronous plug-in collection of the RealTimeStylus Class object.
 * @remarks
 * 
 * This is the asynchronous version of <a href="https://docs.microsoft.com/windows/desktop/api/rtscom/nn-rtscom-istylusplugin">IStylusPlugin Interface</a>.
 * 
 * This plug-in receives notifications of <a href="https://docs.microsoft.com/windows/desktop/tablet/realtimestylus-class">RealTimeStylus Class</a> events enabling you to do custom processing.
 * 
 * The <a href="https://docs.microsoft.com/windows/desktop/tablet/gesturerecognizer-class">GestureRecognizer Class</a> is an example of a plug-in that implements the <b>IStylusAsyncPlugin</b> interface in order to respond in a timely fashion to the stylus. In some circumstances, such as when large numbers of gestures are subscribed to, the response time in the gesture recognizer becomes excessively slow. To avoid this problem, the <b>GestureRecognizer Class</b> implements the <b>IStylusAsyncPlugin</b> interface so that it can be called asynchronously.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//rtscom/nn-rtscom-istylusasyncplugin
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class IStylusAsyncPlugin extends IStylusPlugin{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStylusAsyncPlugin
     * @type {Guid}
     */
    static IID => Guid("{a7cca85a-31bc-4cd2-aadc-3289a3af11c8}")

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
