#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * The MANIPULATION_PROCESSOR_MANIPULATIONS enumeration different kinds of manipulation which can be applied on a target object.
 * @remarks
 * Use this enumeration with the <a href="https://docs.microsoft.com/windows/desktop/api/manipulations/nf-manipulations-imanipulationprocessor-get_supportedmanipulations">SupportedManipulations</a> property to get and 
 * 		  set the kind of manipulation data you want to receive from the <a href="https://docs.microsoft.com/windows/desktop/api/manipulations/nn-manipulations-imanipulationprocessor">IManipulationProcessor</a> interface. 
 * 		  You can combine different kinds of manipulations by a bitwise OR.
 * @see https://learn.microsoft.com/windows/win32/api/manipulations/ne-manipulations-manipulation_processor_manipulations
 * @namespace Windows.Win32.UI.Input.Touch
 */
class MANIPULATION_PROCESSOR_MANIPULATIONS extends Win32BitflagEnum {

    /**
     * Indicates that no manipulations are performed.
     * Native name: MANIPULATION_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * Indicates manipulation by moving the target across the horizontal axis.
     * Native name: MANIPULATION_TRANSLATE_X
     * @type {Integer (Int32)}
     */
    static TRANSLATE_X => 1

    /**
     * Indicates manipulation by moving the target across the vertical axis.
     * Native name: MANIPULATION_TRANSLATE_Y
     * @type {Integer (Int32)}
     */
    static TRANSLATE_Y => 2

    /**
     * Indicates manipulation by making the target larger or smaller.
     * Native name: MANIPULATION_SCALE
     * @type {Integer (Int32)}
     */
    static SCALE => 4

    /**
     * Indicates manipulation by rotating the target.
     * Native name: MANIPULATION_ROTATE
     * @type {Integer (Int32)}
     */
    static ROTATE => 8

    /**
     * Indicates all manipulations are enabled.
     * Native name: MANIPULATION_ALL
     * @type {Integer (Int32)}
     */
    static ALL => 15
}
