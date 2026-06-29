#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The TreeScope (uiautomationclient.h) enumeration contains values that specify the scope of various operations in the Microsoft UI Automation tree.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/ne-uiautomationclient-treescope
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct TreeScope {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The scope excludes the subtree from the search.
     * @type {Integer (Int32)}
     */
    static TreeScope_None => 0

    /**
     * The scope includes the element itself.
     * @type {Integer (Int32)}
     */
    static TreeScope_Element => 1

    /**
     * The scope includes children of the element.
     * @type {Integer (Int32)}
     */
    static TreeScope_Children => 2

    /**
     * The scope includes children and more distant descendants of the element.
     * @type {Integer (Int32)}
     */
    static TreeScope_Descendants => 4

    /**
     * The scope includes the parent of the element.
     * @type {Integer (Int32)}
     */
    static TreeScope_Parent => 8

    /**
     * The scope includes the parent and more distant ancestors of the element.
     * @type {Integer (Int32)}
     */
    static TreeScope_Ancestors => 16

    /**
     * The scope includes the element and all its descendants. This flag is a combination of the TreeScope_Element and TreeScope_Descendants values.
     * @type {Integer (Int32)}
     */
    static TreeScope_Subtree => 7
}
