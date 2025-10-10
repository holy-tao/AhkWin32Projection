#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines the possible flick actions that can be assigned to a pen flick.
 * @remarks
 * 
  * In Control Panel, the user can assign commands to pen flicks. Four types of actions with pen flicks include:
  * 
  * <ul>
  * <li>Scroll Up or Scroll Down.</li>
  * <li>An application command such as Back or Undo</li>
  * <li>Any keystroke or keystroke combination such as CONTROL+N.</li>
  * <li>Activating a modifier key such as SHIFT</li>
  * </ul>
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//tabflicks/ne-tabflicks-flickaction_commandcode
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class FLICKACTION_COMMANDCODE{

    /**
     * No action is assigned to the pen flick.
     * @type {Integer (Int32)}
     */
    static FLICKACTION_COMMANDCODE_NULL => 0

    /**
     * A scrolling command is assigned to the pen flick.
     * @type {Integer (Int32)}
     */
    static FLICKACTION_COMMANDCODE_SCROLL => 1

    /**
     * An application command is assigned to a pen flick.
     * @type {Integer (Int32)}
     */
    static FLICKACTION_COMMANDCODE_APPCOMMAND => 2

    /**
     * A customized key sequence is assigned to the pen flick.
     * @type {Integer (Int32)}
     */
    static FLICKACTION_COMMANDCODE_CUSTOMKEY => 3

    /**
     * A key modifier is assigned to the pen flick.
     * @type {Integer (Int32)}
     */
    static FLICKACTION_COMMANDCODE_KEYMODIFIER => 4
}
