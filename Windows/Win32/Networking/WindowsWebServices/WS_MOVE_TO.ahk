#Requires AutoHotkey v2.0.0 64-bit

/**
 * This enumeration identifies the various ways to move about an xml document.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_move_to
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_MOVE_TO{

    /**
     * Moves to the topmost element in the document.  If there is no root element, then the position is left unchanged.
     * @type {Integer (Int32)}
     */
    static WS_MOVE_TO_ROOT_ELEMENT => 0

    /**
     * Moves to the next element with the same depth and parent as the current node.  Text and comments are skipped.  If no element
 *           is found, then the position is left unchanged.
     * @type {Integer (Int32)}
     */
    static WS_MOVE_TO_NEXT_ELEMENT => 1

    /**
     * Moves to the previous element with the same depth and parent as the current node.  Text and comments are skipped.  If no element
 *           is found, then the position is left unchanged.
     * @type {Integer (Int32)}
     */
    static WS_MOVE_TO_PREVIOUS_ELEMENT => 2

    /**
     * Moves to the first child element below the current node.  Text and comments are skipped.  If no element is found, then the
 *           position is left unchanged.
     * @type {Integer (Int32)}
     */
    static WS_MOVE_TO_CHILD_ELEMENT => 3

    /**
     * If the current node is an element, then moves to its corresponding end element.  Otherwise, the position is left
 *           unchanged.
     * @type {Integer (Int32)}
     */
    static WS_MOVE_TO_END_ELEMENT => 4

    /**
     * Moves to the element node containing the current node.  End elements are considered the last child of their
 *           corresponding start element.  If the current position is the root element, then the position will be moved
 *           to <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_xml_node_type">WS_XML_NODE_TYPE_BOF</a>.  If the current position is <b>WS_XML_NODE_TYPE_BOF</b>, then
 *           current position is left unchanged.
     * @type {Integer (Int32)}
     */
    static WS_MOVE_TO_PARENT_ELEMENT => 5

    /**
     * Moves to the next sibling of the current node.  If the current node is an end element, then the position is left unchanged.
     * @type {Integer (Int32)}
     */
    static WS_MOVE_TO_NEXT_NODE => 6

    /**
     * Moves to the previous sibling of the current node.  If the current node is the first child of an element, then the position
 *           is left unchanged.
     * @type {Integer (Int32)}
     */
    static WS_MOVE_TO_PREVIOUS_NODE => 7

    /**
     * Moves to the first child of the parent of the current node.
     * @type {Integer (Int32)}
     */
    static WS_MOVE_TO_FIRST_NODE => 8

    /**
     * Moves to the position logically before the first node in the document.
     * @type {Integer (Int32)}
     */
    static WS_MOVE_TO_BOF => 9

    /**
     * Moves to the position logically after the last node in the document.
     * @type {Integer (Int32)}
     */
    static WS_MOVE_TO_EOF => 10

    /**
     * Moves to the first child of the current node.  If the node has no children then the position is left unchanged.
     * @type {Integer (Int32)}
     */
    static WS_MOVE_TO_CHILD_NODE => 11
}
