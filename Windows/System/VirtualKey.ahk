#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32Enum.ahk

/**
 * Specifies the values for each virtual key.
 * @remarks
 * This enum is used in the [Windows.UI.Core.KeyEventArgs.VirtualKey](../windows.ui.core/keyeventargs_virtualkey.md), [Windows.UI.Core.AcceleratorKeyEventArgs.VirtualKey](../windows.ui.core/acceleratorkeyeventargs_virtualkey.md), [Windows.UI.Xaml.Input.KeyRoutedEventArgs.Key](../windows.ui.xaml.input/keyroutedeventargs_key.md), [Windows.UI.Xaml.Input.KeyboardAccelerator.Key](../windows.ui.xaml.input/keyboardaccelerator_key.md), and [Windows.UI.Xaml.Input.ProcessKeyboardAcceleratorEventArgs.Key](../windows.ui.xaml.input/processkeyboardacceleratoreventargs_key.md) properties. 
 * 
 * For more information, including code examples, see [Keyboard events](/windows/apps/design/input/keyboard-events) and [Keyboard Accelerators](/windows/apps/design/input/keyboard-accelerators).
 * @see https://learn.microsoft.com/uwp/api/windows.system.virtualkey
 * @namespace Windows.System
 * @version WindowsRuntime 1.4
 */
class VirtualKey extends Win32Enum{

    /**
     * No virtual key value.
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * The left mouse button.
     * @type {Integer (Int32)}
     */
    static LeftButton => 1

    /**
     * The right mouse button.
     * @type {Integer (Int32)}
     */
    static RightButton => 2

    /**
     * The cancel key or button.
     * @type {Integer (Int32)}
     */
    static Cancel => 3

    /**
     * The middle mouse button.
     * @type {Integer (Int32)}
     */
    static MiddleButton => 4

    /**
     * An additional "extended" device key or button (for example, an additional mouse button).
     * @type {Integer (Int32)}
     */
    static XButton1 => 5

    /**
     * An additional "extended" device key or button (for example, an additional mouse button).
     * @type {Integer (Int32)}
     */
    static XButton2 => 6

    /**
     * The back key or button.
     * @type {Integer (Int32)}
     */
    static Back => 8

    /**
     * The Tab key or button.
     * @type {Integer (Int32)}
     */
    static Tab => 9

    /**
     * The Clear key or button.
     * @type {Integer (Int32)}
     */
    static Clear => 12

    /**
     * The Enter key or button.
     * @type {Integer (Int32)}
     */
    static Enter => 13

    /**
     * The Shift key or button. This is the general Shift case, applicable to key layouts with only one Shift key or that do not need to differentiate between left Shift and right Shift keystrokes.
     * @type {Integer (Int32)}
     */
    static Shift => 16

    /**
     * The Ctrl key or button. This is the general Ctrl case, applicable to key layouts with only one Ctrl key or that do not need to differentiate between left Ctrl and right Ctrl keystrokes.
     * @type {Integer (Int32)}
     */
    static Control => 17

    /**
     * The Alt key or button. This is the general Alt case, applicable to key layouts with only one Alt key or that do not need to differentiate between left Alt and right Alt keystrokes.
     * @type {Integer (Int32)}
     */
    static Menu => 18

    /**
     * The Pause key or button.
     * @type {Integer (Int32)}
     */
    static Pause => 19

    /**
     * The Caps Lock key or button.
     * @type {Integer (Int32)}
     */
    static CapitalLock => 20

    /**
     * The Kana symbol option key or button.
     * 
     * Kana are the syllabaries that form parts of the Japanese writing system.
     * @type {Integer (Int32)}
     */
    static Kana => 21

    /**
     * The Hangul symbol option key or button.
     * 
     * Hangul are the syllabaries that form parts of the Korean writing system.
     * @type {Integer (Int32)}
     */
    static Hangul => 21

    /**
     * The Input Method Editor On key or button.
     * @type {Integer (Int32)}
     */
    static ImeOn => 22

    /**
     * The Junja symbol option key or button.
     * 
     * Junja are the syllabaries that form parts of the Korean writing system.
     * @type {Integer (Int32)}
     */
    static Junja => 23

    /**
     * The Final symbol key or button.
     * @type {Integer (Int32)}
     */
    static Final => 24

    /**
     * The Hanja symbol option key or button.
     * 
     * Hanja are the syllabaries that form parts of the Korean writing system.
     * @type {Integer (Int32)}
     */
    static Hanja => 25

    /**
     * The Kanji symbol option key or button.
     * 
     * Kanji are the syllabaries that form parts of the Japanese writing system.
     * @type {Integer (Int32)}
     */
    static Kanji => 25

    /**
     * The Input Method Editor Off key or button.
     * @type {Integer (Int32)}
     */
    static ImeOff => 26

    /**
     * The Esc key or button.
     * @type {Integer (Int32)}
     */
    static Escape => 27

    /**
     * The IME convert button.
     * @type {Integer (Int32)}
     */
    static Convert => 28

    /**
     * The IME nonconvert button.
     * @type {Integer (Int32)}
     */
    static NonConvert => 29

    /**
     * The IME accept button.
     * @type {Integer (Int32)}
     */
    static Accept => 30

    /**
     * The IME mode change button.
     * @type {Integer (Int32)}
     */
    static ModeChange => 31

    /**
     * The Spacebar key or button.
     * @type {Integer (Int32)}
     */
    static Space => 32

    /**
     * The Page Up key or button.
     * @type {Integer (Int32)}
     */
    static PageUp => 33

    /**
     * The Page Down key or button.
     * @type {Integer (Int32)}
     */
    static PageDown => 34

    /**
     * The End key or button.
     * @type {Integer (Int32)}
     */
    static End => 35

    /**
     * The Home key or button.
     * @type {Integer (Int32)}
     */
    static Home => 36

    /**
     * The Left Arrow key or button.
     * @type {Integer (Int32)}
     */
    static Left => 37

    /**
     * The Up Arrow key or button.
     * @type {Integer (Int32)}
     */
    static Up => 38

    /**
     * The Right Arrow key or button.
     * @type {Integer (Int32)}
     */
    static Right => 39

    /**
     * The Down Arrow key or button.
     * @type {Integer (Int32)}
     */
    static Down => 40

    /**
     * The Select key or button.
     * @type {Integer (Int32)}
     */
    static Select => 41

    /**
     * The Print key or button.
     * @type {Integer (Int32)}
     */
    static Print => 42

    /**
     * The execute key or button.
     * @type {Integer (Int32)}
     */
    static Execute => 43

    /**
     * The Print Screen key or button.
     * @type {Integer (Int32)}
     */
    static Snapshot => 44

    /**
     * The Insert key or button.
     * @type {Integer (Int32)}
     */
    static Insert => 45

    /**
     * The Delete key or button.
     * @type {Integer (Int32)}
     */
    static Delete => 46

    /**
     * The Help key or button.
     * @type {Integer (Int32)}
     */
    static Help => 47

    /**
     * The number "0" key or button.
     * @type {Integer (Int32)}
     */
    static Number0 => 48

    /**
     * The number "1" key or button.
     * @type {Integer (Int32)}
     */
    static Number1 => 49

    /**
     * The number "2" key or button.
     * @type {Integer (Int32)}
     */
    static Number2 => 50

    /**
     * The number "3" key or button.
     * @type {Integer (Int32)}
     */
    static Number3 => 51

    /**
     * The number "4" key or button.
     * @type {Integer (Int32)}
     */
    static Number4 => 52

    /**
     * The number "5" key or button.
     * @type {Integer (Int32)}
     */
    static Number5 => 53

    /**
     * The number "6" key or button.
     * @type {Integer (Int32)}
     */
    static Number6 => 54

    /**
     * The number "7" key or button.
     * @type {Integer (Int32)}
     */
    static Number7 => 55

    /**
     * The number "8" key or button.
     * @type {Integer (Int32)}
     */
    static Number8 => 56

    /**
     * The number "9" key or button.
     * @type {Integer (Int32)}
     */
    static Number9 => 57

    /**
     * The letter "A" key or button.
     * @type {Integer (Int32)}
     */
    static A => 65

    /**
     * The letter "B" key or button.
     * @type {Integer (Int32)}
     */
    static B => 66

    /**
     * The letter "C" key or button.
     * @type {Integer (Int32)}
     */
    static C => 67

    /**
     * The letter "D" key or button.
     * @type {Integer (Int32)}
     */
    static D => 68

    /**
     * The letter "E" key or button.
     * @type {Integer (Int32)}
     */
    static E => 69

    /**
     * The letter "F" key or button.
     * @type {Integer (Int32)}
     */
    static F => 70

    /**
     * The letter "G" key or button.
     * @type {Integer (Int32)}
     */
    static G => 71

    /**
     * The letter "H" key or button.
     * @type {Integer (Int32)}
     */
    static H => 72

    /**
     * The letter "I" key or button.
     * @type {Integer (Int32)}
     */
    static I => 73

    /**
     * The letter "J" key or button.
     * @type {Integer (Int32)}
     */
    static J => 74

    /**
     * The letter "K" key or button.
     * @type {Integer (Int32)}
     */
    static K => 75

    /**
     * The letter "L" key or button.
     * @type {Integer (Int32)}
     */
    static L => 76

    /**
     * The letter "M" key or button.
     * @type {Integer (Int32)}
     */
    static M => 77

    /**
     * The letter "N" key or button.
     * @type {Integer (Int32)}
     */
    static N => 78

    /**
     * The letter "O" key or button.
     * @type {Integer (Int32)}
     */
    static O => 79

    /**
     * The letter "P" key or button.
     * @type {Integer (Int32)}
     */
    static P => 80

    /**
     * The letter "Q" key or button.
     * @type {Integer (Int32)}
     */
    static Q => 81

    /**
     * The letter "R" key or button.
     * @type {Integer (Int32)}
     */
    static R => 82

    /**
     * The letter "S" key or button.
     * @type {Integer (Int32)}
     */
    static S => 83

    /**
     * The letter "T" key or button.
     * @type {Integer (Int32)}
     */
    static T => 84

    /**
     * The letter "U" key or button.
     * @type {Integer (Int32)}
     */
    static U => 85

    /**
     * The letter "V" key or button.
     * @type {Integer (Int32)}
     */
    static V => 86

    /**
     * The letter "W" key or button.
     * @type {Integer (Int32)}
     */
    static W => 87

    /**
     * The letter "X" key or button.
     * @type {Integer (Int32)}
     */
    static X => 88

    /**
     * The letter "Y" key or button.
     * @type {Integer (Int32)}
     */
    static Y => 89

    /**
     * The letter "Z" key or button.
     * @type {Integer (Int32)}
     */
    static Z => 90

    /**
     * The left Windows key or button.
     * @type {Integer (Int32)}
     */
    static LeftWindows => 91

    /**
     * The right Windows key or button.
     * @type {Integer (Int32)}
     */
    static RightWindows => 92

    /**
     * The application key or button.
     * @type {Integer (Int32)}
     */
    static Application => 93

    /**
     * The sleep key or button.
     * @type {Integer (Int32)}
     */
    static Sleep => 95

    /**
     * The number "0" key or button as located on a numeric pad.
     * @type {Integer (Int32)}
     */
    static NumberPad0 => 96

    /**
     * The number "1" key or button as located on a numeric pad.
     * @type {Integer (Int32)}
     */
    static NumberPad1 => 97

    /**
     * The number "2" key or button as located on a numeric pad.
     * @type {Integer (Int32)}
     */
    static NumberPad2 => 98

    /**
     * The number "3" key or button as located on a numeric pad.
     * @type {Integer (Int32)}
     */
    static NumberPad3 => 99

    /**
     * The number "4" key or button as located on a numeric pad.
     * @type {Integer (Int32)}
     */
    static NumberPad4 => 100

    /**
     * The number "5" key or button as located on a numeric pad.
     * @type {Integer (Int32)}
     */
    static NumberPad5 => 101

    /**
     * The number "6" key or button as located on a numeric pad.
     * @type {Integer (Int32)}
     */
    static NumberPad6 => 102

    /**
     * The number "7" key or button as located on a numeric pad.
     * @type {Integer (Int32)}
     */
    static NumberPad7 => 103

    /**
     * The number "8" key or button as located on a numeric pad.
     * @type {Integer (Int32)}
     */
    static NumberPad8 => 104

    /**
     * The number "9" key or button as located on a numeric pad.
     * @type {Integer (Int32)}
     */
    static NumberPad9 => 105

    /**
     * The multiply (*) operation key or button as located on a numeric pad.
     * @type {Integer (Int32)}
     */
    static Multiply => 106

    /**
     * The add (+) operation key or button as located on a numeric pad.
     * @type {Integer (Int32)}
     */
    static Add => 107

    /**
     * The separator key or button as located on a numeric pad.
     * @type {Integer (Int32)}
     */
    static Separator => 108

    /**
     * The subtract (-) operation key or button as located on a numeric pad.
     * @type {Integer (Int32)}
     */
    static Subtract => 109

    /**
     * The decimal (.) key or button as located on a numeric pad.
     * @type {Integer (Int32)}
     */
    static Decimal => 110

    /**
     * The divide (/) operation key or button as located on a numeric pad.
     * @type {Integer (Int32)}
     */
    static Divide => 111

    /**
     * The F1 function key or button.
     * @type {Integer (Int32)}
     */
    static F1 => 112

    /**
     * The F2 function key or button.
     * @type {Integer (Int32)}
     */
    static F2 => 113

    /**
     * The F3 function key or button.
     * @type {Integer (Int32)}
     */
    static F3 => 114

    /**
     * The F4 function key or button.
     * @type {Integer (Int32)}
     */
    static F4 => 115

    /**
     * The F5 function key or button.
     * @type {Integer (Int32)}
     */
    static F5 => 116

    /**
     * The F6 function key or button.
     * @type {Integer (Int32)}
     */
    static F6 => 117

    /**
     * The F7 function key or button.
     * @type {Integer (Int32)}
     */
    static F7 => 118

    /**
     * The F8 function key or button.
     * @type {Integer (Int32)}
     */
    static F8 => 119

    /**
     * The F9 function key or button.
     * @type {Integer (Int32)}
     */
    static F9 => 120

    /**
     * The F10 function key or button.
     * @type {Integer (Int32)}
     */
    static F10 => 121

    /**
     * The F11 function key or button.
     * @type {Integer (Int32)}
     */
    static F11 => 122

    /**
     * The F12 function key or button.
     * @type {Integer (Int32)}
     */
    static F12 => 123

    /**
     * The F13 function key or button.
     * @type {Integer (Int32)}
     */
    static F13 => 124

    /**
     * The F14 function key or button.
     * @type {Integer (Int32)}
     */
    static F14 => 125

    /**
     * The F15 function key or button.
     * @type {Integer (Int32)}
     */
    static F15 => 126

    /**
     * The F16 function key or button.
     * @type {Integer (Int32)}
     */
    static F16 => 127

    /**
     * The F17 function key or button.
     * @type {Integer (Int32)}
     */
    static F17 => 128

    /**
     * The F18 function key or button.
     * @type {Integer (Int32)}
     */
    static F18 => 129

    /**
     * The F19 function key or button.
     * @type {Integer (Int32)}
     */
    static F19 => 130

    /**
     * The F20 function key or button.
     * @type {Integer (Int32)}
     */
    static F20 => 131

    /**
     * The F21 function key or button.
     * @type {Integer (Int32)}
     */
    static F21 => 132

    /**
     * The F22 function key or button.
     * @type {Integer (Int32)}
     */
    static F22 => 133

    /**
     * The F23 function key or button.
     * @type {Integer (Int32)}
     */
    static F23 => 134

    /**
     * The F24 function key or button.
     * @type {Integer (Int32)}
     */
    static F24 => 135

    /**
     * The navigation up key or button.
     * @type {Integer (Int32)}
     */
    static NavigationView => 136

    /**
     * The navigation menu key or button.
     * @type {Integer (Int32)}
     */
    static NavigationMenu => 137

    /**
     * The navigation up key or button.
     * @type {Integer (Int32)}
     */
    static NavigationUp => 138

    /**
     * The navigation down key or button.
     * @type {Integer (Int32)}
     */
    static NavigationDown => 139

    /**
     * The navigation left key or button.
     * @type {Integer (Int32)}
     */
    static NavigationLeft => 140

    /**
     * The navigation right key or button.
     * @type {Integer (Int32)}
     */
    static NavigationRight => 141

    /**
     * The navigation accept key or button.
     * @type {Integer (Int32)}
     */
    static NavigationAccept => 142

    /**
     * The navigation cancel key or button.
     * @type {Integer (Int32)}
     */
    static NavigationCancel => 143

    /**
     * The Num Lock key or button.
     * @type {Integer (Int32)}
     */
    static NumberKeyLock => 144

    /**
     * The Scroll Lock (ScrLk) key or button.
     * @type {Integer (Int32)}
     */
    static Scroll => 145

    /**
     * The left Shift key or button.
     * @type {Integer (Int32)}
     */
    static LeftShift => 160

    /**
     * The right Shift key or button.
     * @type {Integer (Int32)}
     */
    static RightShift => 161

    /**
     * The left Ctrl key or button.
     * @type {Integer (Int32)}
     */
    static LeftControl => 162

    /**
     * The right Ctrl key or button.
     * @type {Integer (Int32)}
     */
    static RightControl => 163

    /**
     * The left Alt key or button.
     * @type {Integer (Int32)}
     */
    static LeftMenu => 164

    /**
     * The right Alt key or button.
     * @type {Integer (Int32)}
     */
    static RightMenu => 165

    /**
     * The go back key or button.
     * @type {Integer (Int32)}
     */
    static GoBack => 166

    /**
     * The go forward key or button.
     * @type {Integer (Int32)}
     */
    static GoForward => 167

    /**
     * The refresh key or button.
     * @type {Integer (Int32)}
     */
    static Refresh => 168

    /**
     * The stop key or button.
     * @type {Integer (Int32)}
     */
    static Stop => 169

    /**
     * The search key or button.
     * @type {Integer (Int32)}
     */
    static Search => 170

    /**
     * The favorites key or button.
     * @type {Integer (Int32)}
     */
    static Favorites => 171

    /**
     * The go home key or button.
     * @type {Integer (Int32)}
     */
    static GoHome => 172

    /**
     * The gamepad A button.
     * @type {Integer (Int32)}
     */
    static GamepadA => 195

    /**
     * The gamepad B button.
     * @type {Integer (Int32)}
     */
    static GamepadB => 196

    /**
     * The gamepad X button.
     * @type {Integer (Int32)}
     */
    static GamepadX => 197

    /**
     * The gamepad Y button.
     * @type {Integer (Int32)}
     */
    static GamepadY => 198

    /**
     * The gamepad right shoulder.
     * @type {Integer (Int32)}
     */
    static GamepadRightShoulder => 199

    /**
     * The gamepad left shoulder.
     * @type {Integer (Int32)}
     */
    static GamepadLeftShoulder => 200

    /**
     * The gamepad left trigger.
     * @type {Integer (Int32)}
     */
    static GamepadLeftTrigger => 201

    /**
     * The gamepad right trigger.
     * @type {Integer (Int32)}
     */
    static GamepadRightTrigger => 202

    /**
     * The gamepad d-pad up.
     * @type {Integer (Int32)}
     */
    static GamepadDPadUp => 203

    /**
     * The gamepad d-pad down.
     * @type {Integer (Int32)}
     */
    static GamepadDPadDown => 204

    /**
     * The gamepad d-pad left.
     * @type {Integer (Int32)}
     */
    static GamepadDPadLeft => 205

    /**
     * The gamepad d-pad right.
     * @type {Integer (Int32)}
     */
    static GamepadDPadRight => 206

    /**
     * The gamepad menu button.
     * @type {Integer (Int32)}
     */
    static GamepadMenu => 207

    /**
     * The gamepad view button.
     * @type {Integer (Int32)}
     */
    static GamepadView => 208

    /**
     * The gamepad left thumbstick button.
     * @type {Integer (Int32)}
     */
    static GamepadLeftThumbstickButton => 209

    /**
     * The gamepad right thumbstick button.
     * @type {Integer (Int32)}
     */
    static GamepadRightThumbstickButton => 210

    /**
     * The gamepad left thumbstick up.
     * @type {Integer (Int32)}
     */
    static GamepadLeftThumbstickUp => 211

    /**
     * The gamepad left thumbstick down.
     * @type {Integer (Int32)}
     */
    static GamepadLeftThumbstickDown => 212

    /**
     * The gamepad left thumbstick right.
     * @type {Integer (Int32)}
     */
    static GamepadLeftThumbstickRight => 213

    /**
     * The gamepad left thumbstick left.
     * @type {Integer (Int32)}
     */
    static GamepadLeftThumbstickLeft => 214

    /**
     * The gamepad right thumbstick up.
     * @type {Integer (Int32)}
     */
    static GamepadRightThumbstickUp => 215

    /**
     * The gamepad right thumbstick down.
     * @type {Integer (Int32)}
     */
    static GamepadRightThumbstickDown => 216

    /**
     * The gamepad right thumbstick right.
     * @type {Integer (Int32)}
     */
    static GamepadRightThumbstickRight => 217

    /**
     * The gamepad right thumbstick left.
     * @type {Integer (Int32)}
     */
    static GamepadRightThumbstickLeft => 218
}
