#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * InkDisp class - Represents the collected strokes of ink within an ink space.
 * @remarks
 * This object can be instantiated by calling the [**CoCreateInstance**](/windows/desktop/api/combaseapi/nf-combaseapi-cocreateinstance) method in C++.
 * 
 * > [!Note]  
 * > The first instantiation of this object causes GDI+ to be instantiated as well. A side-effect is that if you are using a single ink object in a loop and create and destroy it within the loop, you will cause GDI+ to be instantiated over and over. This can cause a performance degradation in your application. To prevent this, keep a single instance of an ink object at all times while your application is using ink.
 * 
 *  
 * 
 * An **InkDisp** object is a container of stroke (point) data. The stroke data, or the points collected by the pen, are put into an **InkDisp** object. The [**Strokes**](/windows/desktop/api/msinkaut15/nf-msinkaut15-iinkdivisionresult-get_strokes) property contains the data for all strokes within the **InkDisp** object.
 * 
 * The [**InkCollector**](inkcollector-class.md) object, [**InkOverlay**](inkoverlay-class.md) object, and [InkPicture](inkpicture-control-reference.md) control collects points from the input device and puts them into an **InkDisp** object. These objects essentially act as the source that distributes ink into one or many different **InkDisp** objects, which act as containers that hold the distributed ink.
 * 
 * The ink space is a virtual coordinate space to which the coordinates of the tablet context are mapped. This space is fixed to a HIMETRIC coordinate system. In ink space coordinates, a move from 0 to 1 equals 1 HIMETRIC unit. This mapping makes it easy to relate multiple **InkDisp** objects.
 * 
 * The [**InkRenderer**](inkrenderer-class.md) object manages the mappings between ink and the display window.
 * @see https://learn.microsoft.com/windows/win32/tablet/inkdisp-class
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class InkDisp extends Win32Struct
{
    static sizeof => 0

    static packingSize => 1
}
