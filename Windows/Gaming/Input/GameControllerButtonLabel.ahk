#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Label that appears on the physical controller button.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.gamecontrollerbuttonlabel
 * @namespace Windows.Gaming.Input
 * @version WindowsRuntime 1.4
 */
class GameControllerButtonLabel extends Win32Enum{

    /**
     * No button.
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Back button.
     * @type {Integer (Int32)}
     */
    static XboxBack => 1

    /**
     * Start button.
     * @type {Integer (Int32)}
     */
    static XboxStart => 2

    /**
     * Menu button.
     * @type {Integer (Int32)}
     */
    static XboxMenu => 3

    /**
     * View button.
     * @type {Integer (Int32)}
     */
    static XboxView => 4

    /**
     * Up button.
     * @type {Integer (Int32)}
     */
    static XboxUp => 5

    /**
     * Down button.
     * @type {Integer (Int32)}
     */
    static XboxDown => 6

    /**
     * Left button.
     * @type {Integer (Int32)}
     */
    static XboxLeft => 7

    /**
     * Right button.
     * @type {Integer (Int32)}
     */
    static XboxRight => 8

    /**
     * A button.
     * @type {Integer (Int32)}
     */
    static XboxA => 9

    /**
     * B button.
     * @type {Integer (Int32)}
     */
    static XboxB => 10

    /**
     * X button.
     * @type {Integer (Int32)}
     */
    static XboxX => 11

    /**
     * Y button.
     * @type {Integer (Int32)}
     */
    static XboxY => 12

    /**
     * Left bumper.
     * @type {Integer (Int32)}
     */
    static XboxLeftBumper => 13

    /**
     * Left trigger.
     * @type {Integer (Int32)}
     */
    static XboxLeftTrigger => 14

    /**
     * Left stick button.
     * @type {Integer (Int32)}
     */
    static XboxLeftStickButton => 15

    /**
     * Right bumper.
     * @type {Integer (Int32)}
     */
    static XboxRightBumper => 16

    /**
     * Right trigger.
     * @type {Integer (Int32)}
     */
    static XboxRightTrigger => 17

    /**
     * Right stick button.
     * @type {Integer (Int32)}
     */
    static XboxRightStickButton => 18

    /**
     * Paddle 1.
     * @type {Integer (Int32)}
     */
    static XboxPaddle1 => 19

    /**
     * Paddle 2.
     * @type {Integer (Int32)}
     */
    static XboxPaddle2 => 20

    /**
     * Paddle 3.
     * @type {Integer (Int32)}
     */
    static XboxPaddle3 => 21

    /**
     * Paddle 4.
     * @type {Integer (Int32)}
     */
    static XboxPaddle4 => 22

    /**
     * Mode button.
     * @type {Integer (Int32)}
     */
    static Mode => 23

    /**
     * Select button.
     * @type {Integer (Int32)}
     */
    static Select => 24

    /**
     * Menu button.
     * @type {Integer (Int32)}
     */
    static Menu => 25

    /**
     * View button.
     * @type {Integer (Int32)}
     */
    static View => 26

    /**
     * Back button.
     * @type {Integer (Int32)}
     */
    static Back => 27

    /**
     * Start button.
     * @type {Integer (Int32)}
     */
    static Start => 28

    /**
     * Options button.
     * @type {Integer (Int32)}
     */
    static Options => 29

    /**
     * Share button.
     * @type {Integer (Int32)}
     */
    static Share => 30

    /**
     * Up button.
     * @type {Integer (Int32)}
     */
    static Up => 31

    /**
     * Down button.
     * @type {Integer (Int32)}
     */
    static Down => 32

    /**
     * Left button.
     * @type {Integer (Int32)}
     */
    static Left => 33

    /**
     * Right button.
     * @type {Integer (Int32)}
     */
    static Right => 34

    /**
     * Letter A.
     * @type {Integer (Int32)}
     */
    static LetterA => 35

    /**
     * Letter B.
     * @type {Integer (Int32)}
     */
    static LetterB => 36

    /**
     * Letter C.
     * @type {Integer (Int32)}
     */
    static LetterC => 37

    /**
     * Letter L.
     * @type {Integer (Int32)}
     */
    static LetterL => 38

    /**
     * Letter R.
     * @type {Integer (Int32)}
     */
    static LetterR => 39

    /**
     * Letter X.
     * @type {Integer (Int32)}
     */
    static LetterX => 40

    /**
     * Letter Y.
     * @type {Integer (Int32)}
     */
    static LetterY => 41

    /**
     * Letter Z.
     * @type {Integer (Int32)}
     */
    static LetterZ => 42

    /**
     * Cross button.
     * @type {Integer (Int32)}
     */
    static Cross => 43

    /**
     * Circle button.
     * @type {Integer (Int32)}
     */
    static Circle => 44

    /**
     * Square button.
     * @type {Integer (Int32)}
     */
    static Square => 45

    /**
     * Triangle button.
     * @type {Integer (Int32)}
     */
    static Triangle => 46

    /**
     * Left bumper.
     * @type {Integer (Int32)}
     */
    static LeftBumper => 47

    /**
     * Left trigger.
     * @type {Integer (Int32)}
     */
    static LeftTrigger => 48

    /**
     * Left stick button.
     * @type {Integer (Int32)}
     */
    static LeftStickButton => 49

    /**
     * Left 1.
     * @type {Integer (Int32)}
     */
    static Left1 => 50

    /**
     * Left 2.
     * @type {Integer (Int32)}
     */
    static Left2 => 51

    /**
     * Left 3.
     * @type {Integer (Int32)}
     */
    static Left3 => 52

    /**
     * Right bumper.
     * @type {Integer (Int32)}
     */
    static RightBumper => 53

    /**
     * Right trigger.
     * @type {Integer (Int32)}
     */
    static RightTrigger => 54

    /**
     * Right stick button.
     * @type {Integer (Int32)}
     */
    static RightStickButton => 55

    /**
     * Right 1.
     * @type {Integer (Int32)}
     */
    static Right1 => 56

    /**
     * Right 2.
     * @type {Integer (Int32)}
     */
    static Right2 => 57

    /**
     * Right 3.
     * @type {Integer (Int32)}
     */
    static Right3 => 58

    /**
     * Paddle 1.
     * @type {Integer (Int32)}
     */
    static Paddle1 => 59

    /**
     * Paddle 2.
     * @type {Integer (Int32)}
     */
    static Paddle2 => 60

    /**
     * Paddle 3.
     * @type {Integer (Int32)}
     */
    static Paddle3 => 61

    /**
     * Paddle 4.
     * @type {Integer (Int32)}
     */
    static Paddle4 => 62

    /**
     * Plus.
     * @type {Integer (Int32)}
     */
    static Plus => 63

    /**
     * Minus.
     * @type {Integer (Int32)}
     */
    static Minus => 64

    /**
     * Down left arrow.
     * @type {Integer (Int32)}
     */
    static DownLeftArrow => 65

    /**
     * Dial left.
     * @type {Integer (Int32)}
     */
    static DialLeft => 66

    /**
     * Dial right.
     * @type {Integer (Int32)}
     */
    static DialRight => 67

    /**
     * Suspension.
     * @type {Integer (Int32)}
     */
    static Suspension => 68
}
