#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Represents information about the effects of a drag-and-drop operation.
 * @remarks
 * Your application should always mask values from the **DROPEFFECT** enumeration to ensure compatibility with future implementations. Presently, only some of the positions in a **DROPEFFECT** value have meaning. In the future, more interpretations for the bits will be added. Drag sources and drop targets should carefully mask these values appropriately before comparing. They should never compare a **DROPEFFECT** against, say, DROPEFFECT\_COPY by doing the following:
 * 
 * ``` syntax
 * if (dwDropEffect == DROPEFFECT_COPY)... 
 * ```
 * 
 * Instead, the application should always mask for the value or values being sought as using one of the following techniques:
 * 
 * ``` syntax
 * if (dwDropEffect & DROPEFFECT_COPY) == DROPEFFECT_COPY)...
 * 
 * if (dwDropEffect & DROPEFFECT_COPY)... 
 * ```
 * 
 * This allows for the definition of new drop effects, while preserving backward compatibility with existing code.
 * @see https://learn.microsoft.com/windows/win32/com/dropeffect-constants
 * @namespace Windows.Win32.System.Ole
 */
class DROPEFFECT extends Win32BitflagEnum {

    /**
     * Native name: DROPEFFECT_NONE
     * @type {Integer (UInt32)}
     */
    static NONE => 0

    /**
     * Native name: DROPEFFECT_COPY
     * @type {Integer (UInt32)}
     */
    static COPY => 1

    /**
     * Native name: DROPEFFECT_MOVE
     * @type {Integer (UInt32)}
     */
    static MOVE => 2

    /**
     * Native name: DROPEFFECT_LINK
     * @type {Integer (UInt32)}
     */
    static LINK => 4

    /**
     * Native name: DROPEFFECT_SCROLL
     * @type {Integer (UInt32)}
     */
    static SCROLL => 2147483648
}
