#Requires AutoHotkey v2.0.0 64-bit

/**
 * The MANIPULATION_PROCESSOR_MANIPULATIONS enumeration different kinds of manipulation which can be applied on a target object.
 * @remarks
 * 
  * Use this enumeration with the <a href="https://docs.microsoft.com/windows/desktop/api/manipulations/nf-manipulations-imanipulationprocessor-get_supportedmanipulations">SupportedManipulations</a> property to get and 
  * 		  set the kind of manipulation data you want to receive from the <a href="https://docs.microsoft.com/windows/desktop/api/manipulations/nn-manipulations-imanipulationprocessor">IManipulationProcessor</a> interface. 
  * 		  You can combine different kinds of manipulations by a bitwise OR.
  * 
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//manipulations/ne-manipulations-manipulation_processor_manipulations
 * @namespace Windows.Win32.UI.Input.Touch
 * @version v4.0.30319
 */
class MANIPULATION_PROCESSOR_MANIPULATIONS{

    /**
     * Indicates that no manipulations are performed.
     * @type {Integer (Int32)}
     */
    static MANIPULATION_NONE => 0

    /**
     * Indicates manipulation by moving the target across the horizontal axis.
     * @type {Integer (Int32)}
     */
    static MANIPULATION_TRANSLATE_X => 1

    /**
     * Indicates manipulation by moving the target across the vertical axis.
     * @type {Integer (Int32)}
     */
    static MANIPULATION_TRANSLATE_Y => 2

    /**
     * Indicates manipulation by making the target larger or smaller.
     * @type {Integer (Int32)}
     */
    static MANIPULATION_SCALE => 4

    /**
     * Indicates manipulation by rotating the target.
     * @type {Integer (Int32)}
     */
    static MANIPULATION_ROTATE => 8

    /**
     * Indicates all manipulations are enabled.
     * @type {Integer (Int32)}
     */
    static MANIPULATION_ALL => 15
}
