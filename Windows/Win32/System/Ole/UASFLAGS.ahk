#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Provides information about the parent undo unit.
 * @see https://learn.microsoft.com/windows/win32/api/ocidl/ne-ocidl-uasflags
 * @namespace Windows.Win32.System.Ole
 */
export default struct UASFLAGS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The currently open parent undo unit is in a normal, unblocked state and can accept any new units added through calls to its <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-ioleparentundounit-open">Open</a> or <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-ioleparentundounit-add">Add</a> methods.
     * @type {Integer (Int32)}
     */
    static UAS_NORMAL => 0

    /**
     * The currently open undo unit is blocked and will reject any undo units added through calls to its <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-ioleparentundounit-open">IOleParentUndoUnit::Open</a> or <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-ioleparentundounit-add">IOleParentUndoUnit::Add</a> methods. The caller need not create any new units since they will just be rejected.
     * @type {Integer (Int32)}
     */
    static UAS_BLOCKED => 1

    /**
     * The currently open undo unit will accept new units, but the caller should act like there is no currently open unit. This means that if the new unit being created requires a parent, then this parent does not satisfy that requirement and the undo stack should be cleared.
     * @type {Integer (Int32)}
     */
    static UAS_NOPARENTENABLE => 2

    /**
     * When checking for a normal state, use this value to mask unused bits in the <i>pdwState</i> parameter to the <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-ioleparentundounit-getparentstate">IOleParentUndoUnit::GetParentState</a> method for future compatibility. For example:
     * 
     * 
     * ``` syntax
     * fNormal = ((pdwState &amp; UAS_MASK) == UAS_NORMAL)
     * ```
     * @type {Integer (Int32)}
     */
    static UAS_MASK => 3
}
