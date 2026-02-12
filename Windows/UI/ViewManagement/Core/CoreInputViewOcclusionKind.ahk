#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the types of input panes supported by the [CoreInputViewOcclusion](coreinputviewocclusion.md) object.
  * 
  * > [!NOTE]
  * > Not supported on HoloLens.
 * @remarks
 * Used by frameworks (such as XAML) or custom text controls only.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.core.coreinputviewocclusionkind
 * @namespace Windows.UI.ViewManagement.Core
 * @version WindowsRuntime 1.4
 */
class CoreInputViewOcclusionKind extends Win32Enum{

    /**
     * Docked panes such as a Soft Input Panel (SIP) like the **Touch keyboard and handwriting panel**.
     * @type {Integer (Int32)}
     */
    static Docked => 0

    /**
     * Undocked panes such as a toolbar, or a Soft Input Panel (SIP) like the **Touch keyboard and handwriting panel**.
     * @type {Integer (Int32)}
     */
    static Floating => 1

    /**
     * Floating panes such as an inline Ink or Input Method Editor (IME) candidate window.
     * @type {Integer (Int32)}
     */
    static Overlay => 2
}
