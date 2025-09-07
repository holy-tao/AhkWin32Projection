#Requires AutoHotkey v2.0.0 64-bit

/**
 * Identifies the DPI hosting behavior for a window. This behavior allows windows created in the thread to host child windows with a different DPI_AWARENESS_CONTEXT.
 * @remarks
 * <b>DPI_HOSTING_BEHAVIOR</b> enables a mixed content hosting behavior, which allows parent windows created in the thread to host child windows with a different <a href="https://docs.microsoft.com/windows/desktop/hidpi/dpi-awareness-context">DPI_AWARENESS_CONTEXT</a> value. This property only effects new windows created within this thread while the mixed hosting behavior is active. A parent window with this hosting behavior is able to host child windows with different <b>DPI_AWARENESS_CONTEXT</b> values, regardless of whether the child windows have mixed hosting behavior enabled.
  * 
  * This hosting behavior does not allow for windows with per-monitor <b>DPI_AWARENESS_CONTEXT</b> values to be hosted by windows with <b>DPI_AWARENESS_CONTEXT</b> values of system or unaware.
  * 
  * To avoid unexpected outcomes, a thread's <b>DPI_HOSTING_BEHAVIOR</b> should be changed to support mixed hosting behaviors only when creating a new window which needs to support those behaviors. Once that window is created, the hosting behavior should be switched back to its default value.
  * 
  * Enabling mixed hosting behavior will not automatically adjust the thread's <b>DPI_AWARENESS_CONTEXT</b> to be compatible with legacy content. The thread's awareness context must still be manually changed before new windows are created to host such content.
 * @see https://learn.microsoft.com/windows/win32/api/windef/ne-windef-dpi_hosting_behavior
 * @namespace Windows.Win32.UI.HiDpi
 * @version v4.0.30319
 */
class DPI_HOSTING_BEHAVIOR{

    /**
     * Invalid DPI hosting behavior. This usually occurs if the previous <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-setthreaddpihostingbehavior">SetThreadDpiHostingBehavior</a> call used an invalid parameter.
     * @type {Integer (Int32)}
     */
    static DPI_HOSTING_BEHAVIOR_INVALID => -1

    /**
     * Default DPI hosting behavior. The associated window behaves as normal, and cannot create or re-parent child windows with a different <b>DPI_AWARENESS_CONTEXT</b>.
     * @type {Integer (Int32)}
     */
    static DPI_HOSTING_BEHAVIOR_DEFAULT => 0

    /**
     * Mixed DPI hosting behavior. This enables the creation and re-parenting of child windows with different <b>DPI_AWARENESS_CONTEXT</b>. These child windows will be independently scaled by the OS.
     * @type {Integer (Int32)}
     */
    static DPI_HOSTING_BEHAVIOR_MIXED => 1
}
