#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains the input injection details.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/ns-winuser-input_injection_value
 * @namespace Windows.Win32.UI.Input.Pointer
 */
export default struct INPUT_INJECTION_VALUE {
    #StructPack 4

    /**
     * The Usage Page ID, such as VR Controls Page (0x03) or Game Controls Page (0x05).
     */
    page : UInt16

    /**
     * The Usage ID associated with a Usage Page, such as Turn Right/Left (21) or Move Right/Left (24) for a Game Controls Page.
     */
    usage : UInt16

    /**
     * The injected input value.
     */
    value : Int32

    /**
     * The Usage index, such as the selected item in a  radio button set.
     */
    index : UInt16

}
