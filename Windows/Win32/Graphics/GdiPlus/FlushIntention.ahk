#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The FlushIntention enumeration specifies when to flush the queue of graphics operations.
 * @see https://docs.microsoft.com/windows/win32/api//gdiplusenums/ne-gdiplusenums-flushintention
 * @namespace Windows.Win32.Graphics.GdiPlus
 * @version v4.0.30319
 */
class FlushIntention extends Win32Enum{

    /**
     * When passed to the 
     * 				<a href="https://docs.microsoft.com/windows/desktop/api/gdiplusgraphics/nf-gdiplusgraphics-graphics-flush">Graphics::Flush</a> method, specifies that pending rendering operations are executed as soon as possible. The 
     * 				<b>Graphics::Flush</b> method is not synchronized with the completion of the rendering operations and might return before the rendering operations are completed.
     * @type {Integer (Int32)}
     */
    static FlushIntentionFlush => 0

    /**
     * When passed to the 
     * 				<a href="https://docs.microsoft.com/windows/desktop/api/gdiplusgraphics/nf-gdiplusgraphics-graphics-flush">Graphics::Flush</a> method, specifies that pending rendering operations are executed as soon as possible. The 
     * 				<b>Graphics::Flush</b> method is synchronized with the completion of the rendering operations; that is, it will not return until after the rendering operations are completed.
     * @type {Integer (Int32)}
     */
    static FlushIntentionSync => 1
}
