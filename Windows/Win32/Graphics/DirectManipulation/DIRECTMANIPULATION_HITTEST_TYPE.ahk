#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines how hit testing is handled by Direct Manipulation when using a dedicated hit-test thread registered through RegisterHitTestTarget.
 * @see https://docs.microsoft.com/windows/win32/api//directmanipulation/ne-directmanipulation-directmanipulation_hittest_type
 * @namespace Windows.Win32.Graphics.DirectManipulation
 * @version v4.0.30319
 */
class DIRECTMANIPULATION_HITTEST_TYPE extends Win32BitflagEnum{

    /**
     * The hit-test thread receives <a href="https://docs.microsoft.com/previous-versions/windows/desktop/inputmsg/wm-pointerdown">WM_POINTERDOWN</a> messages and specifies whether to call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/nf-directmanipulation-idirectmanipulationviewport-setcontact">SetContact</a>. If <b>SetContact</b> is not called, the contact will not be associated with a viewport.
     * @type {Integer (Int32)}
     */
    static DIRECTMANIPULATION_HITTEST_TYPE_ASYNCHRONOUS => 0

    /**
     * The UI thread always receives <a href="https://docs.microsoft.com/previous-versions/windows/desktop/inputmsg/wm-pointerdown">WM_POINTERDOWN</a> messages after the hit-test thread. A call to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/nf-directmanipulation-idirectmanipulationviewport-setcontact">SetContact</a> is not required.
     * @type {Integer (Int32)}
     */
    static DIRECTMANIPULATION_HITTEST_TYPE_SYNCHRONOUS => 1

    /**
     * The UI thread receives <a href="https://docs.microsoft.com/previous-versions/windows/desktop/inputmsg/wm-pointerdown">WM_POINTERDOWN</a> messages only when <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/nf-directmanipulation-idirectmanipulationviewport-setcontact">SetContact</a> isn't called by the hit-test thread.
     * @type {Integer (Int32)}
     */
    static DIRECTMANIPULATION_HITTEST_TYPE_AUTO_SYNCHRONOUS => 2
}
