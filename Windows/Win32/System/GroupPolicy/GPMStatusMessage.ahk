#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The IGPMStatusMessage interface contains property methods that retrieve various properties of status messages related to GPO operations.
 * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nn-gpmgmt-igpmstatusmessage
 * @namespace Windows.Win32.System.GroupPolicy
 */
class GPMStatusMessage extends Win32Struct {
    static sizeof => 0

    static packingSize => 1
}
