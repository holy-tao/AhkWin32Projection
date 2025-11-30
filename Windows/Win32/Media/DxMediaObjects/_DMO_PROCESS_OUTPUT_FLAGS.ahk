#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The DMO_PROCESS_OUTPUT_FLAGS enumeration defines flags that specify output processing requests.
 * @see https://docs.microsoft.com/windows/win32/api//mediaobj/ne-mediaobj-_dmo_process_output_flags
 * @namespace Windows.Win32.Media.DxMediaObjects
 * @version v4.0.30319
 */
class _DMO_PROCESS_OUTPUT_FLAGS extends Win32Enum{

    /**
     * Discard the output when the pointer to the output buffer is <b>NULL</b>.
     * @type {Integer (Int32)}
     */
    static DMO_PROCESS_OUTPUT_DISCARD_WHEN_NO_BUFFER => 1
}
