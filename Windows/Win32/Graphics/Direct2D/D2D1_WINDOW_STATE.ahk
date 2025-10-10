#Requires AutoHotkey v2.0.0 64-bit

/**
 * Describes whether a window is occluded.
 * @remarks
 * 
  * If the window was occluded the last time  <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-enddraw">EndDraw</a> was called, the next time the render target calls <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1hwndrendertarget-checkwindowstate">CheckWindowState</a>, it  returns <b>D2D1_WINDOW_STATE_OCCLUDED</b> regardless of the current window state. If you want to use <b>CheckWindowState</b> to check the current window state, call <b>CheckWindowState</b> after every <b>EndDraw</b> call and ignore its return value. This will ensure that your next call to <b>CheckWindowState</b> state  returns the actual window state.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d2d1/ne-d2d1-d2d1_window_state
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class D2D1_WINDOW_STATE{

    /**
     * The window is not occluded.
     * @type {Integer (Int32)}
     */
    static D2D1_WINDOW_STATE_NONE => 0

    /**
     * The window is occluded.
     * @type {Integer (Int32)}
     */
    static D2D1_WINDOW_STATE_OCCLUDED => 1
}
