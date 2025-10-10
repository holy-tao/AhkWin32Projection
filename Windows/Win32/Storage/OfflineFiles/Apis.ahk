#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Storage.OfflineFiles
 * @version v4.0.30319
 */
class OfflineFiles {

;@region Constants

    /**
     * @type {Integer (UInt32)}
     */
    static OFFLINEFILES_SYNC_STATE_LOCAL_KNOWN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static OFFLINEFILES_SYNC_STATE_REMOTE_KNOWN => 2

    /**
     * @type {Integer (UInt32)}
     */
    static OFFLINEFILES_CHANGES_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static OFFLINEFILES_CHANGES_LOCAL_SIZE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static OFFLINEFILES_CHANGES_LOCAL_ATTRIBUTES => 2

    /**
     * @type {Integer (UInt32)}
     */
    static OFFLINEFILES_CHANGES_LOCAL_TIME => 4

    /**
     * @type {Integer (UInt32)}
     */
    static OFFLINEFILES_CHANGES_REMOTE_SIZE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static OFFLINEFILES_CHANGES_REMOTE_ATTRIBUTES => 16

    /**
     * @type {Integer (UInt32)}
     */
    static OFFLINEFILES_CHANGES_REMOTE_TIME => 32

    /**
     * @type {Integer (UInt32)}
     */
    static OFFLINEFILES_ITEM_FILTER_FLAG_MODIFIED_DATA => 1

    /**
     * @type {Integer (UInt32)}
     */
    static OFFLINEFILES_ITEM_FILTER_FLAG_MODIFIED_ATTRIBUTES => 2

    /**
     * @type {Integer (UInt32)}
     */
    static OFFLINEFILES_ITEM_FILTER_FLAG_MODIFIED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static OFFLINEFILES_ITEM_FILTER_FLAG_CREATED => 8

    /**
     * @type {Integer (UInt32)}
     */
    static OFFLINEFILES_ITEM_FILTER_FLAG_DELETED => 16

    /**
     * @type {Integer (UInt32)}
     */
    static OFFLINEFILES_ITEM_FILTER_FLAG_DIRTY => 32

    /**
     * @type {Integer (UInt32)}
     */
    static OFFLINEFILES_ITEM_FILTER_FLAG_SPARSE => 64

    /**
     * @type {Integer (UInt32)}
     */
    static OFFLINEFILES_ITEM_FILTER_FLAG_FILE => 128

    /**
     * @type {Integer (UInt32)}
     */
    static OFFLINEFILES_ITEM_FILTER_FLAG_DIRECTORY => 256

    /**
     * @type {Integer (UInt32)}
     */
    static OFFLINEFILES_ITEM_FILTER_FLAG_PINNED_USER => 512

    /**
     * @type {Integer (UInt32)}
     */
    static OFFLINEFILES_ITEM_FILTER_FLAG_PINNED_OTHERS => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static OFFLINEFILES_ITEM_FILTER_FLAG_PINNED_COMPUTER => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static OFFLINEFILES_ITEM_FILTER_FLAG_PINNED => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static OFFLINEFILES_ITEM_FILTER_FLAG_GHOST => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static OFFLINEFILES_ITEM_FILTER_FLAG_SUSPENDED => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static OFFLINEFILES_ITEM_FILTER_FLAG_OFFLINE => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static OFFLINEFILES_ITEM_FILTER_FLAG_ONLINE => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static OFFLINEFILES_ITEM_FILTER_FLAG_USER_WRITE => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static OFFLINEFILES_ITEM_FILTER_FLAG_USER_READ => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static OFFLINEFILES_ITEM_FILTER_FLAG_USER_ANYACCESS => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static OFFLINEFILES_ITEM_FILTER_FLAG_OTHER_WRITE => 1048576

    /**
     * @type {Integer (UInt32)}
     */
    static OFFLINEFILES_ITEM_FILTER_FLAG_OTHER_READ => 2097152

    /**
     * @type {Integer (UInt32)}
     */
    static OFFLINEFILES_ITEM_FILTER_FLAG_OTHER_ANYACCESS => 4194304

    /**
     * @type {Integer (UInt32)}
     */
    static OFFLINEFILES_ITEM_FILTER_FLAG_GUEST_WRITE => 8388608

    /**
     * @type {Integer (UInt32)}
     */
    static OFFLINEFILES_ITEM_FILTER_FLAG_GUEST_READ => 16777216

    /**
     * @type {Integer (UInt32)}
     */
    static OFFLINEFILES_ITEM_FILTER_FLAG_GUEST_ANYACCESS => 33554432

    /**
     * @type {Integer (UInt32)}
     */
    static OFFLINEFILES_ITEM_QUERY_REMOTEINFO => 1

    /**
     * @type {Integer (UInt32)}
     */
    static OFFLINEFILES_ITEM_QUERY_CONNECTIONSTATE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static OFFLINEFILES_ITEM_QUERY_LOCALDIRTYBYTECOUNT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static OFFLINEFILES_ITEM_QUERY_REMOTEDIRTYBYTECOUNT => 8

    /**
     * @type {Integer (UInt32)}
     */
    static OFFLINEFILES_ITEM_QUERY_INCLUDETRANSPARENTCACHE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static OFFLINEFILES_ITEM_QUERY_ATTEMPT_TRANSITIONONLINE => 32

    /**
     * @type {Integer (UInt32)}
     */
    static OFFLINEFILES_ITEM_QUERY_ADMIN => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static OFFLINEFILES_ENUM_FLAT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static OFFLINEFILES_ENUM_FLAT_FILESONLY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static OFFLINEFILES_SETTING_SCOPE_USER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static OFFLINEFILES_SETTING_SCOPE_COMPUTER => 2

    /**
     * @type {String}
     */
    static OFFLINEFILES_SETTING_PinLinkTargets => "LinkTargetCaching"

    /**
     * @type {Integer (UInt32)}
     */
    static OFFLINEFILES_PINLINKTARGETS_NEVER => 0

    /**
     * @type {Integer (UInt32)}
     */
    static OFFLINEFILES_PINLINKTARGETS_EXPLICIT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static OFFLINEFILES_PINLINKTARGETS_ALWAYS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static OFFLINEFILES_SYNC_CONTROL_FLAG_FILLSPARSE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static OFFLINEFILES_SYNC_CONTROL_FLAG_SYNCIN => 2

    /**
     * @type {Integer (UInt32)}
     */
    static OFFLINEFILES_SYNC_CONTROL_FLAG_SYNCOUT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static OFFLINEFILES_SYNC_CONTROL_FLAG_PINNEWFILES => 8

    /**
     * @type {Integer (UInt32)}
     */
    static OFFLINEFILES_SYNC_CONTROL_FLAG_PINLINKTARGETS => 16

    /**
     * @type {Integer (UInt32)}
     */
    static OFFLINEFILES_SYNC_CONTROL_FLAG_PINFORUSER => 32

    /**
     * @type {Integer (UInt32)}
     */
    static OFFLINEFILES_SYNC_CONTROL_FLAG_PINFORUSER_POLICY => 64

    /**
     * @type {Integer (UInt32)}
     */
    static OFFLINEFILES_SYNC_CONTROL_FLAG_PINFORALL => 128

    /**
     * @type {Integer (UInt32)}
     */
    static OFFLINEFILES_SYNC_CONTROL_FLAG_PINFORREDIR => 256

    /**
     * @type {Integer (UInt32)}
     */
    static OFFLINEFILES_SYNC_CONTROL_FLAG_LOWPRIORITY => 512

    /**
     * @type {Integer (UInt32)}
     */
    static OFFLINEFILES_SYNC_CONTROL_FLAG_ASYNCPROGRESS => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static OFFLINEFILES_SYNC_CONTROL_FLAG_INTERACTIVE => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static OFFLINEFILES_SYNC_CONTROL_FLAG_CONSOLE => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static OFFLINEFILES_SYNC_CONTROL_FLAG_SKIPSUSPENDEDDIRS => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static OFFLINEFILES_SYNC_CONTROL_FLAG_BACKGROUND => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static OFFLINEFILES_SYNC_CONTROL_FLAG_NONEWFILESOUT => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static OFFLINEFILES_SYNC_CONTROL_CR_MASK => 4026531840

    /**
     * @type {Integer (UInt32)}
     */
    static OFFLINEFILES_SYNC_CONTROL_CR_DEFAULT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static OFFLINEFILES_SYNC_CONTROL_CR_KEEPLOCAL => 268435456

    /**
     * @type {Integer (UInt32)}
     */
    static OFFLINEFILES_SYNC_CONTROL_CR_KEEPREMOTE => 536870912

    /**
     * @type {Integer (UInt32)}
     */
    static OFFLINEFILES_SYNC_CONTROL_CR_KEEPLATEST => 805306368

    /**
     * @type {Integer (UInt32)}
     */
    static OFFLINEFILES_PIN_CONTROL_FLAG_FORUSER => 32

    /**
     * @type {Integer (UInt32)}
     */
    static OFFLINEFILES_PIN_CONTROL_FLAG_FORUSER_POLICY => 64

    /**
     * @type {Integer (UInt32)}
     */
    static OFFLINEFILES_PIN_CONTROL_FLAG_FORALL => 128

    /**
     * @type {Integer (UInt32)}
     */
    static OFFLINEFILES_PIN_CONTROL_FLAG_FORREDIR => 256

    /**
     * @type {Integer (UInt32)}
     */
    static OFFLINEFILES_PIN_CONTROL_FLAG_FILL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static OFFLINEFILES_PIN_CONTROL_FLAG_LOWPRIORITY => 512

    /**
     * @type {Integer (UInt32)}
     */
    static OFFLINEFILES_PIN_CONTROL_FLAG_ASYNCPROGRESS => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static OFFLINEFILES_PIN_CONTROL_FLAG_INTERACTIVE => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static OFFLINEFILES_PIN_CONTROL_FLAG_CONSOLE => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static OFFLINEFILES_PIN_CONTROL_FLAG_PINLINKTARGETS => 16

    /**
     * @type {Integer (UInt32)}
     */
    static OFFLINEFILES_PIN_CONTROL_FLAG_BACKGROUND => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static OFFLINEFILES_ENCRYPTION_CONTROL_FLAG_LOWPRIORITY => 512

    /**
     * @type {Integer (UInt32)}
     */
    static OFFLINEFILES_ENCRYPTION_CONTROL_FLAG_ASYNCPROGRESS => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static OFFLINEFILES_ENCRYPTION_CONTROL_FLAG_INTERACTIVE => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static OFFLINEFILES_ENCRYPTION_CONTROL_FLAG_CONSOLE => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static OFFLINEFILES_ENCRYPTION_CONTROL_FLAG_BACKGROUND => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static OFFLINEFILES_DELETE_FLAG_NOAUTOCACHED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static OFFLINEFILES_DELETE_FLAG_NOPINNED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static OFFLINEFILES_DELETE_FLAG_DELMODIFIED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static OFFLINEFILES_DELETE_FLAG_ADMIN => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static OFFLINEFILES_TRANSITION_FLAG_INTERACTIVE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static OFFLINEFILES_TRANSITION_FLAG_CONSOLE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static OFFLINEFILES_SYNC_ITEM_CHANGE_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static OFFLINEFILES_SYNC_ITEM_CHANGE_CHANGETIME => 1

    /**
     * @type {Integer (UInt32)}
     */
    static OFFLINEFILES_SYNC_ITEM_CHANGE_WRITETIME => 2

    /**
     * @type {Integer (UInt32)}
     */
    static OFFLINEFILES_SYNC_ITEM_CHANGE_FILESIZE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static OFFLINEFILES_SYNC_ITEM_CHANGE_ATTRIBUTES => 8
;@endregion Constants

;@region Methods
    /**
     * Enables or disables the Offline Files feature.
     * @param {Integer} bEnable Specify <b>TRUE</b> to enable Offline Files, or <b>FALSE</b> to disable.
     * @param {Pointer<Int32>} pbRebootRequired Receives <b>TRUE</b> if a system restart is necessary to apply the desired configuration, or <b>FALSE</b> otherwise.
     * @returns {Integer} Returns <b>ERROR_SUCCESS</b> if successful or a Win32 error value otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//cscapi/nf-cscapi-offlinefilesenable
     * @since windows6.0.6000
     */
    static OfflineFilesEnable(bEnable, pbRebootRequired) {
        result := DllCall("CSCAPI.dll\OfflineFilesEnable", "int", bEnable, "int*", pbRebootRequired, "uint")
        return result
    }

    /**
     * Starts the Offline Files service.
     * @returns {Integer} Returns <b>ERROR_SUCCESS</b> if successful or a Win32 error value otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//cscapi/nf-cscapi-offlinefilesstart
     * @since windows8.0
     */
    static OfflineFilesStart() {
        result := DllCall("CSCAPI.dll\OfflineFilesStart", "uint")
        return result
    }

    /**
     * Determines whether the Offline Files feature is enabled and, if so, whether it is active.
     * @param {Pointer<Int32>} pbActive Receives <b>TRUE</b> if both the CSC driver and Offline Files Service are in the running state, or  <b>FALSE</b> otherwise. This parameter is optional and can be <b>NULL</b>.
     * @param {Pointer<Int32>} pbEnabled Receives <b>TRUE</b> if the CSC driver's start type is set to <b>SERVICE_SYSTEM_START</b> and the Offline Files service's start type is set to <b>SERVICE_AUTO_START</b>, or <b>FALSE</b> otherwise. This parameter is optional and can be <b>NULL</b>.
     * @returns {Integer} Returns <b>ERROR_SUCCESS</b> if successful or a Win32 error value otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//cscapi/nf-cscapi-offlinefilesquerystatus
     * @since windows6.0.6000
     */
    static OfflineFilesQueryStatus(pbActive, pbEnabled) {
        result := DllCall("CSCAPI.dll\OfflineFilesQueryStatus", "int*", pbActive, "int*", pbEnabled, "uint")
        return result
    }

    /**
     * Determines whether the Offline Files feature is enabled and, if so, whether it is active and available. This function is identical to the OfflineFilesQueryStatus function, except that it has an additional output parameter.
     * @param {Pointer<Int32>} pbActive Receives <b>TRUE</b> if both the CSC driver and Offline Files Service are in the running state, or  <b>FALSE</b> otherwise. This parameter is optional and can be <b>NULL</b>.
     * @param {Pointer<Int32>} pbEnabled Receives <b>TRUE</b> if the CSC driver's start type is set to <b>SERVICE_SYSTEM_START</b> and the Offline Files service's start type is set to <b>SERVICE_AUTO_START</b>, or <b>FALSE</b> otherwise. This parameter is optional and can be <b>NULL</b>.
     * @param {Pointer<Int32>} pbAvailable Receives <b>TRUE</b> if the Offline Files Service is ready to be started without requiring the computer to be restarted, or  <b>FALSE</b> otherwise. This parameter is optional and can be <b>NULL</b>.
     * @returns {Integer} Returns <b>ERROR_SUCCESS</b> if successful or a Win32 error value otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//cscapi/nf-cscapi-offlinefilesquerystatusex
     * @since windows8.0
     */
    static OfflineFilesQueryStatusEx(pbActive, pbEnabled, pbAvailable) {
        result := DllCall("CSCAPI.dll\OfflineFilesQueryStatusEx", "int*", pbActive, "int*", pbEnabled, "int*", pbAvailable, "uint")
        return result
    }

;@endregion Methods
}
