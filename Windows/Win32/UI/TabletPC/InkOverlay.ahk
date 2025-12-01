#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents an object that is useful for annotation scenarios where users are not concerned with performing recognition on ink but instead are interested in the size, shape, color, and position of the ink.
 * @remarks
 * This object can be instantiated by calling the [**CoCreateInstance**](/windows/desktop/api/combaseapi/nf-combaseapi-cocreateinstance) method in C++.
 * 
 * The **InkOverlay** object is well suited for note taking and basic scribbling. The primary intended use of this object is to display ink as ink.
 * 
 * In general, the run-time user interface for this object is a transparent window with opaque ink.
 * 
 * The [**MouseDown**](inkcollector-mousedown.md), [**MouseMove**](inkcollector-mousemove.md), [**MouseUp**](inkcollector-mouseup.md), and [**MouseWheel**](inkcollector-mousewheel.md) events return x-coordinates and y-coordinates in pixels, and not the HIMETRIC units that are associated with the ink space. This is because these events replace the mouse events of pen-unaware applications and these applications understand only pixels.
 * 
 * > [!Caution]  
 * > If you are setting the **InkOverlay** object's [**AttachMode**](/windows/desktop/api/msinkaut/nf-msinkaut-iinkoverlay-get_attachmode) property to InFront then create the **InkOverlay** object in the thread in which the form is running. Your application may stop responding if the **InkOverlay** object is created in a different thread and its **AttachMode** property is set to InFront.
 * 
 *  
 * 
 * > [!Note]  
 * > The **InkOverlay** object cannot be safely released on a non-UI thread.
 * 
 *  
 * 
 * To improve your application's performance, dispose your **InkOverlay** object when it is no longer needed.
 * 
 * If you attached the InkOverlay object to a CView object, release the InkOverlay object in response to the WM\_DESTROY message as shown in the following example:
 * 
 * 
 * ```C++
 * BOOL CRecognitionAlternatesSampleCppView::OnWndMsg(UINT msg, WPARAM wp, PARAM lp, LRESULT *pLR)
 * {
 *     if(WM_DESTROY == msg)
 *         m_spInkOverlay.Release();
 *     return CView::OnWndMsg(msg, wp, lp, pLR);
 * }
 * ```
 * @see https://learn.microsoft.com/windows/win32/tablet/inkoverlay-class
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class InkOverlay extends Win32Struct
{
    static sizeof => 0

    static packingSize => 1
}
