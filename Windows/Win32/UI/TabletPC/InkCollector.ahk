#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents the object that is used to capture ink from available tablet devices.
 * @remarks
 * This object can be instantiated by calling the [**CoCreateInstance**](/windows/desktop/api/combaseapi/nf-combaseapi-cocreateinstance) method in C++.
 * 
 * The **InkCollector** object collects only ink and gestures that are input into the specific window with which it is associated. The sole purpose of the **InkCollector** is to collect ink from the hardware (for example, through an [**IInkCursor**](/windows/desktop/api/msinkaut/nn-msinkaut-iinkcursor) and [**IInkTablet**](/windows/desktop/api/msinkaut/nn-msinkaut-iinktablet) object) and deliver it to an application. It essentially acts as the source that distributes ink into one or many different [**InkDisp**](inkdisp-class.md) objects, which act as container that hold the distributed ink.
 * 
 * To use an **InkCollector**, you create it, tell it on which window to collect drawn ink, and enable it. After it is enabled, it can be set to collect in only one of three modes (the mode is specified in the [**InkCollectionMode**](/windows/desktop/api/msinkaut/ne-msinkaut-inkcollectionmode) enumeration):
 * 
 * -   InkOnly, in which an [**IInkStrokeDisp**](/windows/desktop/api/msinkaut/nn-msinkaut-iinkstrokedisp) object is created.
 * -   GestureOnly, in which an [**IInkGesture**](/windows/desktop/api/msinkaut/nn-msinkaut-iinkgesture) object is created.
 * -   InkAndGesture, in which a stroke, a gesture, or potentially both are created, depending on how the application handles events.
 * 
 * This means that, for every movement of a cursor that is within range of a tablet, the **InkCollector** always collects either a stroke or a gesture and sometimes both. Gesture support is built in using the Microsoft gesture recognizer.
 * 
 * An **InkCollector** handles all tablet input. Ink can be collected from all attached tablets (including the mouse) simultaneously. Changes in the [**IInkCursor**](/windows/desktop/api/msinkaut/nn-msinkaut-iinkcursor) and [**IInkCursorButton**](/windows/desktop/api/msinkaut/nn-msinkaut-iinkcursorbutton) objects can cause **InkCollector** object to fire an event.
 * 
 * An **InkCollector** also manages the list of cursors that it encounters during its existence. When the **InkCollector** encounters a new cursor, the [**CursorInRange**](inkcollector-cursorinrange.md) event fires with the *newCursor* parameter set to **VARIANT\_TRUE**. Applications use the **InkCollector** to manage new cursors.
 * 
 * More than one **InkCollector** can be associated with a particular window handle, even if their collection areas, set in the constructor or with the [**SetWindowInputRectangle**](/windows/desktop/api/msinkaut/nf-msinkaut-iinkcollector-setwindowinputrectangle) method, overlap. However, the only way this scenario works is if each **InkCollector** calls [**SetSingleTabletIntegratedMode**](/windows/desktop/api/msinkaut/nf-msinkaut-iinkcollector-setsingletabletintegratedmode) and uses a unique tablet. This behavior makes it easy to store ink in a separate object for each tablet.
 * 
 * An error occurs if the window input rectangle of one enabled **InkCollectors** (set with the [**Enabled**](/windows/desktop/api/msinkaut/nf-msinkaut-iinkcollector-get_enabled) property) overlaps the window input rectangle of another enabled **InkCollector**.
 * 
 * > [!Note]  
 * > Overlap can occur without an error as long as only one of the input rectangles is enabled at any known time.
 * 
 *  
 * 
 * The [**MouseDown**](inkcollector-mousedown.md), [**MouseMove**](inkcollector-mousemove.md), [**MouseUp**](inkcollector-mouseup.md), and [**MouseWheel**](inkcollector-mousewheel.md) events return x and y-coordinates in pixels, and not the HIMETRIC units that are associated with the ink space. This is because these events replace the mouse events of pen-unaware applications and these applications understand only pixels.
 * 
 * > [!Note]  
 * > The **InkCollector** object cannot be safely released on a non-UI thread.
 * 
 *  
 * 
 * To improve your application's performance, dispose of your **InkCollector** object when it is no longer needed.
 * @see https://learn.microsoft.com/windows/win32/tablet/inkcollector-class
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class InkCollector extends Win32Struct
{
    static sizeof => 0

    static packingSize => 1
}
