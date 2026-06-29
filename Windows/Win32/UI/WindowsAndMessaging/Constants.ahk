#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Graphics\Gdi\HBITMAP.ahk" { HBITMAP }

/**
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 */

;@region Constants

/**
 * @type {Integer (UInt32)}
 */
export global WM_CONTEXTMENU := 123

/**
 * @type {Integer (UInt32)}
 */
export global WM_UNICHAR := 265

/**
 * @type {Integer (UInt32)}
 */
export global WM_PRINTCLIENT := 792

/**
 * @type {Integer (UInt32)}
 */
export global WM_NOTIFY := 78

/**
 * @type {Guid}
 */
export global GUID_IO_VOLUME_CHANGE := Guid("{7373654a-812a-11d0-bec7-08002be2092f}")

/**
 * @type {Guid}
 */
export global GUID_IO_VOLUME_DISMOUNT := Guid("{d16a55e8-1059-11d2-8ffd-00a0c9a06d32}")

/**
 * @type {Guid}
 */
export global GUID_IO_VOLUME_DISMOUNT_FAILED := Guid("{e3c5b178-105d-11d2-8ffd-00a0c9a06d32}")

/**
 * @type {Guid}
 */
export global GUID_IO_VOLUME_MOUNT := Guid("{b5804878-1a96-11d2-8ffd-00a0c9a06d32}")

/**
 * @type {Guid}
 */
export global GUID_IO_VOLUME_LOCK := Guid("{50708874-c9af-11d1-8fef-00a0c9a06d32}")

/**
 * @type {Guid}
 */
export global GUID_IO_VOLUME_LOCK_FAILED := Guid("{ae2eed10-0ba8-11d2-8ffb-00a0c9a06d32}")

/**
 * @type {Guid}
 */
export global GUID_IO_VOLUME_UNLOCK := Guid("{9a8c3d68-d0cb-11d1-8fef-00a0c9a06d32}")

/**
 * @type {Guid}
 */
export global GUID_IO_VOLUME_NAME_CHANGE := Guid("{2de97f83-4c06-11d2-a532-00609713055a}")

/**
 * @type {Guid}
 */
export global GUID_IO_VOLUME_NEED_CHKDSK := Guid("{799a0960-0a0b-4e03-ad88-2fa7c6ce748a}")

/**
 * @type {Guid}
 */
export global GUID_IO_VOLUME_WORM_NEAR_FULL := Guid("{f3bfff82-f3de-48d2-af95-457f80b763f2}")

/**
 * @type {Guid}
 */
export global GUID_IO_VOLUME_WEARING_OUT := Guid("{873113ca-1486-4508-82ac-c3b2e5297aaa}")

/**
 * @type {Guid}
 */
export global GUID_IO_VOLUME_FORCE_CLOSED := Guid("{411ad84f-433e-4dc2-a5ae-4a2d1a2de654}")

/**
 * @type {Guid}
 */
export global GUID_IO_VOLUME_INFO_MAKE_COMPAT := Guid("{3ab9a0d2-ef80-45cf-8cdc-cbe02a212906}")

/**
 * @type {Guid}
 */
export global GUID_IO_VOLUME_PREPARING_EJECT := Guid("{c79eb16e-0dac-4e7a-a86c-b25ceeaa88f6}")

/**
 * @type {Guid}
 */
export global GUID_IO_VOLUME_BACKGROUND_FORMAT := Guid("{a2e5fc86-d5cd-4038-b2e3-4445065c2377}")

/**
 * @type {Guid}
 */
export global GUID_IO_VOLUME_PHYSICAL_CONFIGURATION_CHANGE := Guid("{2de97f84-4c06-11d2-a532-00609713055a}")

/**
 * @type {Guid}
 */
export global GUID_IO_VOLUME_PREPARE_DELETE := Guid("{ac0707fb-4a9a-4c81-9e2e-385b79a8fd28}")

/**
 * @type {Guid}
 */
export global GUID_IO_VOLUME_UNIQUE_ID_CHANGE := Guid("{af39da42-6622-41f5-970b-139d092fa3d9}")

/**
 * @type {Guid}
 */
export global GUID_IO_VOLUME_FVE_STATUS_CHANGE := Guid("{062998b2-ee1f-4b6a-b857-e76cbbe9a6da}")

/**
 * @type {Guid}
 */
export global GUID_IO_VOLUME_DEVICE_INTERFACE := Guid("{53f5630d-b6bf-11d0-94f2-00a0c91efb8b}")

/**
 * @type {Guid}
 */
export global GUID_IO_VOLUME_CHANGE_SIZE := Guid("{3a1625be-ad03-49f1-8ef8-6bbac182d1fd}")

/**
 * @type {Guid}
 */
export global GUID_IO_MEDIA_ARRIVAL := Guid("{d07433c0-a98e-11d2-917a-00a0c9068ff3}")

/**
 * @type {Guid}
 */
export global GUID_IO_MEDIA_REMOVAL := Guid("{d07433c1-a98e-11d2-917a-00a0c9068ff3}")

/**
 * @type {Guid}
 */
export global GUID_IO_CDROM_EXCLUSIVE_LOCK := Guid("{bc56c139-7a10-47ee-a294-4c6a38f0149a}")

/**
 * @type {Guid}
 */
export global GUID_IO_CDROM_EXCLUSIVE_UNLOCK := Guid("{a3b6d27d-5e35-4885-81e5-ee18c00ed779}")

/**
 * @type {Guid}
 */
export global GUID_IO_DEVICE_BECOMING_READY := Guid("{d07433f0-a98e-11d2-917a-00a0c9068ff3}")

/**
 * @type {Guid}
 */
export global GUID_IO_DEVICE_EXTERNAL_REQUEST := Guid("{d07433d0-a98e-11d2-917a-00a0c9068ff3}")

/**
 * @type {Guid}
 */
export global GUID_IO_MEDIA_EJECT_REQUEST := Guid("{d07433d1-a98e-11d2-917a-00a0c9068ff3}")

/**
 * @type {Guid}
 */
export global GUID_IO_DRIVE_REQUIRES_CLEANING := Guid("{7207877c-90ed-44e5-a000-81428d4c79bb}")

/**
 * @type {Guid}
 */
export global GUID_IO_TAPE_ERASE := Guid("{852d11eb-4bb8-4507-9d9b-417cc2b1b438}")

/**
 * @type {Guid}
 */
export global GUID_DEVICE_EVENT_RBC := Guid("{d0744792-a98e-11d2-917a-00a0c9068ff3}")

/**
 * @type {Guid}
 */
export global GUID_IO_DISK_CLONE_ARRIVAL := Guid("{6a61885b-7c39-43dd-9b56-b8ac22a549aa}")

/**
 * @type {Guid}
 */
export global GUID_IO_DISK_LAYOUT_CHANGE := Guid("{11dff54c-8469-41f9-b3de-ef836487c54a}")

/**
 * @type {Guid}
 */
export global GUID_IO_DISK_HEALTH_NOTIFICATION := Guid("{0f1bd644-3916-49c5-b063-991940118fb2}")

/**
 * @type {Integer (UInt32)}
 */
export global STRSAFE_USE_SECURE_CRT := 0

/**
 * @type {Integer (UInt32)}
 */
export global STRSAFE_MAX_CCH := 2147483647

/**
 * @type {Integer (UInt32)}
 */
export global STRSAFE_MAX_LENGTH := 2147483646

/**
 * @type {Integer (UInt32)}
 */
export global STRSAFE_IGNORE_NULLS := 256

/**
 * @type {Integer (UInt32)}
 */
export global STRSAFE_FILL_BEHIND_NULL := 512

/**
 * @type {Integer (UInt32)}
 */
export global STRSAFE_FILL_ON_FAILURE := 1024

/**
 * @type {Integer (UInt32)}
 */
export global STRSAFE_NULL_ON_FAILURE := 2048

/**
 * @type {Integer (UInt32)}
 */
export global STRSAFE_NO_TRUNCATION := 4096

/**
 * @type {Integer (Int32)}
 */
export global STRSAFE_E_INSUFFICIENT_BUFFER := -2147024774

/**
 * @type {Integer (Int32)}
 */
export global STRSAFE_E_INVALID_PARAMETER := -2147024809

/**
 * @type {Integer (Int32)}
 */
export global STRSAFE_E_END_OF_FILE := -2147024858

/**
 * @type {Integer (UInt32)}
 */
export global __WARNING_CYCLOMATIC_COMPLEXITY := 28734

/**
 * @type {Integer (UInt32)}
 */
export global __WARNING_USING_UNINIT_VAR := 6001

/**
 * @type {Integer (UInt32)}
 */
export global __WARNING_RETURN_UNINIT_VAR := 6101

/**
 * @type {Integer (UInt32)}
 */
export global __WARNING_DEREF_NULL_PTR := 6011

/**
 * @type {Integer (UInt32)}
 */
export global __WARNING_MISSING_ZERO_TERMINATION2 := 6054

/**
 * @type {Integer (UInt32)}
 */
export global __WARNING_INVALID_PARAM_VALUE_1 := 6387

/**
 * @type {Integer (UInt32)}
 */
export global __WARNING_UNSAFE_STRING_FUNCTION := 25025

/**
 * @type {Integer (UInt32)}
 */
export global __WARNING_INCORRECT_ANNOTATION := 26007

/**
 * @type {Integer (UInt32)}
 */
export global __WARNING_POTENTIAL_BUFFER_OVERFLOW_HIGH_PRIORITY := 26015

/**
 * @type {Integer (UInt32)}
 */
export global __WARNING_PRECONDITION_NULLTERMINATION_VIOLATION := 26035

/**
 * @type {Integer (UInt32)}
 */
export global __WARNING_POSTCONDITION_NULLTERMINATION_VIOLATION := 26036

/**
 * @type {Integer (UInt32)}
 */
export global __WARNING_HIGH_PRIORITY_OVERFLOW_POSTCONDITION := 26045

/**
 * @type {Integer (UInt32)}
 */
export global __WARNING_RANGE_POSTCONDITION_VIOLATION := 26061

/**
 * @type {Integer (UInt32)}
 */
export global __WARNING_POTENTIAL_RANGE_POSTCONDITION_VIOLATION := 26071

/**
 * @type {Integer (UInt32)}
 */
export global __WARNING_INVALID_PARAM_VALUE_3 := 28183

/**
 * @type {Integer (UInt32)}
 */
export global __WARNING_RETURNING_BAD_RESULT := 28196

/**
 * @type {Integer (UInt32)}
 */
export global __WARNING_BANNED_API_USAGE := 28719

/**
 * @type {Integer (UInt32)}
 */
export global __WARNING_POST_EXPECTED := 28210

/**
 * @type {Integer (UInt32)}
 */
export global WM_DEVICECHANGE := 537

/**
 * @type {Integer (UInt32)}
 */
export global BSF_MSGSRV32ISOK := 2147483648

/**
 * @type {Integer (UInt32)}
 */
export global BSF_MSGSRV32ISOK_BIT := 31

/**
 * @type {Integer (UInt32)}
 */
export global BSM_VXDS := 1

/**
 * @type {Integer (UInt32)}
 */
export global BSM_NETDRIVER := 2

/**
 * @type {Integer (UInt32)}
 */
export global BSM_INSTALLABLEDRIVERS := 4

/**
 * @type {Integer (UInt32)}
 */
export global DBT_APPYBEGIN := 0

/**
 * @type {Integer (UInt32)}
 */
export global DBT_APPYEND := 1

/**
 * @type {Integer (UInt32)}
 */
export global DBT_DEVNODES_CHANGED := 7

/**
 * @type {Integer (UInt32)}
 */
export global DBT_QUERYCHANGECONFIG := 23

/**
 * @type {Integer (UInt32)}
 */
export global DBT_CONFIGCHANGED := 24

/**
 * @type {Integer (UInt32)}
 */
export global DBT_CONFIGCHANGECANCELED := 25

/**
 * @type {Integer (UInt32)}
 */
export global DBT_MONITORCHANGE := 27

/**
 * @type {Integer (UInt32)}
 */
export global DBT_SHELLLOGGEDON := 32

/**
 * @type {Integer (UInt32)}
 */
export global DBT_CONFIGMGAPI32 := 34

/**
 * @type {Integer (UInt32)}
 */
export global DBT_VXDINITCOMPLETE := 35

/**
 * @type {Integer (UInt32)}
 */
export global DBT_VOLLOCKQUERYLOCK := 32833

/**
 * @type {Integer (UInt32)}
 */
export global DBT_VOLLOCKLOCKTAKEN := 32834

/**
 * @type {Integer (UInt32)}
 */
export global DBT_VOLLOCKLOCKFAILED := 32835

/**
 * @type {Integer (UInt32)}
 */
export global DBT_VOLLOCKQUERYUNLOCK := 32836

/**
 * @type {Integer (UInt32)}
 */
export global DBT_VOLLOCKLOCKRELEASED := 32837

/**
 * @type {Integer (UInt32)}
 */
export global DBT_VOLLOCKUNLOCKFAILED := 32838

/**
 * @type {Integer (UInt32)}
 */
export global LOCKP_ALLOW_WRITES := 1

/**
 * @type {Integer (UInt32)}
 */
export global LOCKP_FAIL_WRITES := 0

/**
 * @type {Integer (UInt32)}
 */
export global LOCKP_FAIL_MEM_MAPPING := 2

/**
 * @type {Integer (UInt32)}
 */
export global LOCKP_ALLOW_MEM_MAPPING := 0

/**
 * @type {Integer (UInt32)}
 */
export global LOCKP_USER_MASK := 3

/**
 * @type {Integer (UInt32)}
 */
export global LOCKP_LOCK_FOR_FORMAT := 4

/**
 * @type {Integer (UInt32)}
 */
export global LOCKF_LOGICAL_LOCK := 0

/**
 * @type {Integer (UInt32)}
 */
export global LOCKF_PHYSICAL_LOCK := 1

/**
 * @type {Integer (UInt32)}
 */
export global DBT_NO_DISK_SPACE := 71

/**
 * @type {Integer (UInt32)}
 */
export global DBT_LOW_DISK_SPACE := 72

/**
 * @type {Integer (UInt32)}
 */
export global DBT_CONFIGMGPRIVATE := 32767

/**
 * @type {Integer (UInt32)}
 */
export global DBT_DEVICEARRIVAL := 32768

/**
 * @type {Integer (UInt32)}
 */
export global DBT_DEVICEQUERYREMOVE := 32769

/**
 * @type {Integer (UInt32)}
 */
export global DBT_DEVICEQUERYREMOVEFAILED := 32770

/**
 * @type {Integer (UInt32)}
 */
export global DBT_DEVICEREMOVEPENDING := 32771

/**
 * @type {Integer (UInt32)}
 */
export global DBT_DEVICEREMOVECOMPLETE := 32772

/**
 * @type {Integer (UInt32)}
 */
export global DBT_DEVICETYPESPECIFIC := 32773

/**
 * @type {Integer (UInt32)}
 */
export global DBT_CUSTOMEVENT := 32774

/**
 * @type {Integer (UInt32)}
 */
export global DBT_DEVTYP_DEVNODE := 1

/**
 * @type {Integer (UInt32)}
 */
export global DBT_DEVTYP_NET := 4

/**
 * @type {Integer (UInt32)}
 */
export global DBTF_RESOURCE := 1

/**
 * @type {Integer (UInt32)}
 */
export global DBTF_XPORT := 2

/**
 * @type {Integer (UInt32)}
 */
export global DBTF_SLOWNET := 4

/**
 * @type {Integer (UInt32)}
 */
export global DBT_VPOWERDAPI := 33024

/**
 * @type {Integer (UInt32)}
 */
export global DBT_USERDEFINED := 65535

/**
 * @type {Integer (UInt16)}
 */
export global RT_CURSOR := 1

/**
 * @type {Integer (UInt16)}
 */
export global RT_BITMAP := 2

/**
 * @type {Integer (UInt16)}
 */
export global RT_ICON := 3

/**
 * @type {Integer (UInt16)}
 */
export global RT_MENU := 4

/**
 * @type {Integer (UInt16)}
 */
export global RT_DIALOG := 5

/**
 * @type {Integer (UInt16)}
 */
export global RT_FONTDIR := 7

/**
 * @type {Integer (UInt16)}
 */
export global RT_FONT := 8

/**
 * @type {Integer (UInt16)}
 */
export global RT_ACCELERATOR := 9

/**
 * @type {Integer (UInt16)}
 */
export global RT_MESSAGETABLE := 11

/**
 * @type {Integer (UInt32)}
 */
export global DIFFERENCE := 11

/**
 * @type {Integer (UInt16)}
 */
export global RT_VERSION := 16

/**
 * @type {Integer (UInt16)}
 */
export global RT_DLGINCLUDE := 17

/**
 * @type {Integer (UInt16)}
 */
export global RT_PLUGPLAY := 19

/**
 * @type {Integer (UInt16)}
 */
export global RT_VXD := 20

/**
 * @type {Integer (UInt16)}
 */
export global RT_ANICURSOR := 21

/**
 * @type {Integer (UInt16)}
 */
export global RT_ANIICON := 22

/**
 * @type {Integer (UInt16)}
 */
export global RT_HTML := 23

/**
 * @type {Integer (UInt32)}
 */
export global CREATEPROCESS_MANIFEST_RESOURCE_ID := 1

/**
 * @type {Integer (UInt32)}
 */
export global ISOLATIONAWARE_MANIFEST_RESOURCE_ID := 2

/**
 * @type {Integer (UInt32)}
 */
export global ISOLATIONAWARE_NOSTATICIMPORT_MANIFEST_RESOURCE_ID := 3

/**
 * @type {Integer (UInt32)}
 */
export global ISOLATIONPOLICY_MANIFEST_RESOURCE_ID := 4

/**
 * @type {Integer (UInt32)}
 */
export global ISOLATIONPOLICY_BROWSER_MANIFEST_RESOURCE_ID := 5

/**
 * @type {Integer (UInt32)}
 */
export global MINIMUM_RESERVED_MANIFEST_RESOURCE_ID := 1

/**
 * @type {Integer (UInt32)}
 */
export global MAXIMUM_RESERVED_MANIFEST_RESOURCE_ID := 16

/**
 * @type {Integer (UInt32)}
 */
export global SB_MIN := 0

/**
 * @type {Integer (UInt32)}
 */
export global HIDE_WINDOW := 0

/**
 * @type {Integer (UInt32)}
 */
export global SHOW_OPENWINDOW := 1

/**
 * @type {Integer (UInt32)}
 */
export global SHOW_ICONWINDOW := 2

/**
 * @type {Integer (UInt32)}
 */
export global SHOW_FULLSCREEN := 3

/**
 * @type {Integer (UInt32)}
 */
export global SHOW_OPENNOACTIVATE := 4

/**
 * @type {Integer (UInt32)}
 */
export global KF_EXTENDED := 256

/**
 * @type {Integer (UInt32)}
 */
export global KF_DLGMODE := 2048

/**
 * @type {Integer (UInt32)}
 */
export global KF_MENUMODE := 4096

/**
 * @type {Integer (UInt32)}
 */
export global KF_ALTDOWN := 8192

/**
 * @type {Integer (UInt32)}
 */
export global KF_REPEAT := 16384

/**
 * @type {Integer (UInt32)}
 */
export global KF_UP := 32768

/**
 * @type {Integer (Int32)}
 */
export global WH_MIN := -1

/**
 * @type {Integer (UInt32)}
 */
export global WH_HARDWARE := 8

/**
 * @type {Integer (UInt32)}
 */
export global WH_MAX := 14

/**
 * @type {Integer (Int32)}
 */
export global WH_MINHOOK := -1

/**
 * @type {Integer (UInt32)}
 */
export global WH_MAXHOOK := 14

/**
 * @type {Integer (UInt32)}
 */
export global HC_ACTION := 0

/**
 * @type {Integer (UInt32)}
 */
export global HC_GETNEXT := 1

/**
 * @type {Integer (UInt32)}
 */
export global HC_SKIP := 2

/**
 * @type {Integer (UInt32)}
 */
export global HC_NOREMOVE := 3

/**
 * @type {Integer (UInt32)}
 */
export global HC_NOREM := 3

/**
 * @type {Integer (UInt32)}
 */
export global HC_SYSMODALON := 4

/**
 * @type {Integer (UInt32)}
 */
export global HC_SYSMODALOFF := 5

/**
 * @type {Integer (UInt32)}
 */
export global HCBT_MOVESIZE := 0

/**
 * @type {Integer (UInt32)}
 */
export global HCBT_MINMAX := 1

/**
 * @type {Integer (UInt32)}
 */
export global HCBT_QS := 2

/**
 * @type {Integer (UInt32)}
 */
export global HCBT_CREATEWND := 3

/**
 * @type {Integer (UInt32)}
 */
export global HCBT_DESTROYWND := 4

/**
 * @type {Integer (UInt32)}
 */
export global HCBT_ACTIVATE := 5

/**
 * @type {Integer (UInt32)}
 */
export global HCBT_CLICKSKIPPED := 6

/**
 * @type {Integer (UInt32)}
 */
export global HCBT_KEYSKIPPED := 7

/**
 * @type {Integer (UInt32)}
 */
export global HCBT_SYSCOMMAND := 8

/**
 * @type {Integer (UInt32)}
 */
export global HCBT_SETFOCUS := 9

/**
 * @type {Integer (UInt32)}
 */
export global WTS_CONSOLE_CONNECT := 1

/**
 * @type {Integer (UInt32)}
 */
export global WTS_CONSOLE_DISCONNECT := 2

/**
 * @type {Integer (UInt32)}
 */
export global WTS_REMOTE_CONNECT := 3

/**
 * @type {Integer (UInt32)}
 */
export global WTS_REMOTE_DISCONNECT := 4

/**
 * @type {Integer (UInt32)}
 */
export global WTS_SESSION_LOGON := 5

/**
 * @type {Integer (UInt32)}
 */
export global WTS_SESSION_LOGOFF := 6

/**
 * @type {Integer (UInt32)}
 */
export global WTS_SESSION_LOCK := 7

/**
 * @type {Integer (UInt32)}
 */
export global WTS_SESSION_UNLOCK := 8

/**
 * @type {Integer (UInt32)}
 */
export global WTS_SESSION_REMOTE_CONTROL := 9

/**
 * @type {Integer (UInt32)}
 */
export global WTS_SESSION_CREATE := 10

/**
 * @type {Integer (UInt32)}
 */
export global WTS_SESSION_TERMINATE := 11

/**
 * @type {Integer (UInt32)}
 */
export global WTS_SESSION_DESKTOP_READY := 15

/**
 * @type {Integer (UInt32)}
 */
export global MSGF_DIALOGBOX := 0

/**
 * @type {Integer (UInt32)}
 */
export global MSGF_MESSAGEBOX := 1

/**
 * @type {Integer (UInt32)}
 */
export global MSGF_MENU := 2

/**
 * @type {Integer (UInt32)}
 */
export global MSGF_SCROLLBAR := 5

/**
 * @type {Integer (UInt32)}
 */
export global MSGF_NEXTWINDOW := 6

/**
 * @type {Integer (UInt32)}
 */
export global MSGF_MAX := 8

/**
 * @type {Integer (UInt32)}
 */
export global MSGF_USER := 4096

/**
 * @type {Integer (UInt32)}
 */
export global HSHELL_WINDOWCREATED := 1

/**
 * @type {Integer (UInt32)}
 */
export global HSHELL_WINDOWDESTROYED := 2

/**
 * @type {Integer (UInt32)}
 */
export global HSHELL_ACTIVATESHELLWINDOW := 3

/**
 * @type {Integer (UInt32)}
 */
export global HSHELL_WINDOWACTIVATED := 4

/**
 * @type {Integer (UInt32)}
 */
export global HSHELL_GETMINRECT := 5

/**
 * @type {Integer (UInt32)}
 */
export global HSHELL_REDRAW := 6

/**
 * @type {Integer (UInt32)}
 */
export global HSHELL_TASKMAN := 7

/**
 * @type {Integer (UInt32)}
 */
export global HSHELL_LANGUAGE := 8

/**
 * @type {Integer (UInt32)}
 */
export global HSHELL_SYSMENU := 9

/**
 * @type {Integer (UInt32)}
 */
export global HSHELL_ENDTASK := 10

/**
 * @type {Integer (UInt32)}
 */
export global HSHELL_ACCESSIBILITYSTATE := 11

/**
 * @type {Integer (UInt32)}
 */
export global HSHELL_APPCOMMAND := 12

/**
 * @type {Integer (UInt32)}
 */
export global HSHELL_WINDOWREPLACED := 13

/**
 * @type {Integer (UInt32)}
 */
export global HSHELL_WINDOWREPLACING := 14

/**
 * @type {Integer (UInt32)}
 */
export global HSHELL_MONITORCHANGED := 16

/**
 * @type {Integer (UInt32)}
 */
export global HSHELL_HIGHBIT := 32768

/**
 * @type {Integer (UInt32)}
 */
export global FAPPCOMMAND_MOUSE := 32768

/**
 * @type {Integer (UInt32)}
 */
export global FAPPCOMMAND_KEY := 0

/**
 * @type {Integer (UInt32)}
 */
export global FAPPCOMMAND_OEM := 4096

/**
 * @type {Integer (UInt32)}
 */
export global FAPPCOMMAND_MASK := 61440

/**
 * @type {Integer (UInt32)}
 */
export global LLMHF_INJECTED := 1

/**
 * @type {Integer (UInt32)}
 */
export global LLMHF_LOWER_IL_INJECTED := 2

/**
 * @type {Integer (UInt32)}
 */
export global HKL_PREV := 0

/**
 * @type {Integer (UInt32)}
 */
export global HKL_NEXT := 1

/**
 * @type {Integer (UInt32)}
 */
export global INPUTLANGCHANGE_SYSCHARSET := 1

/**
 * @type {Integer (UInt32)}
 */
export global INPUTLANGCHANGE_FORWARD := 2

/**
 * @type {Integer (UInt32)}
 */
export global INPUTLANGCHANGE_BACKWARD := 4

/**
 * @type {Integer (UInt32)}
 */
export global KL_NAMELENGTH := 9

/**
 * @type {Integer (Int32)}
 */
export global WINSTA_ENUMDESKTOPS := 1

/**
 * @type {Integer (Int32)}
 */
export global WINSTA_READATTRIBUTES := 2

/**
 * @type {Integer (Int32)}
 */
export global WINSTA_ACCESSCLIPBOARD := 4

/**
 * @type {Integer (Int32)}
 */
export global WINSTA_CREATEDESKTOP := 8

/**
 * @type {Integer (Int32)}
 */
export global WINSTA_WRITEATTRIBUTES := 16

/**
 * @type {Integer (Int32)}
 */
export global WINSTA_ACCESSGLOBALATOMS := 32

/**
 * @type {Integer (Int32)}
 */
export global WINSTA_EXITWINDOWS := 64

/**
 * @type {Integer (Int32)}
 */
export global WINSTA_ENUMERATE := 256

/**
 * @type {Integer (Int32)}
 */
export global WINSTA_READSCREEN := 512

/**
 * @type {Integer (UInt32)}
 */
export global CWF_CREATE_ONLY := 1

/**
 * @type {Integer (Int32)}
 */
export global WSF_VISIBLE := 1

/**
 * @type {Integer (UInt32)}
 */
export global UOI_TIMERPROC_EXCEPTION_SUPPRESSION := 7

/**
 * @type {Integer (UInt32)}
 */
export global WM_NULL := 0

/**
 * @type {Integer (UInt32)}
 */
export global WM_CREATE := 1

/**
 * @type {Integer (UInt32)}
 */
export global WM_DESTROY := 2

/**
 * @type {Integer (UInt32)}
 */
export global WM_MOVE := 3

/**
 * @type {Integer (UInt32)}
 */
export global WM_SIZE := 5

/**
 * @type {Integer (UInt32)}
 */
export global WM_ACTIVATE := 6

/**
 * @type {Integer (UInt32)}
 */
export global WA_INACTIVE := 0

/**
 * @type {Integer (UInt32)}
 */
export global WA_ACTIVE := 1

/**
 * @type {Integer (UInt32)}
 */
export global WA_CLICKACTIVE := 2

/**
 * @type {Integer (UInt32)}
 */
export global WM_SETFOCUS := 7

/**
 * @type {Integer (UInt32)}
 */
export global WM_KILLFOCUS := 8

/**
 * @type {Integer (UInt32)}
 */
export global WM_ENABLE := 10

/**
 * @type {Integer (UInt32)}
 */
export global WM_SETREDRAW := 11

/**
 * @type {Integer (UInt32)}
 */
export global WM_SETTEXT := 12

/**
 * @type {Integer (UInt32)}
 */
export global WM_GETTEXT := 13

/**
 * @type {Integer (UInt32)}
 */
export global WM_GETTEXTLENGTH := 14

/**
 * @type {Integer (UInt32)}
 */
export global WM_PAINT := 15

/**
 * @type {Integer (UInt32)}
 */
export global WM_CLOSE := 16

/**
 * @type {Integer (UInt32)}
 */
export global WM_QUERYENDSESSION := 17

/**
 * @type {Integer (UInt32)}
 */
export global WM_QUERYOPEN := 19

/**
 * @type {Integer (UInt32)}
 */
export global WM_ENDSESSION := 22

/**
 * @type {Integer (UInt32)}
 */
export global WM_QUIT := 18

/**
 * @type {Integer (UInt32)}
 */
export global WM_ERASEBKGND := 20

/**
 * @type {Integer (UInt32)}
 */
export global WM_SYSCOLORCHANGE := 21

/**
 * @type {Integer (UInt32)}
 */
export global WM_SHOWWINDOW := 24

/**
 * @type {Integer (UInt32)}
 */
export global WM_WININICHANGE := 26

/**
 * @type {Integer (UInt32)}
 */
export global WM_SETTINGCHANGE := 26

/**
 * @type {Integer (UInt32)}
 */
export global WM_DEVMODECHANGE := 27

/**
 * @type {Integer (UInt32)}
 */
export global WM_ACTIVATEAPP := 28

/**
 * @type {Integer (UInt32)}
 */
export global WM_FONTCHANGE := 29

/**
 * @type {Integer (UInt32)}
 */
export global WM_TIMECHANGE := 30

/**
 * @type {Integer (UInt32)}
 */
export global WM_CANCELMODE := 31

/**
 * @type {Integer (UInt32)}
 */
export global WM_SETCURSOR := 32

/**
 * @type {Integer (UInt32)}
 */
export global WM_MOUSEACTIVATE := 33

/**
 * @type {Integer (UInt32)}
 */
export global WM_CHILDACTIVATE := 34

/**
 * @type {Integer (UInt32)}
 */
export global WM_QUEUESYNC := 35

/**
 * @type {Integer (UInt32)}
 */
export global WM_GETMINMAXINFO := 36

/**
 * @type {Integer (UInt32)}
 */
export global WM_PAINTICON := 38

/**
 * @type {Integer (UInt32)}
 */
export global WM_ICONERASEBKGND := 39

/**
 * @type {Integer (UInt32)}
 */
export global WM_NEXTDLGCTL := 40

/**
 * @type {Integer (UInt32)}
 */
export global WM_SPOOLERSTATUS := 42

/**
 * @type {Integer (UInt32)}
 */
export global WM_DRAWITEM := 43

/**
 * @type {Integer (UInt32)}
 */
export global WM_MEASUREITEM := 44

/**
 * @type {Integer (UInt32)}
 */
export global WM_DELETEITEM := 45

/**
 * @type {Integer (UInt32)}
 */
export global WM_VKEYTOITEM := 46

/**
 * @type {Integer (UInt32)}
 */
export global WM_CHARTOITEM := 47

/**
 * @type {Integer (UInt32)}
 */
export global WM_SETFONT := 48

/**
 * @type {Integer (UInt32)}
 */
export global WM_GETFONT := 49

/**
 * @type {Integer (UInt32)}
 */
export global WM_SETHOTKEY := 50

/**
 * @type {Integer (UInt32)}
 */
export global WM_GETHOTKEY := 51

/**
 * @type {Integer (UInt32)}
 */
export global WM_QUERYDRAGICON := 55

/**
 * @type {Integer (UInt32)}
 */
export global WM_COMPAREITEM := 57

/**
 * @type {Integer (UInt32)}
 */
export global WM_GETOBJECT := 61

/**
 * @type {Integer (UInt32)}
 */
export global WM_COMPACTING := 65

/**
 * @type {Integer (UInt32)}
 */
export global WM_COMMNOTIFY := 68

/**
 * @type {Integer (UInt32)}
 */
export global WM_WINDOWPOSCHANGING := 70

/**
 * @type {Integer (UInt32)}
 */
export global WM_WINDOWPOSCHANGED := 71

/**
 * @type {Integer (UInt32)}
 */
export global WM_POWER := 72

/**
 * @type {Integer (UInt32)}
 */
export global PWR_OK := 1

/**
 * @type {Integer (Int32)}
 */
export global PWR_FAIL := -1

/**
 * @type {Integer (UInt32)}
 */
export global PWR_SUSPENDREQUEST := 1

/**
 * @type {Integer (UInt32)}
 */
export global PWR_SUSPENDRESUME := 2

/**
 * @type {Integer (UInt32)}
 */
export global PWR_CRITICALRESUME := 3

/**
 * @type {Integer (UInt32)}
 */
export global WM_COPYDATA := 74

/**
 * @type {Integer (UInt32)}
 */
export global WM_CANCELJOURNAL := 75

/**
 * @type {Integer (UInt32)}
 */
export global WM_INPUTLANGCHANGEREQUEST := 80

/**
 * @type {Integer (UInt32)}
 */
export global WM_INPUTLANGCHANGE := 81

/**
 * @type {Integer (UInt32)}
 */
export global WM_TCARD := 82

/**
 * @type {Integer (UInt32)}
 */
export global WM_HELP := 83

/**
 * @type {Integer (UInt32)}
 */
export global WM_USERCHANGED := 84

/**
 * @type {Integer (UInt32)}
 */
export global WM_NOTIFYFORMAT := 85

/**
 * @type {Integer (UInt32)}
 */
export global NFR_ANSI := 1

/**
 * @type {Integer (UInt32)}
 */
export global NFR_UNICODE := 2

/**
 * @type {Integer (UInt32)}
 */
export global NF_QUERY := 3

/**
 * @type {Integer (UInt32)}
 */
export global NF_REQUERY := 4

/**
 * @type {Integer (UInt32)}
 */
export global WM_STYLECHANGING := 124

/**
 * @type {Integer (UInt32)}
 */
export global WM_STYLECHANGED := 125

/**
 * @type {Integer (UInt32)}
 */
export global WM_DISPLAYCHANGE := 126

/**
 * @type {Integer (UInt32)}
 */
export global WM_GETICON := 127

/**
 * @type {Integer (UInt32)}
 */
export global WM_SETICON := 128

/**
 * @type {Integer (UInt32)}
 */
export global WM_NCCREATE := 129

/**
 * @type {Integer (UInt32)}
 */
export global WM_NCDESTROY := 130

/**
 * @type {Integer (UInt32)}
 */
export global WM_NCCALCSIZE := 131

/**
 * @type {Integer (UInt32)}
 */
export global WM_NCHITTEST := 132

/**
 * @type {Integer (UInt32)}
 */
export global WM_NCPAINT := 133

/**
 * @type {Integer (UInt32)}
 */
export global WM_NCACTIVATE := 134

/**
 * @type {Integer (UInt32)}
 */
export global WM_GETDLGCODE := 135

/**
 * @type {Integer (UInt32)}
 */
export global WM_SYNCPAINT := 136

/**
 * @type {Integer (UInt32)}
 */
export global WM_NCMOUSEMOVE := 160

/**
 * @type {Integer (UInt32)}
 */
export global WM_NCLBUTTONDOWN := 161

/**
 * @type {Integer (UInt32)}
 */
export global WM_NCLBUTTONUP := 162

/**
 * @type {Integer (UInt32)}
 */
export global WM_NCLBUTTONDBLCLK := 163

/**
 * @type {Integer (UInt32)}
 */
export global WM_NCRBUTTONDOWN := 164

/**
 * @type {Integer (UInt32)}
 */
export global WM_NCRBUTTONUP := 165

/**
 * @type {Integer (UInt32)}
 */
export global WM_NCRBUTTONDBLCLK := 166

/**
 * @type {Integer (UInt32)}
 */
export global WM_NCMBUTTONDOWN := 167

/**
 * @type {Integer (UInt32)}
 */
export global WM_NCMBUTTONUP := 168

/**
 * @type {Integer (UInt32)}
 */
export global WM_NCMBUTTONDBLCLK := 169

/**
 * @type {Integer (UInt32)}
 */
export global WM_NCXBUTTONDOWN := 171

/**
 * @type {Integer (UInt32)}
 */
export global WM_NCXBUTTONUP := 172

/**
 * @type {Integer (UInt32)}
 */
export global WM_NCXBUTTONDBLCLK := 173

/**
 * @type {Integer (UInt32)}
 */
export global WM_INPUT_DEVICE_CHANGE := 254

/**
 * @type {Integer (UInt32)}
 */
export global WM_INPUT := 255

/**
 * @type {Integer (UInt32)}
 */
export global WM_KEYFIRST := 256

/**
 * @type {Integer (UInt32)}
 */
export global WM_KEYDOWN := 256

/**
 * @type {Integer (UInt32)}
 */
export global WM_KEYUP := 257

/**
 * @type {Integer (UInt32)}
 */
export global WM_CHAR := 258

/**
 * @type {Integer (UInt32)}
 */
export global WM_DEADCHAR := 259

/**
 * @type {Integer (UInt32)}
 */
export global WM_SYSKEYDOWN := 260

/**
 * @type {Integer (UInt32)}
 */
export global WM_SYSKEYUP := 261

/**
 * @type {Integer (UInt32)}
 */
export global WM_SYSCHAR := 262

/**
 * @type {Integer (UInt32)}
 */
export global WM_SYSDEADCHAR := 263

/**
 * @type {Integer (UInt32)}
 */
export global WM_KEYLAST := 265

/**
 * @type {Integer (UInt32)}
 */
export global UNICODE_NOCHAR := 65535

/**
 * @type {Integer (UInt32)}
 */
export global WM_IME_STARTCOMPOSITION := 269

/**
 * @type {Integer (UInt32)}
 */
export global WM_IME_ENDCOMPOSITION := 270

/**
 * @type {Integer (UInt32)}
 */
export global WM_IME_COMPOSITION := 271

/**
 * @type {Integer (UInt32)}
 */
export global WM_IME_KEYLAST := 271

/**
 * @type {Integer (UInt32)}
 */
export global WM_INITDIALOG := 272

/**
 * @type {Integer (UInt32)}
 */
export global WM_COMMAND := 273

/**
 * @type {Integer (UInt32)}
 */
export global WM_SYSCOMMAND := 274

/**
 * @type {Integer (UInt32)}
 */
export global WM_TIMER := 275

/**
 * @type {Integer (UInt32)}
 */
export global WM_HSCROLL := 276

/**
 * @type {Integer (UInt32)}
 */
export global WM_VSCROLL := 277

/**
 * @type {Integer (UInt32)}
 */
export global WM_INITMENU := 278

/**
 * @type {Integer (UInt32)}
 */
export global WM_INITMENUPOPUP := 279

/**
 * @type {Integer (UInt32)}
 */
export global WM_GESTURE := 281

/**
 * @type {Integer (UInt32)}
 */
export global WM_GESTURENOTIFY := 282

/**
 * @type {Integer (UInt32)}
 */
export global WM_MENUSELECT := 287

/**
 * @type {Integer (UInt32)}
 */
export global WM_MENUCHAR := 288

/**
 * @type {Integer (UInt32)}
 */
export global WM_ENTERIDLE := 289

/**
 * @type {Integer (UInt32)}
 */
export global WM_MENURBUTTONUP := 290

/**
 * @type {Integer (UInt32)}
 */
export global WM_MENUDRAG := 291

/**
 * @type {Integer (UInt32)}
 */
export global WM_MENUGETOBJECT := 292

/**
 * @type {Integer (UInt32)}
 */
export global WM_UNINITMENUPOPUP := 293

/**
 * @type {Integer (UInt32)}
 */
export global WM_MENUCOMMAND := 294

/**
 * @type {Integer (UInt32)}
 */
export global WM_CHANGEUISTATE := 295

/**
 * @type {Integer (UInt32)}
 */
export global WM_UPDATEUISTATE := 296

/**
 * @type {Integer (UInt32)}
 */
export global WM_QUERYUISTATE := 297

/**
 * @type {Integer (UInt32)}
 */
export global UIS_SET := 1

/**
 * @type {Integer (UInt32)}
 */
export global UIS_CLEAR := 2

/**
 * @type {Integer (UInt32)}
 */
export global UIS_INITIALIZE := 3

/**
 * @type {Integer (UInt32)}
 */
export global UISF_HIDEFOCUS := 1

/**
 * @type {Integer (UInt32)}
 */
export global UISF_HIDEACCEL := 2

/**
 * @type {Integer (UInt32)}
 */
export global UISF_ACTIVE := 4

/**
 * @type {Integer (UInt32)}
 */
export global WM_CTLCOLORMSGBOX := 306

/**
 * @type {Integer (UInt32)}
 */
export global WM_CTLCOLOREDIT := 307

/**
 * @type {Integer (UInt32)}
 */
export global WM_CTLCOLORLISTBOX := 308

/**
 * @type {Integer (UInt32)}
 */
export global WM_CTLCOLORBTN := 309

/**
 * @type {Integer (UInt32)}
 */
export global WM_CTLCOLORDLG := 310

/**
 * @type {Integer (UInt32)}
 */
export global WM_CTLCOLORSCROLLBAR := 311

/**
 * @type {Integer (UInt32)}
 */
export global WM_CTLCOLORSTATIC := 312

/**
 * @type {Integer (UInt32)}
 */
export global MN_GETHMENU := 481

/**
 * @type {Integer (UInt32)}
 */
export global WM_MOUSEFIRST := 512

/**
 * @type {Integer (UInt32)}
 */
export global WM_MOUSEMOVE := 512

/**
 * @type {Integer (UInt32)}
 */
export global WM_LBUTTONDOWN := 513

/**
 * @type {Integer (UInt32)}
 */
export global WM_LBUTTONUP := 514

/**
 * @type {Integer (UInt32)}
 */
export global WM_LBUTTONDBLCLK := 515

/**
 * @type {Integer (UInt32)}
 */
export global WM_RBUTTONDOWN := 516

/**
 * @type {Integer (UInt32)}
 */
export global WM_RBUTTONUP := 517

/**
 * @type {Integer (UInt32)}
 */
export global WM_RBUTTONDBLCLK := 518

/**
 * @type {Integer (UInt32)}
 */
export global WM_MBUTTONDOWN := 519

/**
 * @type {Integer (UInt32)}
 */
export global WM_MBUTTONUP := 520

/**
 * @type {Integer (UInt32)}
 */
export global WM_MBUTTONDBLCLK := 521

/**
 * @type {Integer (UInt32)}
 */
export global WM_MOUSEWHEEL := 522

/**
 * @type {Integer (UInt32)}
 */
export global WM_XBUTTONDOWN := 523

/**
 * @type {Integer (UInt32)}
 */
export global WM_XBUTTONUP := 524

/**
 * @type {Integer (UInt32)}
 */
export global WM_XBUTTONDBLCLK := 525

/**
 * @type {Integer (UInt32)}
 */
export global WM_MOUSEHWHEEL := 526

/**
 * @type {Integer (UInt32)}
 */
export global WM_MOUSELAST := 526

/**
 * @type {Integer (UInt32)}
 */
export global WHEEL_DELTA := 120

/**
 * @type {Integer (UInt16)}
 */
export global XBUTTON1 := 1

/**
 * @type {Integer (UInt16)}
 */
export global XBUTTON2 := 2

/**
 * @type {Integer (UInt32)}
 */
export global WM_PARENTNOTIFY := 528

/**
 * @type {Integer (UInt32)}
 */
export global WM_ENTERMENULOOP := 529

/**
 * @type {Integer (UInt32)}
 */
export global WM_EXITMENULOOP := 530

/**
 * @type {Integer (UInt32)}
 */
export global WM_NEXTMENU := 531

/**
 * @type {Integer (UInt32)}
 */
export global WM_SIZING := 532

/**
 * @type {Integer (UInt32)}
 */
export global WM_CAPTURECHANGED := 533

/**
 * @type {Integer (UInt32)}
 */
export global WM_MOVING := 534

/**
 * @type {Integer (UInt32)}
 */
export global WM_POWERBROADCAST := 536

/**
 * @type {Integer (UInt32)}
 */
export global PBT_APMQUERYSUSPEND := 0

/**
 * @type {Integer (UInt32)}
 */
export global PBT_APMQUERYSTANDBY := 1

/**
 * @type {Integer (UInt32)}
 */
export global PBT_APMQUERYSUSPENDFAILED := 2

/**
 * @type {Integer (UInt32)}
 */
export global PBT_APMQUERYSTANDBYFAILED := 3

/**
 * @type {Integer (UInt32)}
 */
export global PBT_APMSUSPEND := 4

/**
 * @type {Integer (UInt32)}
 */
export global PBT_APMSTANDBY := 5

/**
 * @type {Integer (UInt32)}
 */
export global PBT_APMRESUMECRITICAL := 6

/**
 * @type {Integer (UInt32)}
 */
export global PBT_APMRESUMESUSPEND := 7

/**
 * @type {Integer (UInt32)}
 */
export global PBT_APMRESUMESTANDBY := 8

/**
 * @type {Integer (UInt32)}
 */
export global PBTF_APMRESUMEFROMFAILURE := 1

/**
 * @type {Integer (UInt32)}
 */
export global PBT_APMBATTERYLOW := 9

/**
 * @type {Integer (UInt32)}
 */
export global PBT_APMPOWERSTATUSCHANGE := 10

/**
 * @type {Integer (UInt32)}
 */
export global PBT_APMOEMEVENT := 11

/**
 * @type {Integer (UInt32)}
 */
export global PBT_APMRESUMEAUTOMATIC := 18

/**
 * @type {Integer (UInt32)}
 */
export global PBT_POWERSETTINGCHANGE := 32787

/**
 * @type {Integer (UInt32)}
 */
export global WM_MDICREATE := 544

/**
 * @type {Integer (UInt32)}
 */
export global WM_MDIDESTROY := 545

/**
 * @type {Integer (UInt32)}
 */
export global WM_MDIACTIVATE := 546

/**
 * @type {Integer (UInt32)}
 */
export global WM_MDIRESTORE := 547

/**
 * @type {Integer (UInt32)}
 */
export global WM_MDINEXT := 548

/**
 * @type {Integer (UInt32)}
 */
export global WM_MDIMAXIMIZE := 549

/**
 * @type {Integer (UInt32)}
 */
export global WM_MDITILE := 550

/**
 * @type {Integer (UInt32)}
 */
export global WM_MDICASCADE := 551

/**
 * @type {Integer (UInt32)}
 */
export global WM_MDIICONARRANGE := 552

/**
 * @type {Integer (UInt32)}
 */
export global WM_MDIGETACTIVE := 553

/**
 * @type {Integer (UInt32)}
 */
export global WM_MDISETMENU := 560

/**
 * @type {Integer (UInt32)}
 */
export global WM_ENTERSIZEMOVE := 561

/**
 * @type {Integer (UInt32)}
 */
export global WM_EXITSIZEMOVE := 562

/**
 * @type {Integer (UInt32)}
 */
export global WM_DROPFILES := 563

/**
 * @type {Integer (UInt32)}
 */
export global WM_MDIREFRESHMENU := 564

/**
 * @type {Integer (UInt32)}
 */
export global WM_POINTERDEVICECHANGE := 568

/**
 * @type {Integer (UInt32)}
 */
export global WM_POINTERDEVICEINRANGE := 569

/**
 * @type {Integer (UInt32)}
 */
export global WM_POINTERDEVICEOUTOFRANGE := 570

/**
 * @type {Integer (UInt32)}
 */
export global WM_TOUCH := 576

/**
 * @type {Integer (UInt32)}
 */
export global WM_NCPOINTERUPDATE := 577

/**
 * @type {Integer (UInt32)}
 */
export global WM_NCPOINTERDOWN := 578

/**
 * @type {Integer (UInt32)}
 */
export global WM_NCPOINTERUP := 579

/**
 * @type {Integer (UInt32)}
 */
export global WM_POINTERUPDATE := 581

/**
 * @type {Integer (UInt32)}
 */
export global WM_POINTERDOWN := 582

/**
 * @type {Integer (UInt32)}
 */
export global WM_POINTERUP := 583

/**
 * @type {Integer (UInt32)}
 */
export global WM_POINTERENTER := 585

/**
 * @type {Integer (UInt32)}
 */
export global WM_POINTERLEAVE := 586

/**
 * @type {Integer (UInt32)}
 */
export global WM_POINTERACTIVATE := 587

/**
 * @type {Integer (UInt32)}
 */
export global WM_POINTERCAPTURECHANGED := 588

/**
 * @type {Integer (UInt32)}
 */
export global WM_TOUCHHITTESTING := 589

/**
 * @type {Integer (UInt32)}
 */
export global WM_POINTERWHEEL := 590

/**
 * @type {Integer (UInt32)}
 */
export global WM_POINTERHWHEEL := 591

/**
 * @type {Integer (UInt32)}
 */
export global DM_POINTERHITTEST := 592

/**
 * @type {Integer (UInt32)}
 */
export global WM_POINTERROUTEDTO := 593

/**
 * @type {Integer (UInt32)}
 */
export global WM_POINTERROUTEDAWAY := 594

/**
 * @type {Integer (UInt32)}
 */
export global WM_POINTERROUTEDRELEASED := 595

/**
 * @type {Integer (UInt32)}
 */
export global WM_IME_SETCONTEXT := 641

/**
 * @type {Integer (UInt32)}
 */
export global WM_IME_NOTIFY := 642

/**
 * @type {Integer (UInt32)}
 */
export global WM_IME_CONTROL := 643

/**
 * @type {Integer (UInt32)}
 */
export global WM_IME_COMPOSITIONFULL := 644

/**
 * @type {Integer (UInt32)}
 */
export global WM_IME_SELECT := 645

/**
 * @type {Integer (UInt32)}
 */
export global WM_IME_CHAR := 646

/**
 * @type {Integer (UInt32)}
 */
export global WM_IME_REQUEST := 648

/**
 * @type {Integer (UInt32)}
 */
export global WM_IME_KEYDOWN := 656

/**
 * @type {Integer (UInt32)}
 */
export global WM_IME_KEYUP := 657

/**
 * @type {Integer (UInt32)}
 */
export global WM_NCMOUSEHOVER := 672

/**
 * @type {Integer (UInt32)}
 */
export global WM_NCMOUSELEAVE := 674

/**
 * @type {Integer (UInt32)}
 */
export global WM_WTSSESSION_CHANGE := 689

/**
 * @type {Integer (UInt32)}
 */
export global WM_TABLET_FIRST := 704

/**
 * @type {Integer (UInt32)}
 */
export global WM_TABLET_LAST := 735

/**
 * @type {Integer (UInt32)}
 */
export global WM_DPICHANGED := 736

/**
 * @type {Integer (UInt32)}
 */
export global WM_DPICHANGED_BEFOREPARENT := 738

/**
 * @type {Integer (UInt32)}
 */
export global WM_DPICHANGED_AFTERPARENT := 739

/**
 * @type {Integer (UInt32)}
 */
export global WM_GETDPISCALEDSIZE := 740

/**
 * @type {Integer (UInt32)}
 */
export global WM_CUT := 768

/**
 * @type {Integer (UInt32)}
 */
export global WM_COPY := 769

/**
 * @type {Integer (UInt32)}
 */
export global WM_PASTE := 770

/**
 * @type {Integer (UInt32)}
 */
export global WM_CLEAR := 771

/**
 * @type {Integer (UInt32)}
 */
export global WM_UNDO := 772

/**
 * @type {Integer (UInt32)}
 */
export global WM_RENDERFORMAT := 773

/**
 * @type {Integer (UInt32)}
 */
export global WM_RENDERALLFORMATS := 774

/**
 * @type {Integer (UInt32)}
 */
export global WM_DESTROYCLIPBOARD := 775

/**
 * @type {Integer (UInt32)}
 */
export global WM_DRAWCLIPBOARD := 776

/**
 * @type {Integer (UInt32)}
 */
export global WM_PAINTCLIPBOARD := 777

/**
 * @type {Integer (UInt32)}
 */
export global WM_VSCROLLCLIPBOARD := 778

/**
 * @type {Integer (UInt32)}
 */
export global WM_SIZECLIPBOARD := 779

/**
 * @type {Integer (UInt32)}
 */
export global WM_ASKCBFORMATNAME := 780

/**
 * @type {Integer (UInt32)}
 */
export global WM_CHANGECBCHAIN := 781

/**
 * @type {Integer (UInt32)}
 */
export global WM_HSCROLLCLIPBOARD := 782

/**
 * @type {Integer (UInt32)}
 */
export global WM_QUERYNEWPALETTE := 783

/**
 * @type {Integer (UInt32)}
 */
export global WM_PALETTEISCHANGING := 784

/**
 * @type {Integer (UInt32)}
 */
export global WM_PALETTECHANGED := 785

/**
 * @type {Integer (UInt32)}
 */
export global WM_HOTKEY := 786

/**
 * @type {Integer (UInt32)}
 */
export global WM_PRINT := 791

/**
 * @type {Integer (UInt32)}
 */
export global WM_APPCOMMAND := 793

/**
 * @type {Integer (UInt32)}
 */
export global WM_THEMECHANGED := 794

/**
 * @type {Integer (UInt32)}
 */
export global WM_CLIPBOARDUPDATE := 797

/**
 * @type {Integer (UInt32)}
 */
export global WM_DWMCOMPOSITIONCHANGED := 798

/**
 * @type {Integer (UInt32)}
 */
export global WM_DWMNCRENDERINGCHANGED := 799

/**
 * @type {Integer (UInt32)}
 */
export global WM_DWMCOLORIZATIONCOLORCHANGED := 800

/**
 * @type {Integer (UInt32)}
 */
export global WM_DWMWINDOWMAXIMIZEDCHANGE := 801

/**
 * @type {Integer (UInt32)}
 */
export global WM_DWMSENDICONICTHUMBNAIL := 803

/**
 * @type {Integer (UInt32)}
 */
export global WM_DWMSENDICONICLIVEPREVIEWBITMAP := 806

/**
 * @type {Integer (UInt32)}
 */
export global WM_GETTITLEBARINFOEX := 831

/**
 * @type {Integer (UInt32)}
 */
export global WM_HANDHELDFIRST := 856

/**
 * @type {Integer (UInt32)}
 */
export global WM_HANDHELDLAST := 863

/**
 * @type {Integer (UInt32)}
 */
export global WM_AFXFIRST := 864

/**
 * @type {Integer (UInt32)}
 */
export global WM_AFXLAST := 895

/**
 * @type {Integer (UInt32)}
 */
export global WM_PENWINFIRST := 896

/**
 * @type {Integer (UInt32)}
 */
export global WM_PENWINLAST := 911

/**
 * @type {Integer (UInt32)}
 */
export global WM_APP := 32768

/**
 * @type {Integer (UInt32)}
 */
export global WM_USER := 1024

/**
 * @type {Integer (UInt32)}
 */
export global WMSZ_LEFT := 1

/**
 * @type {Integer (UInt32)}
 */
export global WMSZ_RIGHT := 2

/**
 * @type {Integer (UInt32)}
 */
export global WMSZ_TOP := 3

/**
 * @type {Integer (UInt32)}
 */
export global WMSZ_TOPLEFT := 4

/**
 * @type {Integer (UInt32)}
 */
export global WMSZ_TOPRIGHT := 5

/**
 * @type {Integer (UInt32)}
 */
export global WMSZ_BOTTOM := 6

/**
 * @type {Integer (UInt32)}
 */
export global WMSZ_BOTTOMLEFT := 7

/**
 * @type {Integer (UInt32)}
 */
export global WMSZ_BOTTOMRIGHT := 8

/**
 * @type {Integer (Int32)}
 */
export global HTERROR := -2

/**
 * @type {Integer (Int32)}
 */
export global HTTRANSPARENT := -1

/**
 * @type {Integer (UInt32)}
 */
export global HTNOWHERE := 0

/**
 * @type {Integer (UInt32)}
 */
export global HTCLIENT := 1

/**
 * @type {Integer (UInt32)}
 */
export global HTCAPTION := 2

/**
 * @type {Integer (UInt32)}
 */
export global HTSYSMENU := 3

/**
 * @type {Integer (UInt32)}
 */
export global HTGROWBOX := 4

/**
 * @type {Integer (UInt32)}
 */
export global HTSIZE := 4

/**
 * @type {Integer (UInt32)}
 */
export global HTMENU := 5

/**
 * @type {Integer (UInt32)}
 */
export global HTHSCROLL := 6

/**
 * @type {Integer (UInt32)}
 */
export global HTVSCROLL := 7

/**
 * @type {Integer (UInt32)}
 */
export global HTMINBUTTON := 8

/**
 * @type {Integer (UInt32)}
 */
export global HTMAXBUTTON := 9

/**
 * @type {Integer (UInt32)}
 */
export global HTLEFT := 10

/**
 * @type {Integer (UInt32)}
 */
export global HTRIGHT := 11

/**
 * @type {Integer (UInt32)}
 */
export global HTTOP := 12

/**
 * @type {Integer (UInt32)}
 */
export global HTTOPLEFT := 13

/**
 * @type {Integer (UInt32)}
 */
export global HTTOPRIGHT := 14

/**
 * @type {Integer (UInt32)}
 */
export global HTBOTTOM := 15

/**
 * @type {Integer (UInt32)}
 */
export global HTBOTTOMLEFT := 16

/**
 * @type {Integer (UInt32)}
 */
export global HTBOTTOMRIGHT := 17

/**
 * @type {Integer (UInt32)}
 */
export global HTBORDER := 18

/**
 * @type {Integer (UInt32)}
 */
export global HTREDUCE := 8

/**
 * @type {Integer (UInt32)}
 */
export global HTZOOM := 9

/**
 * @type {Integer (UInt32)}
 */
export global HTSIZEFIRST := 10

/**
 * @type {Integer (UInt32)}
 */
export global HTSIZELAST := 17

/**
 * @type {Integer (UInt32)}
 */
export global HTOBJECT := 19

/**
 * @type {Integer (UInt32)}
 */
export global HTCLOSE := 20

/**
 * @type {Integer (UInt32)}
 */
export global HTHELP := 21

/**
 * @type {Integer (UInt32)}
 */
export global MA_ACTIVATE := 1

/**
 * @type {Integer (UInt32)}
 */
export global MA_ACTIVATEANDEAT := 2

/**
 * @type {Integer (UInt32)}
 */
export global MA_NOACTIVATE := 3

/**
 * @type {Integer (UInt32)}
 */
export global MA_NOACTIVATEANDEAT := 4

/**
 * @type {Integer (UInt32)}
 */
export global ICON_SMALL := 0

/**
 * @type {Integer (UInt32)}
 */
export global ICON_BIG := 1

/**
 * @type {Integer (UInt32)}
 */
export global ICON_SMALL2 := 2

/**
 * @type {Integer (UInt32)}
 */
export global SIZE_RESTORED := 0

/**
 * @type {Integer (UInt32)}
 */
export global SIZE_MINIMIZED := 1

/**
 * @type {Integer (UInt32)}
 */
export global SIZE_MAXIMIZED := 2

/**
 * @type {Integer (UInt32)}
 */
export global SIZE_MAXSHOW := 3

/**
 * @type {Integer (UInt32)}
 */
export global SIZE_MAXHIDE := 4

/**
 * @type {Integer (UInt32)}
 */
export global SIZENORMAL := 0

/**
 * @type {Integer (UInt32)}
 */
export global SIZEICONIC := 1

/**
 * @type {Integer (UInt32)}
 */
export global SIZEFULLSCREEN := 2

/**
 * @type {Integer (UInt32)}
 */
export global SIZEZOOMSHOW := 3

/**
 * @type {Integer (UInt32)}
 */
export global SIZEZOOMHIDE := 4

/**
 * @type {Integer (UInt32)}
 */
export global WVR_ALIGNTOP := 16

/**
 * @type {Integer (UInt32)}
 */
export global WVR_ALIGNLEFT := 32

/**
 * @type {Integer (UInt32)}
 */
export global WVR_ALIGNBOTTOM := 64

/**
 * @type {Integer (UInt32)}
 */
export global WVR_ALIGNRIGHT := 128

/**
 * @type {Integer (UInt32)}
 */
export global WVR_HREDRAW := 256

/**
 * @type {Integer (UInt32)}
 */
export global WVR_VREDRAW := 512

/**
 * @type {Integer (UInt32)}
 */
export global WVR_VALIDRECTS := 1024

/**
 * @type {Integer (Int32)}
 */
export global PRF_CHECKVISIBLE := 1

/**
 * @type {Integer (Int32)}
 */
export global PRF_NONCLIENT := 2

/**
 * @type {Integer (Int32)}
 */
export global PRF_CLIENT := 4

/**
 * @type {Integer (Int32)}
 */
export global PRF_ERASEBKGND := 8

/**
 * @type {Integer (Int32)}
 */
export global PRF_CHILDREN := 16

/**
 * @type {Integer (Int32)}
 */
export global PRF_OWNED := 32

/**
 * @type {Integer (UInt32)}
 */
export global IDANI_OPEN := 1

/**
 * @type {Integer (UInt32)}
 */
export global IDANI_CAPTION := 3

/**
 * @type {Integer (Int32)}
 */
export global IDHOT_SNAPWINDOW := -1

/**
 * @type {Integer (Int32)}
 */
export global IDHOT_SNAPDESKTOP := -2

/**
 * @type {Integer (UInt32)}
 */
export global ENDSESSION_CLOSEAPP := 1

/**
 * @type {Integer (UInt32)}
 */
export global ENDSESSION_CRITICAL := 1073741824

/**
 * @type {Integer (UInt32)}
 */
export global ENDSESSION_LOGOFF := 2147483648

/**
 * @type {Integer (UInt32)}
 */
export global BROADCAST_QUERY_DENY := 1112363332

/**
 * @type {HWND}
 */
export global HWND_BROADCAST := HWND(65535)

/**
 * @type {HWND}
 */
export global HWND_MESSAGE := HWND(-3)

/**
 * @type {Integer (UInt32)}
 */
export global ISMEX_NOSEND := 0

/**
 * @type {Integer (UInt32)}
 */
export global ISMEX_SEND := 1

/**
 * @type {Integer (UInt32)}
 */
export global ISMEX_NOTIFY := 2

/**
 * @type {Integer (UInt32)}
 */
export global ISMEX_CALLBACK := 4

/**
 * @type {Integer (UInt32)}
 */
export global ISMEX_REPLIED := 8

/**
 * @type {HWND}
 */
export global HWND_DESKTOP := HWND(0)

/**
 * @type {Integer (UInt32)}
 */
export global PW_RENDERFULLCONTENT := 2

/**
 * @type {Integer (UInt32)}
 */
export global SWP_NONE := 0

/**
 * @type {HWND}
 */
export global HWND_TOP := HWND(0)

/**
 * @type {HWND}
 */
export global HWND_BOTTOM := HWND(1)

/**
 * @type {HWND}
 */
export global HWND_TOPMOST := HWND(-1)

/**
 * @type {HWND}
 */
export global HWND_NOTOPMOST := HWND(-2)

/**
 * @type {Integer (UInt32)}
 */
export global DLGWINDOWEXTRA := 30

/**
 * @type {Integer (UInt32)}
 */
export global POINTER_MOD_SHIFT := 4

/**
 * @type {Integer (UInt32)}
 */
export global POINTER_MOD_CTRL := 8

/**
 * @type {Integer (UInt32)}
 */
export global TOUCH_FLAG_NONE := 0

/**
 * @type {Integer (UInt32)}
 */
export global TOUCH_MASK_NONE := 0

/**
 * @type {Integer (UInt32)}
 */
export global TOUCH_MASK_CONTACTAREA := 1

/**
 * @type {Integer (UInt32)}
 */
export global TOUCH_MASK_ORIENTATION := 2

/**
 * @type {Integer (UInt32)}
 */
export global TOUCH_MASK_PRESSURE := 4

/**
 * @type {Integer (UInt32)}
 */
export global PEN_FLAG_NONE := 0

/**
 * @type {Integer (UInt32)}
 */
export global PEN_FLAG_BARREL := 1

/**
 * @type {Integer (UInt32)}
 */
export global PEN_FLAG_INVERTED := 2

/**
 * @type {Integer (UInt32)}
 */
export global PEN_FLAG_ERASER := 4

/**
 * @type {Integer (UInt32)}
 */
export global PEN_MASK_NONE := 0

/**
 * @type {Integer (UInt32)}
 */
export global PEN_MASK_PRESSURE := 1

/**
 * @type {Integer (UInt32)}
 */
export global PEN_MASK_ROTATION := 2

/**
 * @type {Integer (UInt32)}
 */
export global PEN_MASK_TILT_X := 4

/**
 * @type {Integer (UInt32)}
 */
export global PEN_MASK_TILT_Y := 8

/**
 * @type {Integer (UInt32)}
 */
export global POINTER_MESSAGE_FLAG_NEW := 1

/**
 * @type {Integer (UInt32)}
 */
export global POINTER_MESSAGE_FLAG_INRANGE := 2

/**
 * @type {Integer (UInt32)}
 */
export global POINTER_MESSAGE_FLAG_INCONTACT := 4

/**
 * @type {Integer (UInt32)}
 */
export global POINTER_MESSAGE_FLAG_FIRSTBUTTON := 16

/**
 * @type {Integer (UInt32)}
 */
export global POINTER_MESSAGE_FLAG_SECONDBUTTON := 32

/**
 * @type {Integer (UInt32)}
 */
export global POINTER_MESSAGE_FLAG_THIRDBUTTON := 64

/**
 * @type {Integer (UInt32)}
 */
export global POINTER_MESSAGE_FLAG_FOURTHBUTTON := 128

/**
 * @type {Integer (UInt32)}
 */
export global POINTER_MESSAGE_FLAG_FIFTHBUTTON := 256

/**
 * @type {Integer (UInt32)}
 */
export global POINTER_MESSAGE_FLAG_PRIMARY := 8192

/**
 * @type {Integer (UInt32)}
 */
export global POINTER_MESSAGE_FLAG_CONFIDENCE := 16384

/**
 * @type {Integer (UInt32)}
 */
export global POINTER_MESSAGE_FLAG_CANCELED := 32768

/**
 * @type {Integer (UInt32)}
 */
export global PA_ACTIVATE := 1

/**
 * @type {Integer (UInt32)}
 */
export global PA_NOACTIVATE := 3

/**
 * @type {Integer (UInt32)}
 */
export global MAX_TOUCH_COUNT := 256

/**
 * @type {Integer (UInt32)}
 */
export global TOUCH_HIT_TESTING_DEFAULT := 0

/**
 * @type {Integer (UInt32)}
 */
export global TOUCH_HIT_TESTING_CLIENT := 1

/**
 * @type {Integer (UInt32)}
 */
export global TOUCH_HIT_TESTING_NONE := 2

/**
 * @type {Integer (UInt32)}
 */
export global TOUCH_HIT_TESTING_PROXIMITY_CLOSEST := 0

/**
 * @type {Integer (UInt32)}
 */
export global TOUCH_HIT_TESTING_PROXIMITY_FARTHEST := 4095

/**
 * @type {Integer (UInt32)}
 */
export global GWFS_INCLUDE_ANCESTORS := 1

/**
 * @type {Integer (UInt32)}
 */
export global QS_TOUCH := 2048

/**
 * @type {Integer (UInt32)}
 */
export global QS_POINTER := 4096

/**
 * @type {Integer (UInt32)}
 */
export global USER_TIMER_MAXIMUM := 2147483647

/**
 * @type {Integer (UInt32)}
 */
export global USER_TIMER_MINIMUM := 10

/**
 * @type {Integer (UInt32)}
 */
export global TIMERV_DEFAULT_COALESCING := 0

/**
 * @type {Integer (UInt32)}
 */
export global TIMERV_NO_COALESCING := 4294967295

/**
 * @type {Integer (UInt32)}
 */
export global TIMERV_COALESCING_MIN := 1

/**
 * @type {Integer (UInt32)}
 */
export global TIMERV_COALESCING_MAX := 2147483637

/**
 * @type {Integer (UInt32)}
 */
export global SM_RESERVED1 := 24

/**
 * @type {Integer (UInt32)}
 */
export global SM_RESERVED2 := 25

/**
 * @type {Integer (UInt32)}
 */
export global SM_RESERVED3 := 26

/**
 * @type {Integer (UInt32)}
 */
export global SM_RESERVED4 := 27

/**
 * @type {Integer (UInt32)}
 */
export global SM_CMETRICS := 76

/**
 * @type {Integer (UInt32)}
 */
export global SM_CARETBLINKINGENABLED := 8194

/**
 * @type {Integer (UInt32)}
 */
export global MENU_GET_ITEM_INFO := 1

/**
 * @type {Integer (UInt32)}
 */
export global MENU_GET_ITEM_DATA := 2

/**
 * @type {Integer (UInt32)}
 */
export global MENU_GET_SUBMENU := 4

/**
 * @type {Integer (UInt32)}
 */
export global MENU_INSERT_MENU := 8

/**
 * @type {Integer (UInt32)}
 */
export global MENU_INSERT_ITEM := 16

/**
 * @type {Integer (UInt32)}
 */
export global MENU_DELETE_MENU := 32

/**
 * @type {Integer (UInt32)}
 */
export global MENU_SET_ITEM_INFO := 64

/**
 * @type {Integer (UInt32)}
 */
export global MENU_ENABLE_ITEM := 128

/**
 * @type {Integer (UInt32)}
 */
export global MENU_CHECK_ITEM := 256

/**
 * @type {Integer (UInt32)}
 */
export global MENU_SET_DEFAULT_ITEM := 512

/**
 * @type {Integer (UInt32)}
 */
export global MENU_SET_ITEM_DATA := 1024

/**
 * @type {Integer (UInt32)}
 */
export global MENU_SET_SUBMENU := 2048

/**
 * @type {Integer (UInt32)}
 */
export global PMB_ACTIVE := 1

/**
 * @type {Integer (UInt32)}
 */
export global MNC_IGNORE := 0

/**
 * @type {Integer (UInt32)}
 */
export global MNC_CLOSE := 1

/**
 * @type {Integer (UInt32)}
 */
export global MNC_EXECUTE := 2

/**
 * @type {Integer (UInt32)}
 */
export global MNC_SELECT := 3

/**
 * @type {Integer (UInt32)}
 */
export global MND_CONTINUE := 0

/**
 * @type {Integer (UInt32)}
 */
export global MND_ENDMENU := 1

/**
 * @type {Integer (UInt32)}
 */
export global MNGO_NOINTERFACE := 0

/**
 * @type {Integer (UInt32)}
 */
export global MNGO_NOERROR := 1

/**
 * @type {Integer (UInt32)}
 */
export global DOF_EXECUTABLE := 32769

/**
 * @type {Integer (UInt32)}
 */
export global DOF_DOCUMENT := 32770

/**
 * @type {Integer (UInt32)}
 */
export global DOF_DIRECTORY := 32771

/**
 * @type {Integer (UInt32)}
 */
export global DOF_MULTIPLE := 32772

/**
 * @type {Integer (UInt32)}
 */
export global DOF_PROGMAN := 1

/**
 * @type {Integer (UInt32)}
 */
export global DOF_SHELLDATA := 2

/**
 * @type {Integer (Int32)}
 */
export global DO_DROPFILE := 1162627398

/**
 * @type {Integer (Int32)}
 */
export global DO_PRINTFILE := 1414419024

/**
 * @type {Integer (UInt32)}
 */
export global ASFW_ANY := 4294967295

/**
 * @type {Integer (Int32)}
 */
export global DCX_EXCLUDEUPDATE := 256

/**
 * @type {Integer (UInt32)}
 */
export global CTLCOLOR_MSGBOX := 0

/**
 * @type {Integer (UInt32)}
 */
export global CTLCOLOR_EDIT := 1

/**
 * @type {Integer (UInt32)}
 */
export global CTLCOLOR_LISTBOX := 2

/**
 * @type {Integer (UInt32)}
 */
export global CTLCOLOR_BTN := 3

/**
 * @type {Integer (UInt32)}
 */
export global CTLCOLOR_DLG := 4

/**
 * @type {Integer (UInt32)}
 */
export global CTLCOLOR_SCROLLBAR := 5

/**
 * @type {Integer (UInt32)}
 */
export global CTLCOLOR_STATIC := 6

/**
 * @type {Integer (UInt32)}
 */
export global CTLCOLOR_MAX := 7

/**
 * @type {Integer (UInt32)}
 */
export global GW_MAX := 5

/**
 * @type {Integer (UInt32)}
 */
export global SC_SIZE := 61440

/**
 * @type {Integer (UInt32)}
 */
export global SC_MOVE := 61456

/**
 * @type {Integer (UInt32)}
 */
export global SC_MINIMIZE := 61472

/**
 * @type {Integer (UInt32)}
 */
export global SC_MAXIMIZE := 61488

/**
 * @type {Integer (UInt32)}
 */
export global SC_NEXTWINDOW := 61504

/**
 * @type {Integer (UInt32)}
 */
export global SC_PREVWINDOW := 61520

/**
 * @type {Integer (UInt32)}
 */
export global SC_CLOSE := 61536

/**
 * @type {Integer (UInt32)}
 */
export global SC_VSCROLL := 61552

/**
 * @type {Integer (UInt32)}
 */
export global SC_HSCROLL := 61568

/**
 * @type {Integer (UInt32)}
 */
export global SC_MOUSEMENU := 61584

/**
 * @type {Integer (UInt32)}
 */
export global SC_KEYMENU := 61696

/**
 * @type {Integer (UInt32)}
 */
export global SC_ARRANGE := 61712

/**
 * @type {Integer (UInt32)}
 */
export global SC_RESTORE := 61728

/**
 * @type {Integer (UInt32)}
 */
export global SC_TASKLIST := 61744

/**
 * @type {Integer (UInt32)}
 */
export global SC_HOTKEY := 61776

/**
 * @type {Integer (UInt32)}
 */
export global SC_DEFAULT := 61792

/**
 * @type {Integer (UInt32)}
 */
export global SC_MONITORPOWER := 61808

/**
 * @type {Integer (UInt32)}
 */
export global SC_CONTEXTHELP := 61824

/**
 * @type {Integer (UInt32)}
 */
export global SC_SEPARATOR := 61455

/**
 * @type {Integer (UInt32)}
 */
export global SCF_ISSECURE := 1

/**
 * @type {Integer (UInt32)}
 */
export global SC_ICON := 61472

/**
 * @type {Integer (UInt32)}
 */
export global SC_ZOOM := 61488

/**
 * @type {Integer (UInt16)}
 */
export global IDC_ARROW := 32512

/**
 * @type {Integer (UInt16)}
 */
export global IDC_IBEAM := 32513

/**
 * @type {Integer (UInt16)}
 */
export global IDC_WAIT := 32514

/**
 * @type {Integer (UInt16)}
 */
export global IDC_CROSS := 32515

/**
 * @type {Integer (UInt16)}
 */
export global IDC_UPARROW := 32516

/**
 * @type {Integer (UInt16)}
 */
export global IDC_SIZE := 32640

/**
 * @type {Integer (UInt16)}
 */
export global IDC_ICON := 32641

/**
 * @type {Integer (UInt16)}
 */
export global IDC_SIZENWSE := 32642

/**
 * @type {Integer (UInt16)}
 */
export global IDC_SIZENESW := 32643

/**
 * @type {Integer (UInt16)}
 */
export global IDC_SIZEWE := 32644

/**
 * @type {Integer (UInt16)}
 */
export global IDC_SIZENS := 32645

/**
 * @type {Integer (UInt16)}
 */
export global IDC_SIZEALL := 32646

/**
 * @type {Integer (UInt16)}
 */
export global IDC_NO := 32648

/**
 * @type {Integer (UInt16)}
 */
export global IDC_HAND := 32649

/**
 * @type {Integer (UInt16)}
 */
export global IDC_APPSTARTING := 32650

/**
 * @type {Integer (UInt16)}
 */
export global IDC_HELP := 32651

/**
 * @type {Integer (UInt16)}
 */
export global IDC_PIN := 32671

/**
 * @type {Integer (UInt16)}
 */
export global IDC_PERSON := 32672

/**
 * @type {Integer (UInt32)}
 */
export global CURSOR_CREATION_SCALING_NONE := 1

/**
 * @type {Integer (UInt32)}
 */
export global CURSOR_CREATION_SCALING_DEFAULT := 2

/**
 * @type {Integer (UInt32)}
 */
export global IMAGE_ENHMETAFILE := 3

/**
 * @type {Integer (UInt32)}
 */
export global LR_COLOR := 2

/**
 * @type {Integer (UInt32)}
 */
export global RES_ICON := 1

/**
 * @type {Integer (UInt32)}
 */
export global RES_CURSOR := 2

/**
 * @type {Integer (UInt32)}
 */
export global OBM_CLOSE := 32754

/**
 * @type {Integer (UInt32)}
 */
export global OBM_UPARROW := 32753

/**
 * @type {Integer (UInt32)}
 */
export global OBM_DNARROW := 32752

/**
 * @type {Integer (UInt32)}
 */
export global OBM_RGARROW := 32751

/**
 * @type {Integer (UInt32)}
 */
export global OBM_LFARROW := 32750

/**
 * @type {Integer (UInt32)}
 */
export global OBM_REDUCE := 32749

/**
 * @type {Integer (UInt32)}
 */
export global OBM_ZOOM := 32748

/**
 * @type {Integer (UInt32)}
 */
export global OBM_RESTORE := 32747

/**
 * @type {Integer (UInt32)}
 */
export global OBM_REDUCED := 32746

/**
 * @type {Integer (UInt32)}
 */
export global OBM_ZOOMD := 32745

/**
 * @type {Integer (UInt32)}
 */
export global OBM_RESTORED := 32744

/**
 * @type {Integer (UInt32)}
 */
export global OBM_UPARROWD := 32743

/**
 * @type {Integer (UInt32)}
 */
export global OBM_DNARROWD := 32742

/**
 * @type {Integer (UInt32)}
 */
export global OBM_RGARROWD := 32741

/**
 * @type {Integer (UInt32)}
 */
export global OBM_LFARROWD := 32740

/**
 * @type {Integer (UInt32)}
 */
export global OBM_MNARROW := 32739

/**
 * @type {Integer (UInt32)}
 */
export global OBM_COMBO := 32738

/**
 * @type {Integer (UInt32)}
 */
export global OBM_UPARROWI := 32737

/**
 * @type {Integer (UInt32)}
 */
export global OBM_DNARROWI := 32736

/**
 * @type {Integer (UInt32)}
 */
export global OBM_RGARROWI := 32735

/**
 * @type {Integer (UInt32)}
 */
export global OBM_LFARROWI := 32734

/**
 * @type {Integer (UInt32)}
 */
export global OBM_OLD_CLOSE := 32767

/**
 * @type {Integer (UInt32)}
 */
export global OBM_SIZE := 32766

/**
 * @type {Integer (UInt32)}
 */
export global OBM_OLD_UPARROW := 32765

/**
 * @type {Integer (UInt32)}
 */
export global OBM_OLD_DNARROW := 32764

/**
 * @type {Integer (UInt32)}
 */
export global OBM_OLD_RGARROW := 32763

/**
 * @type {Integer (UInt32)}
 */
export global OBM_OLD_LFARROW := 32762

/**
 * @type {Integer (UInt32)}
 */
export global OBM_BTSIZE := 32761

/**
 * @type {Integer (UInt32)}
 */
export global OBM_CHECK := 32760

/**
 * @type {Integer (UInt32)}
 */
export global OBM_CHECKBOXES := 32759

/**
 * @type {Integer (UInt32)}
 */
export global OBM_BTNCORNERS := 32758

/**
 * @type {Integer (UInt32)}
 */
export global OBM_OLD_REDUCE := 32757

/**
 * @type {Integer (UInt32)}
 */
export global OBM_OLD_ZOOM := 32756

/**
 * @type {Integer (UInt32)}
 */
export global OBM_OLD_RESTORE := 32755

/**
 * @type {Integer (UInt32)}
 */
export global OCR_SIZE := 32640

/**
 * @type {Integer (UInt32)}
 */
export global OCR_ICON := 32641

/**
 * @type {Integer (UInt32)}
 */
export global OCR_ICOCUR := 32647

/**
 * @type {Integer (UInt32)}
 */
export global OIC_SAMPLE := 32512

/**
 * @type {Integer (UInt32)}
 */
export global OIC_HAND := 32513

/**
 * @type {Integer (UInt32)}
 */
export global OIC_QUES := 32514

/**
 * @type {Integer (UInt32)}
 */
export global OIC_BANG := 32515

/**
 * @type {Integer (UInt32)}
 */
export global OIC_NOTE := 32516

/**
 * @type {Integer (UInt32)}
 */
export global OIC_WINLOGO := 32517

/**
 * @type {Integer (UInt32)}
 */
export global OIC_WARNING := 32515

/**
 * @type {Integer (UInt32)}
 */
export global OIC_ERROR := 32513

/**
 * @type {Integer (UInt32)}
 */
export global OIC_INFORMATION := 32516

/**
 * @type {Integer (UInt32)}
 */
export global OIC_SHIELD := 32518

/**
 * @type {Integer (UInt32)}
 */
export global ORD_LANGDRIVER := 1

/**
 * @type {Integer (UInt32)}
 */
export global IDI_APPLICATION := 32512

/**
 * @type {Integer (UInt32)}
 */
export global IDI_HAND := 32513

/**
 * @type {Integer (UInt32)}
 */
export global IDI_QUESTION := 32514

/**
 * @type {Integer (UInt32)}
 */
export global IDI_EXCLAMATION := 32515

/**
 * @type {Integer (UInt32)}
 */
export global IDI_ASTERISK := 32516

/**
 * @type {Integer (UInt32)}
 */
export global IDI_WINLOGO := 32517

/**
 * @type {Integer (UInt32)}
 */
export global IDI_SHIELD := 32518

/**
 * @type {Integer (UInt32)}
 */
export global IDI_WARNING := 32515

/**
 * @type {Integer (UInt32)}
 */
export global IDI_ERROR := 32513

/**
 * @type {Integer (UInt32)}
 */
export global IDI_INFORMATION := 32516

/**
 * @type {Integer (Int32)}
 */
export global ES_LEFT := 0

/**
 * @type {Integer (Int32)}
 */
export global ES_CENTER := 1

/**
 * @type {Integer (Int32)}
 */
export global ES_RIGHT := 2

/**
 * @type {Integer (Int32)}
 */
export global ES_MULTILINE := 4

/**
 * @type {Integer (Int32)}
 */
export global ES_UPPERCASE := 8

/**
 * @type {Integer (Int32)}
 */
export global ES_LOWERCASE := 16

/**
 * @type {Integer (Int32)}
 */
export global ES_PASSWORD := 32

/**
 * @type {Integer (Int32)}
 */
export global ES_AUTOVSCROLL := 64

/**
 * @type {Integer (Int32)}
 */
export global ES_AUTOHSCROLL := 128

/**
 * @type {Integer (Int32)}
 */
export global ES_NOHIDESEL := 256

/**
 * @type {Integer (Int32)}
 */
export global ES_OEMCONVERT := 1024

/**
 * @type {Integer (Int32)}
 */
export global ES_READONLY := 2048

/**
 * @type {Integer (Int32)}
 */
export global ES_WANTRETURN := 4096

/**
 * @type {Integer (Int32)}
 */
export global ES_NUMBER := 8192

/**
 * @type {Integer (UInt32)}
 */
export global EN_SETFOCUS := 256

/**
 * @type {Integer (UInt32)}
 */
export global EN_KILLFOCUS := 512

/**
 * @type {Integer (UInt32)}
 */
export global EN_CHANGE := 768

/**
 * @type {Integer (UInt32)}
 */
export global EN_UPDATE := 1024

/**
 * @type {Integer (UInt32)}
 */
export global EN_ERRSPACE := 1280

/**
 * @type {Integer (UInt32)}
 */
export global EN_MAXTEXT := 1281

/**
 * @type {Integer (UInt32)}
 */
export global EN_HSCROLL := 1537

/**
 * @type {Integer (UInt32)}
 */
export global EN_VSCROLL := 1538

/**
 * @type {Integer (UInt32)}
 */
export global EN_ALIGN_LTR_EC := 1792

/**
 * @type {Integer (UInt32)}
 */
export global EN_ALIGN_RTL_EC := 1793

/**
 * @type {Integer (UInt32)}
 */
export global EN_BEFORE_PASTE := 2048

/**
 * @type {Integer (UInt32)}
 */
export global EN_AFTER_PASTE := 2049

/**
 * @type {Integer (UInt32)}
 */
export global EC_LEFTMARGIN := 1

/**
 * @type {Integer (UInt32)}
 */
export global EC_RIGHTMARGIN := 2

/**
 * @type {Integer (UInt32)}
 */
export global EC_USEFONTINFO := 65535

/**
 * @type {Integer (UInt32)}
 */
export global EMSIS_COMPOSITIONSTRING := 1

/**
 * @type {Integer (UInt32)}
 */
export global EIMES_GETCOMPSTRATONCE := 1

/**
 * @type {Integer (UInt32)}
 */
export global EIMES_CANCELCOMPSTRINFOCUS := 2

/**
 * @type {Integer (UInt32)}
 */
export global EIMES_COMPLETECOMPSTRKILLFOCUS := 4

/**
 * @type {Integer (Int32)}
 */
export global BS_PUSHBUTTON := 0

/**
 * @type {Integer (Int32)}
 */
export global BS_DEFPUSHBUTTON := 1

/**
 * @type {Integer (Int32)}
 */
export global BS_CHECKBOX := 2

/**
 * @type {Integer (Int32)}
 */
export global BS_AUTOCHECKBOX := 3

/**
 * @type {Integer (Int32)}
 */
export global BS_RADIOBUTTON := 4

/**
 * @type {Integer (Int32)}
 */
export global BS_3STATE := 5

/**
 * @type {Integer (Int32)}
 */
export global BS_AUTO3STATE := 6

/**
 * @type {Integer (Int32)}
 */
export global BS_GROUPBOX := 7

/**
 * @type {Integer (Int32)}
 */
export global BS_USERBUTTON := 8

/**
 * @type {Integer (Int32)}
 */
export global BS_AUTORADIOBUTTON := 9

/**
 * @type {Integer (Int32)}
 */
export global BS_PUSHBOX := 10

/**
 * @type {Integer (Int32)}
 */
export global BS_OWNERDRAW := 11

/**
 * @type {Integer (Int32)}
 */
export global BS_TYPEMASK := 15

/**
 * @type {Integer (Int32)}
 */
export global BS_LEFTTEXT := 32

/**
 * @type {Integer (Int32)}
 */
export global BS_TEXT := 0

/**
 * @type {Integer (Int32)}
 */
export global BS_ICON := 64

/**
 * @type {Integer (Int32)}
 */
export global BS_BITMAP := 128

/**
 * @type {Integer (Int32)}
 */
export global BS_LEFT := 256

/**
 * @type {Integer (Int32)}
 */
export global BS_RIGHT := 512

/**
 * @type {Integer (Int32)}
 */
export global BS_CENTER := 768

/**
 * @type {Integer (Int32)}
 */
export global BS_TOP := 1024

/**
 * @type {Integer (Int32)}
 */
export global BS_BOTTOM := 2048

/**
 * @type {Integer (Int32)}
 */
export global BS_VCENTER := 3072

/**
 * @type {Integer (Int32)}
 */
export global BS_PUSHLIKE := 4096

/**
 * @type {Integer (Int32)}
 */
export global BS_MULTILINE := 8192

/**
 * @type {Integer (Int32)}
 */
export global BS_NOTIFY := 16384

/**
 * @type {Integer (Int32)}
 */
export global BS_FLAT := 32768

/**
 * @type {Integer (Int32)}
 */
export global BS_RIGHTBUTTON := 32

/**
 * @type {Integer (UInt32)}
 */
export global BN_CLICKED := 0

/**
 * @type {Integer (UInt32)}
 */
export global BN_PAINT := 1

/**
 * @type {Integer (UInt32)}
 */
export global BN_HILITE := 2

/**
 * @type {Integer (UInt32)}
 */
export global BN_UNHILITE := 3

/**
 * @type {Integer (UInt32)}
 */
export global BN_DISABLE := 4

/**
 * @type {Integer (UInt32)}
 */
export global BN_DOUBLECLICKED := 5

/**
 * @type {Integer (UInt32)}
 */
export global BN_PUSHED := 2

/**
 * @type {Integer (UInt32)}
 */
export global BN_UNPUSHED := 3

/**
 * @type {Integer (UInt32)}
 */
export global BN_DBLCLK := 5

/**
 * @type {Integer (UInt32)}
 */
export global BN_SETFOCUS := 6

/**
 * @type {Integer (UInt32)}
 */
export global BN_KILLFOCUS := 7

/**
 * @type {Integer (UInt32)}
 */
export global BM_GETCHECK := 240

/**
 * @type {Integer (UInt32)}
 */
export global BM_SETCHECK := 241

/**
 * @type {Integer (UInt32)}
 */
export global BM_GETSTATE := 242

/**
 * @type {Integer (UInt32)}
 */
export global BM_SETSTATE := 243

/**
 * @type {Integer (UInt32)}
 */
export global BM_SETSTYLE := 244

/**
 * @type {Integer (UInt32)}
 */
export global BM_CLICK := 245

/**
 * @type {Integer (UInt32)}
 */
export global BM_GETIMAGE := 246

/**
 * @type {Integer (UInt32)}
 */
export global BM_SETIMAGE := 247

/**
 * @type {Integer (UInt32)}
 */
export global BM_SETDONTCLICK := 248

/**
 * @type {Integer (UInt32)}
 */
export global BST_PUSHED := 4

/**
 * @type {Integer (UInt32)}
 */
export global BST_FOCUS := 8

/**
 * @type {Integer (UInt32)}
 */
export global STM_SETICON := 368

/**
 * @type {Integer (UInt32)}
 */
export global STM_GETICON := 369

/**
 * @type {Integer (UInt32)}
 */
export global STM_SETIMAGE := 370

/**
 * @type {Integer (UInt32)}
 */
export global STM_GETIMAGE := 371

/**
 * @type {Integer (UInt32)}
 */
export global STN_CLICKED := 0

/**
 * @type {Integer (UInt32)}
 */
export global STN_DBLCLK := 1

/**
 * @type {Integer (UInt32)}
 */
export global STN_ENABLE := 2

/**
 * @type {Integer (UInt32)}
 */
export global STN_DISABLE := 3

/**
 * @type {Integer (UInt32)}
 */
export global STM_MSGMAX := 372

/**
 * @type {Integer (UInt32)}
 */
export global DWL_MSGRESULT := 0

/**
 * @type {Integer (UInt32)}
 */
export global DWL_DLGPROC := 4

/**
 * @type {Integer (UInt32)}
 */
export global DWL_USER := 8

/**
 * @type {Integer (UInt32)}
 */
export global DWLP_MSGRESULT := 0

/**
 * @type {Integer (Int32)}
 */
export global DS_ABSALIGN := 1

/**
 * @type {Integer (Int32)}
 */
export global DS_SYSMODAL := 2

/**
 * @type {Integer (Int32)}
 */
export global DS_LOCALEDIT := 32

/**
 * @type {Integer (Int32)}
 */
export global DS_SETFONT := 64

/**
 * @type {Integer (Int32)}
 */
export global DS_MODALFRAME := 128

/**
 * @type {Integer (Int32)}
 */
export global DS_NOIDLEMSG := 256

/**
 * @type {Integer (Int32)}
 */
export global DS_SETFOREGROUND := 512

/**
 * @type {Integer (Int32)}
 */
export global DS_3DLOOK := 4

/**
 * @type {Integer (Int32)}
 */
export global DS_FIXEDSYS := 8

/**
 * @type {Integer (Int32)}
 */
export global DS_NOFAILCREATE := 16

/**
 * @type {Integer (Int32)}
 */
export global DS_CONTROL := 1024

/**
 * @type {Integer (Int32)}
 */
export global DS_CENTER := 2048

/**
 * @type {Integer (Int32)}
 */
export global DS_CENTERMOUSE := 4096

/**
 * @type {Integer (Int32)}
 */
export global DS_CONTEXTHELP := 8192

/**
 * @type {Integer (Int32)}
 */
export global DS_USEPIXELS := 32768

/**
 * @type {Integer (UInt32)}
 */
export global DM_GETDEFID := 1024

/**
 * @type {Integer (UInt32)}
 */
export global DM_SETDEFID := 1025

/**
 * @type {Integer (UInt32)}
 */
export global DM_REPOSITION := 1026

/**
 * @type {Integer (UInt32)}
 */
export global DC_HASDEFID := 21323

/**
 * @type {Integer (UInt32)}
 */
export global DLGC_WANTARROWS := 1

/**
 * @type {Integer (UInt32)}
 */
export global DLGC_WANTTAB := 2

/**
 * @type {Integer (UInt32)}
 */
export global DLGC_WANTALLKEYS := 4

/**
 * @type {Integer (UInt32)}
 */
export global DLGC_WANTMESSAGE := 4

/**
 * @type {Integer (UInt32)}
 */
export global DLGC_HASSETSEL := 8

/**
 * @type {Integer (UInt32)}
 */
export global DLGC_DEFPUSHBUTTON := 16

/**
 * @type {Integer (UInt32)}
 */
export global DLGC_UNDEFPUSHBUTTON := 32

/**
 * @type {Integer (UInt32)}
 */
export global DLGC_RADIOBUTTON := 64

/**
 * @type {Integer (UInt32)}
 */
export global DLGC_WANTCHARS := 128

/**
 * @type {Integer (UInt32)}
 */
export global DLGC_STATIC := 256

/**
 * @type {Integer (UInt32)}
 */
export global DLGC_BUTTON := 8192

/**
 * @type {Integer (Int32)}
 */
export global LB_CTLCODE := 0

/**
 * @type {Integer (UInt32)}
 */
export global LB_OKAY := 0

/**
 * @type {Integer (Int32)}
 */
export global LB_ERR := -1

/**
 * @type {Integer (Int32)}
 */
export global LB_ERRSPACE := -2

/**
 * @type {Integer (Int32)}
 */
export global LBN_ERRSPACE := -2

/**
 * @type {Integer (UInt32)}
 */
export global LBN_SELCHANGE := 1

/**
 * @type {Integer (UInt32)}
 */
export global LBN_DBLCLK := 2

/**
 * @type {Integer (UInt32)}
 */
export global LBN_SELCANCEL := 3

/**
 * @type {Integer (UInt32)}
 */
export global LBN_SETFOCUS := 4

/**
 * @type {Integer (UInt32)}
 */
export global LBN_KILLFOCUS := 5

/**
 * @type {Integer (UInt32)}
 */
export global LB_ADDSTRING := 384

/**
 * @type {Integer (UInt32)}
 */
export global LB_INSERTSTRING := 385

/**
 * @type {Integer (UInt32)}
 */
export global LB_DELETESTRING := 386

/**
 * @type {Integer (UInt32)}
 */
export global LB_SELITEMRANGEEX := 387

/**
 * @type {Integer (UInt32)}
 */
export global LB_RESETCONTENT := 388

/**
 * @type {Integer (UInt32)}
 */
export global LB_SETSEL := 389

/**
 * @type {Integer (UInt32)}
 */
export global LB_SETCURSEL := 390

/**
 * @type {Integer (UInt32)}
 */
export global LB_GETSEL := 391

/**
 * @type {Integer (UInt32)}
 */
export global LB_GETCURSEL := 392

/**
 * @type {Integer (UInt32)}
 */
export global LB_GETTEXT := 393

/**
 * @type {Integer (UInt32)}
 */
export global LB_GETTEXTLEN := 394

/**
 * @type {Integer (UInt32)}
 */
export global LB_GETCOUNT := 395

/**
 * @type {Integer (UInt32)}
 */
export global LB_SELECTSTRING := 396

/**
 * @type {Integer (UInt32)}
 */
export global LB_DIR := 397

/**
 * @type {Integer (UInt32)}
 */
export global LB_GETTOPINDEX := 398

/**
 * @type {Integer (UInt32)}
 */
export global LB_FINDSTRING := 399

/**
 * @type {Integer (UInt32)}
 */
export global LB_GETSELCOUNT := 400

/**
 * @type {Integer (UInt32)}
 */
export global LB_GETSELITEMS := 401

/**
 * @type {Integer (UInt32)}
 */
export global LB_SETTABSTOPS := 402

/**
 * @type {Integer (UInt32)}
 */
export global LB_GETHORIZONTALEXTENT := 403

/**
 * @type {Integer (UInt32)}
 */
export global LB_SETHORIZONTALEXTENT := 404

/**
 * @type {Integer (UInt32)}
 */
export global LB_SETCOLUMNWIDTH := 405

/**
 * @type {Integer (UInt32)}
 */
export global LB_ADDFILE := 406

/**
 * @type {Integer (UInt32)}
 */
export global LB_SETTOPINDEX := 407

/**
 * @type {Integer (UInt32)}
 */
export global LB_GETITEMRECT := 408

/**
 * @type {Integer (UInt32)}
 */
export global LB_GETITEMDATA := 409

/**
 * @type {Integer (UInt32)}
 */
export global LB_SETITEMDATA := 410

/**
 * @type {Integer (UInt32)}
 */
export global LB_SELITEMRANGE := 411

/**
 * @type {Integer (UInt32)}
 */
export global LB_SETANCHORINDEX := 412

/**
 * @type {Integer (UInt32)}
 */
export global LB_GETANCHORINDEX := 413

/**
 * @type {Integer (UInt32)}
 */
export global LB_SETCARETINDEX := 414

/**
 * @type {Integer (UInt32)}
 */
export global LB_GETCARETINDEX := 415

/**
 * @type {Integer (UInt32)}
 */
export global LB_SETITEMHEIGHT := 416

/**
 * @type {Integer (UInt32)}
 */
export global LB_GETITEMHEIGHT := 417

/**
 * @type {Integer (UInt32)}
 */
export global LB_FINDSTRINGEXACT := 418

/**
 * @type {Integer (UInt32)}
 */
export global LB_SETLOCALE := 421

/**
 * @type {Integer (UInt32)}
 */
export global LB_GETLOCALE := 422

/**
 * @type {Integer (UInt32)}
 */
export global LB_SETCOUNT := 423

/**
 * @type {Integer (UInt32)}
 */
export global LB_INITSTORAGE := 424

/**
 * @type {Integer (UInt32)}
 */
export global LB_ITEMFROMPOINT := 425

/**
 * @type {Integer (UInt32)}
 */
export global LB_MULTIPLEADDSTRING := 433

/**
 * @type {Integer (UInt32)}
 */
export global LB_GETLISTBOXINFO := 434

/**
 * @type {Integer (UInt32)}
 */
export global LB_MSGMAX := 435

/**
 * @type {Integer (Int32)}
 */
export global LBS_NOTIFY := 1

/**
 * @type {Integer (Int32)}
 */
export global LBS_SORT := 2

/**
 * @type {Integer (Int32)}
 */
export global LBS_NOREDRAW := 4

/**
 * @type {Integer (Int32)}
 */
export global LBS_MULTIPLESEL := 8

/**
 * @type {Integer (Int32)}
 */
export global LBS_OWNERDRAWFIXED := 16

/**
 * @type {Integer (Int32)}
 */
export global LBS_OWNERDRAWVARIABLE := 32

/**
 * @type {Integer (Int32)}
 */
export global LBS_HASSTRINGS := 64

/**
 * @type {Integer (Int32)}
 */
export global LBS_USETABSTOPS := 128

/**
 * @type {Integer (Int32)}
 */
export global LBS_NOINTEGRALHEIGHT := 256

/**
 * @type {Integer (Int32)}
 */
export global LBS_MULTICOLUMN := 512

/**
 * @type {Integer (Int32)}
 */
export global LBS_WANTKEYBOARDINPUT := 1024

/**
 * @type {Integer (Int32)}
 */
export global LBS_EXTENDEDSEL := 2048

/**
 * @type {Integer (Int32)}
 */
export global LBS_DISABLENOSCROLL := 4096

/**
 * @type {Integer (Int32)}
 */
export global LBS_NODATA := 8192

/**
 * @type {Integer (Int32)}
 */
export global LBS_NOSEL := 16384

/**
 * @type {Integer (Int32)}
 */
export global LBS_COMBOBOX := 32768

/**
 * @type {Integer (UInt32)}
 */
export global CB_OKAY := 0

/**
 * @type {Integer (Int32)}
 */
export global CB_ERR := -1

/**
 * @type {Integer (Int32)}
 */
export global CB_ERRSPACE := -2

/**
 * @type {Integer (Int32)}
 */
export global CBN_ERRSPACE := -1

/**
 * @type {Integer (UInt32)}
 */
export global CBN_SELCHANGE := 1

/**
 * @type {Integer (UInt32)}
 */
export global CBN_DBLCLK := 2

/**
 * @type {Integer (UInt32)}
 */
export global CBN_SETFOCUS := 3

/**
 * @type {Integer (UInt32)}
 */
export global CBN_KILLFOCUS := 4

/**
 * @type {Integer (UInt32)}
 */
export global CBN_EDITCHANGE := 5

/**
 * @type {Integer (UInt32)}
 */
export global CBN_EDITUPDATE := 6

/**
 * @type {Integer (UInt32)}
 */
export global CBN_DROPDOWN := 7

/**
 * @type {Integer (UInt32)}
 */
export global CBN_CLOSEUP := 8

/**
 * @type {Integer (UInt32)}
 */
export global CBN_SELENDOK := 9

/**
 * @type {Integer (UInt32)}
 */
export global CBN_SELENDCANCEL := 10

/**
 * @type {Integer (Int32)}
 */
export global CBS_SIMPLE := 1

/**
 * @type {Integer (Int32)}
 */
export global CBS_DROPDOWN := 2

/**
 * @type {Integer (Int32)}
 */
export global CBS_DROPDOWNLIST := 3

/**
 * @type {Integer (Int32)}
 */
export global CBS_OWNERDRAWFIXED := 16

/**
 * @type {Integer (Int32)}
 */
export global CBS_OWNERDRAWVARIABLE := 32

/**
 * @type {Integer (Int32)}
 */
export global CBS_AUTOHSCROLL := 64

/**
 * @type {Integer (Int32)}
 */
export global CBS_OEMCONVERT := 128

/**
 * @type {Integer (Int32)}
 */
export global CBS_SORT := 256

/**
 * @type {Integer (Int32)}
 */
export global CBS_HASSTRINGS := 512

/**
 * @type {Integer (Int32)}
 */
export global CBS_NOINTEGRALHEIGHT := 1024

/**
 * @type {Integer (Int32)}
 */
export global CBS_DISABLENOSCROLL := 2048

/**
 * @type {Integer (Int32)}
 */
export global CBS_UPPERCASE := 8192

/**
 * @type {Integer (Int32)}
 */
export global CBS_LOWERCASE := 16384

/**
 * @type {Integer (UInt32)}
 */
export global CB_GETEDITSEL := 320

/**
 * @type {Integer (UInt32)}
 */
export global CB_LIMITTEXT := 321

/**
 * @type {Integer (UInt32)}
 */
export global CB_SETEDITSEL := 322

/**
 * @type {Integer (UInt32)}
 */
export global CB_ADDSTRING := 323

/**
 * @type {Integer (UInt32)}
 */
export global CB_DELETESTRING := 324

/**
 * @type {Integer (UInt32)}
 */
export global CB_DIR := 325

/**
 * @type {Integer (UInt32)}
 */
export global CB_GETCOUNT := 326

/**
 * @type {Integer (UInt32)}
 */
export global CB_GETCURSEL := 327

/**
 * @type {Integer (UInt32)}
 */
export global CB_GETLBTEXT := 328

/**
 * @type {Integer (UInt32)}
 */
export global CB_GETLBTEXTLEN := 329

/**
 * @type {Integer (UInt32)}
 */
export global CB_INSERTSTRING := 330

/**
 * @type {Integer (UInt32)}
 */
export global CB_RESETCONTENT := 331

/**
 * @type {Integer (UInt32)}
 */
export global CB_FINDSTRING := 332

/**
 * @type {Integer (UInt32)}
 */
export global CB_SELECTSTRING := 333

/**
 * @type {Integer (UInt32)}
 */
export global CB_SETCURSEL := 334

/**
 * @type {Integer (UInt32)}
 */
export global CB_SHOWDROPDOWN := 335

/**
 * @type {Integer (UInt32)}
 */
export global CB_GETITEMDATA := 336

/**
 * @type {Integer (UInt32)}
 */
export global CB_SETITEMDATA := 337

/**
 * @type {Integer (UInt32)}
 */
export global CB_GETDROPPEDCONTROLRECT := 338

/**
 * @type {Integer (UInt32)}
 */
export global CB_SETITEMHEIGHT := 339

/**
 * @type {Integer (UInt32)}
 */
export global CB_GETITEMHEIGHT := 340

/**
 * @type {Integer (UInt32)}
 */
export global CB_SETEXTENDEDUI := 341

/**
 * @type {Integer (UInt32)}
 */
export global CB_GETEXTENDEDUI := 342

/**
 * @type {Integer (UInt32)}
 */
export global CB_GETDROPPEDSTATE := 343

/**
 * @type {Integer (UInt32)}
 */
export global CB_FINDSTRINGEXACT := 344

/**
 * @type {Integer (UInt32)}
 */
export global CB_SETLOCALE := 345

/**
 * @type {Integer (UInt32)}
 */
export global CB_GETLOCALE := 346

/**
 * @type {Integer (UInt32)}
 */
export global CB_GETTOPINDEX := 347

/**
 * @type {Integer (UInt32)}
 */
export global CB_SETTOPINDEX := 348

/**
 * @type {Integer (UInt32)}
 */
export global CB_GETHORIZONTALEXTENT := 349

/**
 * @type {Integer (UInt32)}
 */
export global CB_SETHORIZONTALEXTENT := 350

/**
 * @type {Integer (UInt32)}
 */
export global CB_GETDROPPEDWIDTH := 351

/**
 * @type {Integer (UInt32)}
 */
export global CB_SETDROPPEDWIDTH := 352

/**
 * @type {Integer (UInt32)}
 */
export global CB_INITSTORAGE := 353

/**
 * @type {Integer (UInt32)}
 */
export global CB_MULTIPLEADDSTRING := 355

/**
 * @type {Integer (UInt32)}
 */
export global CB_GETCOMBOBOXINFO := 356

/**
 * @type {Integer (UInt32)}
 */
export global CB_MSGMAX := 357

/**
 * @type {Integer (Int32)}
 */
export global SBS_HORZ := 0

/**
 * @type {Integer (Int32)}
 */
export global SBS_VERT := 1

/**
 * @type {Integer (Int32)}
 */
export global SBS_TOPALIGN := 2

/**
 * @type {Integer (Int32)}
 */
export global SBS_LEFTALIGN := 2

/**
 * @type {Integer (Int32)}
 */
export global SBS_BOTTOMALIGN := 4

/**
 * @type {Integer (Int32)}
 */
export global SBS_RIGHTALIGN := 4

/**
 * @type {Integer (Int32)}
 */
export global SBS_SIZEBOXTOPLEFTALIGN := 2

/**
 * @type {Integer (Int32)}
 */
export global SBS_SIZEBOXBOTTOMRIGHTALIGN := 4

/**
 * @type {Integer (Int32)}
 */
export global SBS_SIZEBOX := 8

/**
 * @type {Integer (Int32)}
 */
export global SBS_SIZEGRIP := 16

/**
 * @type {Integer (UInt32)}
 */
export global SBM_SETPOS := 224

/**
 * @type {Integer (UInt32)}
 */
export global SBM_GETPOS := 225

/**
 * @type {Integer (UInt32)}
 */
export global SBM_SETRANGE := 226

/**
 * @type {Integer (UInt32)}
 */
export global SBM_SETRANGEREDRAW := 230

/**
 * @type {Integer (UInt32)}
 */
export global SBM_GETRANGE := 227

/**
 * @type {Integer (UInt32)}
 */
export global SBM_ENABLE_ARROWS := 228

/**
 * @type {Integer (UInt32)}
 */
export global SBM_SETSCROLLINFO := 233

/**
 * @type {Integer (UInt32)}
 */
export global SBM_GETSCROLLINFO := 234

/**
 * @type {Integer (UInt32)}
 */
export global SBM_GETSCROLLBARINFO := 235

/**
 * @type {Integer (UInt32)}
 */
export global MDIS_ALLCHILDSTYLES := 1

/**
 * @type {Integer (Int32)}
 */
export global HELP_CONTEXT := 1

/**
 * @type {Integer (Int32)}
 */
export global HELP_QUIT := 2

/**
 * @type {Integer (Int32)}
 */
export global HELP_INDEX := 3

/**
 * @type {Integer (Int32)}
 */
export global HELP_CONTENTS := 3

/**
 * @type {Integer (Int32)}
 */
export global HELP_HELPONHELP := 4

/**
 * @type {Integer (Int32)}
 */
export global HELP_SETINDEX := 5

/**
 * @type {Integer (Int32)}
 */
export global HELP_SETCONTENTS := 5

/**
 * @type {Integer (Int32)}
 */
export global HELP_CONTEXTPOPUP := 8

/**
 * @type {Integer (Int32)}
 */
export global HELP_FORCEFILE := 9

/**
 * @type {Integer (Int32)}
 */
export global HELP_KEY := 257

/**
 * @type {Integer (Int32)}
 */
export global HELP_COMMAND := 258

/**
 * @type {Integer (Int32)}
 */
export global HELP_PARTIALKEY := 261

/**
 * @type {Integer (Int32)}
 */
export global HELP_MULTIKEY := 513

/**
 * @type {Integer (Int32)}
 */
export global HELP_SETWINPOS := 515

/**
 * @type {Integer (UInt32)}
 */
export global HELP_CONTEXTMENU := 10

/**
 * @type {Integer (UInt32)}
 */
export global HELP_FINDER := 11

/**
 * @type {Integer (UInt32)}
 */
export global HELP_WM_HELP := 12

/**
 * @type {Integer (UInt32)}
 */
export global HELP_SETPOPUP_POS := 13

/**
 * @type {Integer (UInt32)}
 */
export global HELP_TCARD := 32768

/**
 * @type {Integer (UInt32)}
 */
export global HELP_TCARD_DATA := 16

/**
 * @type {Integer (UInt32)}
 */
export global HELP_TCARD_OTHER_CALLER := 17

/**
 * @type {Integer (UInt32)}
 */
export global IDH_NO_HELP := 28440

/**
 * @type {Integer (UInt32)}
 */
export global IDH_MISSING_CONTEXT := 28441

/**
 * @type {Integer (UInt32)}
 */
export global IDH_GENERIC_HELP_BUTTON := 28442

/**
 * @type {Integer (UInt32)}
 */
export global IDH_OK := 28443

/**
 * @type {Integer (UInt32)}
 */
export global IDH_CANCEL := 28444

/**
 * @type {Integer (UInt32)}
 */
export global IDH_HELP := 28445

/**
 * @type {Integer (UInt32)}
 */
export global MAX_TOUCH_PREDICTION_FILTER_TAPS := 3

/**
 * @type {Integer (UInt32)}
 */
export global TOUCHPREDICTIONPARAMETERS_DEFAULT_LATENCY := 8

/**
 * @type {Integer (UInt32)}
 */
export global TOUCHPREDICTIONPARAMETERS_DEFAULT_SAMPLETIME := 8

/**
 * @type {Integer (UInt32)}
 */
export global TOUCHPREDICTIONPARAMETERS_DEFAULT_USE_HW_TIMESTAMP := 1

/**
 * @type {Float}
 */
export global TOUCHPREDICTIONPARAMETERS_DEFAULT_RLS_DELTA := 0.001

/**
 * @type {Float}
 */
export global TOUCHPREDICTIONPARAMETERS_DEFAULT_RLS_LAMBDA_MIN := 0.9

/**
 * @type {Float}
 */
export global TOUCHPREDICTIONPARAMETERS_DEFAULT_RLS_LAMBDA_MAX := 0.999

/**
 * @type {Float}
 */
export global TOUCHPREDICTIONPARAMETERS_DEFAULT_RLS_LAMBDA_LEARNING_RATE := 0.001

/**
 * @type {Float}
 */
export global TOUCHPREDICTIONPARAMETERS_DEFAULT_RLS_EXPO_SMOOTH_ALPHA := 0.99

/**
 * @type {Integer (UInt32)}
 */
export global MAX_LOGICALDPIOVERRIDE := 2

/**
 * @type {Integer (Int32)}
 */
export global MIN_LOGICALDPIOVERRIDE := -2

/**
 * @type {Integer (UInt32)}
 */
export global FE_FONTSMOOTHINGSTANDARD := 1

/**
 * @type {Integer (UInt32)}
 */
export global FE_FONTSMOOTHINGCLEARTYPE := 2

/**
 * @type {Integer (UInt32)}
 */
export global FE_FONTSMOOTHINGORIENTATIONBGR := 0

/**
 * @type {Integer (UInt32)}
 */
export global FE_FONTSMOOTHINGORIENTATIONRGB := 1

/**
 * @type {Integer (UInt32)}
 */
export global CONTACTVISUALIZATION_OFF := 0

/**
 * @type {Integer (UInt32)}
 */
export global CONTACTVISUALIZATION_ON := 1

/**
 * @type {Integer (UInt32)}
 */
export global CONTACTVISUALIZATION_PRESENTATIONMODE := 2

/**
 * @type {Integer (UInt32)}
 */
export global GESTUREVISUALIZATION_OFF := 0

/**
 * @type {Integer (UInt32)}
 */
export global GESTUREVISUALIZATION_ON := 31

/**
 * @type {Integer (UInt32)}
 */
export global GESTUREVISUALIZATION_TAP := 1

/**
 * @type {Integer (UInt32)}
 */
export global GESTUREVISUALIZATION_DOUBLETAP := 2

/**
 * @type {Integer (UInt32)}
 */
export global GESTUREVISUALIZATION_PRESSANDTAP := 4

/**
 * @type {Integer (UInt32)}
 */
export global GESTUREVISUALIZATION_PRESSANDHOLD := 8

/**
 * @type {Integer (UInt32)}
 */
export global GESTUREVISUALIZATION_RIGHTTAP := 16

/**
 * @type {Integer (UInt32)}
 */
export global MOUSEWHEEL_ROUTING_FOCUS := 0

/**
 * @type {Integer (UInt32)}
 */
export global MOUSEWHEEL_ROUTING_HYBRID := 1

/**
 * @type {Integer (UInt32)}
 */
export global MOUSEWHEEL_ROUTING_MOUSE_POS := 2

/**
 * @type {Integer (UInt32)}
 */
export global PENVISUALIZATION_ON := 35

/**
 * @type {Integer (UInt32)}
 */
export global PENVISUALIZATION_OFF := 0

/**
 * @type {Integer (UInt32)}
 */
export global PENVISUALIZATION_TAP := 1

/**
 * @type {Integer (UInt32)}
 */
export global PENVISUALIZATION_DOUBLETAP := 2

/**
 * @type {Integer (UInt32)}
 */
export global PENVISUALIZATION_CURSOR := 32

/**
 * @type {Integer (UInt32)}
 */
export global PENARBITRATIONTYPE_NONE := 0

/**
 * @type {Integer (UInt32)}
 */
export global PENARBITRATIONTYPE_WIN8 := 1

/**
 * @type {Integer (UInt32)}
 */
export global PENARBITRATIONTYPE_FIS := 2

/**
 * @type {Integer (UInt32)}
 */
export global PENARBITRATIONTYPE_SPT := 3

/**
 * @type {Integer (UInt32)}
 */
export global PENARBITRATIONTYPE_MAX := 4

/**
 * @type {Integer (Int32)}
 */
export global METRICS_USEDEFAULT := -1

/**
 * @type {Integer (Int32)}
 */
export global ARW_STARTMASK := 3

/**
 * @type {Integer (Int32)}
 */
export global ARW_STARTRIGHT := 1

/**
 * @type {Integer (Int32)}
 */
export global ARW_STARTTOP := 2

/**
 * @type {Integer (Int32)}
 */
export global ARW_LEFT := 0

/**
 * @type {Integer (Int32)}
 */
export global ARW_RIGHT := 0

/**
 * @type {Integer (Int32)}
 */
export global ARW_UP := 4

/**
 * @type {Integer (Int32)}
 */
export global ARW_DOWN := 4

/**
 * @type {Integer (Int32)}
 */
export global ARW_HIDE := 8

/**
 * @type {Integer (UInt32)}
 */
export global HCF_LOGONDESKTOP := 256

/**
 * @type {Integer (UInt32)}
 */
export global HCF_DEFAULTDESKTOP := 512

/**
 * @type {Integer (UInt32)}
 */
export global EDD_GET_DEVICE_INTERFACE_NAME := 1

/**
 * @type {Integer (UInt32)}
 */
export global FKF_FILTERKEYSON := 1

/**
 * @type {Integer (UInt32)}
 */
export global FKF_AVAILABLE := 2

/**
 * @type {Integer (UInt32)}
 */
export global FKF_HOTKEYACTIVE := 4

/**
 * @type {Integer (UInt32)}
 */
export global FKF_CONFIRMHOTKEY := 8

/**
 * @type {Integer (UInt32)}
 */
export global FKF_HOTKEYSOUND := 16

/**
 * @type {Integer (UInt32)}
 */
export global FKF_INDICATOR := 32

/**
 * @type {Integer (UInt32)}
 */
export global FKF_CLICKON := 64

/**
 * @type {Integer (UInt32)}
 */
export global MKF_MOUSEKEYSON := 1

/**
 * @type {Integer (UInt32)}
 */
export global MKF_AVAILABLE := 2

/**
 * @type {Integer (UInt32)}
 */
export global MKF_HOTKEYACTIVE := 4

/**
 * @type {Integer (UInt32)}
 */
export global MKF_CONFIRMHOTKEY := 8

/**
 * @type {Integer (UInt32)}
 */
export global MKF_HOTKEYSOUND := 16

/**
 * @type {Integer (UInt32)}
 */
export global MKF_INDICATOR := 32

/**
 * @type {Integer (UInt32)}
 */
export global MKF_MODIFIERS := 64

/**
 * @type {Integer (UInt32)}
 */
export global MKF_REPLACENUMBERS := 128

/**
 * @type {Integer (UInt32)}
 */
export global MKF_LEFTBUTTONSEL := 268435456

/**
 * @type {Integer (UInt32)}
 */
export global MKF_RIGHTBUTTONSEL := 536870912

/**
 * @type {Integer (UInt32)}
 */
export global MKF_LEFTBUTTONDOWN := 16777216

/**
 * @type {Integer (UInt32)}
 */
export global MKF_RIGHTBUTTONDOWN := 33554432

/**
 * @type {Integer (UInt32)}
 */
export global MKF_MOUSEMODE := 2147483648

/**
 * @type {Integer (UInt32)}
 */
export global TKF_TOGGLEKEYSON := 1

/**
 * @type {Integer (UInt32)}
 */
export global TKF_AVAILABLE := 2

/**
 * @type {Integer (UInt32)}
 */
export global TKF_HOTKEYACTIVE := 4

/**
 * @type {Integer (UInt32)}
 */
export global TKF_CONFIRMHOTKEY := 8

/**
 * @type {Integer (UInt32)}
 */
export global TKF_HOTKEYSOUND := 16

/**
 * @type {Integer (UInt32)}
 */
export global TKF_INDICATOR := 32

/**
 * @type {Integer (UInt32)}
 */
export global MONITORINFOF_PRIMARY := 1

/**
 * @type {Integer (UInt32)}
 */
export global WINEVENT_OUTOFCONTEXT := 0

/**
 * @type {Integer (UInt32)}
 */
export global WINEVENT_SKIPOWNTHREAD := 1

/**
 * @type {Integer (UInt32)}
 */
export global WINEVENT_SKIPOWNPROCESS := 2

/**
 * @type {Integer (UInt32)}
 */
export global WINEVENT_INCONTEXT := 4

/**
 * @type {Integer (UInt32)}
 */
export global CHILDID_SELF := 0

/**
 * @type {Integer (UInt32)}
 */
export global INDEXID_OBJECT := 0

/**
 * @type {Integer (UInt32)}
 */
export global INDEXID_CONTAINER := 0

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_MIN := 1

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_MAX := 2147483647

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_SYSTEM_SOUND := 1

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_SYSTEM_ALERT := 2

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_SYSTEM_FOREGROUND := 3

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_SYSTEM_MENUSTART := 4

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_SYSTEM_MENUEND := 5

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_SYSTEM_MENUPOPUPSTART := 6

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_SYSTEM_MENUPOPUPEND := 7

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_SYSTEM_CAPTURESTART := 8

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_SYSTEM_CAPTUREEND := 9

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_SYSTEM_MOVESIZESTART := 10

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_SYSTEM_MOVESIZEEND := 11

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_SYSTEM_CONTEXTHELPSTART := 12

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_SYSTEM_CONTEXTHELPEND := 13

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_SYSTEM_DRAGDROPSTART := 14

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_SYSTEM_DRAGDROPEND := 15

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_SYSTEM_DIALOGSTART := 16

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_SYSTEM_DIALOGEND := 17

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_SYSTEM_SCROLLINGSTART := 18

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_SYSTEM_SCROLLINGEND := 19

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_SYSTEM_SWITCHSTART := 20

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_SYSTEM_SWITCHEND := 21

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_SYSTEM_MINIMIZESTART := 22

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_SYSTEM_MINIMIZEEND := 23

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_SYSTEM_DESKTOPSWITCH := 32

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_SYSTEM_SWITCHER_APPGRABBED := 36

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_SYSTEM_SWITCHER_APPOVERTARGET := 37

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_SYSTEM_SWITCHER_APPDROPPED := 38

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_SYSTEM_SWITCHER_CANCELLED := 39

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_SYSTEM_IME_KEY_NOTIFICATION := 41

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_SYSTEM_END := 255

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_OEM_DEFINED_START := 257

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_OEM_DEFINED_END := 511

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_UIA_EVENTID_START := 19968

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_UIA_EVENTID_END := 20223

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_UIA_PROPID_START := 29952

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_UIA_PROPID_END := 30207

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_CONSOLE_CARET := 16385

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_CONSOLE_UPDATE_REGION := 16386

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_CONSOLE_UPDATE_SIMPLE := 16387

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_CONSOLE_UPDATE_SCROLL := 16388

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_CONSOLE_LAYOUT := 16389

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_CONSOLE_START_APPLICATION := 16390

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_CONSOLE_END_APPLICATION := 16391

/**
 * @type {Integer (UInt32)}
 */
export global CONSOLE_APPLICATION_16BIT := 0

/**
 * @type {Integer (UInt32)}
 */
export global CONSOLE_CARET_SELECTION := 1

/**
 * @type {Integer (UInt32)}
 */
export global CONSOLE_CARET_VISIBLE := 2

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_CONSOLE_END := 16639

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_OBJECT_CREATE := 32768

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_OBJECT_DESTROY := 32769

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_OBJECT_SHOW := 32770

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_OBJECT_HIDE := 32771

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_OBJECT_REORDER := 32772

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_OBJECT_FOCUS := 32773

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_OBJECT_SELECTION := 32774

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_OBJECT_SELECTIONADD := 32775

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_OBJECT_SELECTIONREMOVE := 32776

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_OBJECT_SELECTIONWITHIN := 32777

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_OBJECT_STATECHANGE := 32778

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_OBJECT_LOCATIONCHANGE := 32779

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_OBJECT_NAMECHANGE := 32780

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_OBJECT_DESCRIPTIONCHANGE := 32781

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_OBJECT_VALUECHANGE := 32782

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_OBJECT_PARENTCHANGE := 32783

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_OBJECT_HELPCHANGE := 32784

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_OBJECT_DEFACTIONCHANGE := 32785

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_OBJECT_ACCELERATORCHANGE := 32786

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_OBJECT_INVOKED := 32787

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_OBJECT_TEXTSELECTIONCHANGED := 32788

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_OBJECT_CONTENTSCROLLED := 32789

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_SYSTEM_ARRANGMENTPREVIEW := 32790

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_OBJECT_CLOAKED := 32791

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_OBJECT_UNCLOAKED := 32792

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_OBJECT_LIVEREGIONCHANGED := 32793

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_OBJECT_HOSTEDOBJECTSINVALIDATED := 32800

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_OBJECT_DRAGSTART := 32801

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_OBJECT_DRAGCANCEL := 32802

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_OBJECT_DRAGCOMPLETE := 32803

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_OBJECT_DRAGENTER := 32804

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_OBJECT_DRAGLEAVE := 32805

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_OBJECT_DRAGDROPPED := 32806

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_OBJECT_IME_SHOW := 32807

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_OBJECT_IME_HIDE := 32808

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_OBJECT_IME_CHANGE := 32809

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_OBJECT_TEXTEDIT_CONVERSIONTARGETCHANGED := 32816

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_OBJECT_END := 33023

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_AIA_START := 40960

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_AIA_END := 45055

/**
 * @type {Integer (UInt32)}
 */
export global SOUND_SYSTEM_STARTUP := 1

/**
 * @type {Integer (UInt32)}
 */
export global SOUND_SYSTEM_SHUTDOWN := 2

/**
 * @type {Integer (UInt32)}
 */
export global SOUND_SYSTEM_BEEP := 3

/**
 * @type {Integer (UInt32)}
 */
export global SOUND_SYSTEM_ERROR := 4

/**
 * @type {Integer (UInt32)}
 */
export global SOUND_SYSTEM_QUESTION := 5

/**
 * @type {Integer (UInt32)}
 */
export global SOUND_SYSTEM_WARNING := 6

/**
 * @type {Integer (UInt32)}
 */
export global SOUND_SYSTEM_INFORMATION := 7

/**
 * @type {Integer (UInt32)}
 */
export global SOUND_SYSTEM_MAXIMIZE := 8

/**
 * @type {Integer (UInt32)}
 */
export global SOUND_SYSTEM_MINIMIZE := 9

/**
 * @type {Integer (UInt32)}
 */
export global SOUND_SYSTEM_RESTOREUP := 10

/**
 * @type {Integer (UInt32)}
 */
export global SOUND_SYSTEM_RESTOREDOWN := 11

/**
 * @type {Integer (UInt32)}
 */
export global SOUND_SYSTEM_APPSTART := 12

/**
 * @type {Integer (UInt32)}
 */
export global SOUND_SYSTEM_FAULT := 13

/**
 * @type {Integer (UInt32)}
 */
export global SOUND_SYSTEM_APPEND := 14

/**
 * @type {Integer (UInt32)}
 */
export global SOUND_SYSTEM_MENUCOMMAND := 15

/**
 * @type {Integer (UInt32)}
 */
export global SOUND_SYSTEM_MENUPOPUP := 16

/**
 * @type {Integer (UInt32)}
 */
export global CSOUND_SYSTEM := 16

/**
 * @type {Integer (UInt32)}
 */
export global CALERT_SYSTEM := 6

/**
 * @type {Integer (UInt32)}
 */
export global GUI_16BITTASK := 0

/**
 * @type {Integer (UInt32)}
 */
export global USER_DEFAULT_SCREEN_DPI := 96

/**
 * @type {Integer (UInt32)}
 */
export global STATE_SYSTEM_SELECTED := 2

/**
 * @type {Integer (UInt32)}
 */
export global STATE_SYSTEM_FOCUSED := 4

/**
 * @type {Integer (UInt32)}
 */
export global STATE_SYSTEM_CHECKED := 16

/**
 * @type {Integer (UInt32)}
 */
export global STATE_SYSTEM_MIXED := 32

/**
 * @type {Integer (UInt32)}
 */
export global STATE_SYSTEM_INDETERMINATE := 32

/**
 * @type {Integer (UInt32)}
 */
export global STATE_SYSTEM_READONLY := 64

/**
 * @type {Integer (UInt32)}
 */
export global STATE_SYSTEM_HOTTRACKED := 128

/**
 * @type {Integer (UInt32)}
 */
export global STATE_SYSTEM_DEFAULT := 256

/**
 * @type {Integer (UInt32)}
 */
export global STATE_SYSTEM_EXPANDED := 512

/**
 * @type {Integer (UInt32)}
 */
export global STATE_SYSTEM_COLLAPSED := 1024

/**
 * @type {Integer (UInt32)}
 */
export global STATE_SYSTEM_BUSY := 2048

/**
 * @type {Integer (UInt32)}
 */
export global STATE_SYSTEM_FLOATING := 4096

/**
 * @type {Integer (UInt32)}
 */
export global STATE_SYSTEM_MARQUEED := 8192

/**
 * @type {Integer (UInt32)}
 */
export global STATE_SYSTEM_ANIMATED := 16384

/**
 * @type {Integer (UInt32)}
 */
export global STATE_SYSTEM_SIZEABLE := 131072

/**
 * @type {Integer (UInt32)}
 */
export global STATE_SYSTEM_MOVEABLE := 262144

/**
 * @type {Integer (UInt32)}
 */
export global STATE_SYSTEM_SELFVOICING := 524288

/**
 * @type {Integer (UInt32)}
 */
export global STATE_SYSTEM_SELECTABLE := 2097152

/**
 * @type {Integer (UInt32)}
 */
export global STATE_SYSTEM_LINKED := 4194304

/**
 * @type {Integer (UInt32)}
 */
export global STATE_SYSTEM_TRAVERSED := 8388608

/**
 * @type {Integer (UInt32)}
 */
export global STATE_SYSTEM_MULTISELECTABLE := 16777216

/**
 * @type {Integer (UInt32)}
 */
export global STATE_SYSTEM_EXTSELECTABLE := 33554432

/**
 * @type {Integer (UInt32)}
 */
export global STATE_SYSTEM_ALERT_LOW := 67108864

/**
 * @type {Integer (UInt32)}
 */
export global STATE_SYSTEM_ALERT_MEDIUM := 134217728

/**
 * @type {Integer (UInt32)}
 */
export global STATE_SYSTEM_ALERT_HIGH := 268435456

/**
 * @type {Integer (UInt32)}
 */
export global STATE_SYSTEM_PROTECTED := 536870912

/**
 * @type {Integer (UInt32)}
 */
export global STATE_SYSTEM_VALID := 1073741823

/**
 * @type {Integer (UInt32)}
 */
export global CCHILDREN_TITLEBAR := 5

/**
 * @type {Integer (UInt32)}
 */
export global CCHILDREN_SCROLLBAR := 5

/**
 * @type {Integer (UInt32)}
 */
export global CURSOR_INVISIBLE := 0

/**
 * @type {Integer (UInt32)}
 */
export global RIM_INPUT := 0

/**
 * @type {Integer (UInt32)}
 */
export global RIM_INPUTSINK := 1

/**
 * @type {Integer (UInt32)}
 */
export global RIM_TYPEMAX := 2

/**
 * @type {Integer (UInt32)}
 */
export global RI_MOUSE_LEFT_BUTTON_DOWN := 1

/**
 * @type {Integer (UInt32)}
 */
export global RI_MOUSE_LEFT_BUTTON_UP := 2

/**
 * @type {Integer (UInt32)}
 */
export global RI_MOUSE_RIGHT_BUTTON_DOWN := 4

/**
 * @type {Integer (UInt32)}
 */
export global RI_MOUSE_RIGHT_BUTTON_UP := 8

/**
 * @type {Integer (UInt32)}
 */
export global RI_MOUSE_MIDDLE_BUTTON_DOWN := 16

/**
 * @type {Integer (UInt32)}
 */
export global RI_MOUSE_MIDDLE_BUTTON_UP := 32

/**
 * @type {Integer (UInt32)}
 */
export global RI_MOUSE_BUTTON_1_DOWN := 1

/**
 * @type {Integer (UInt32)}
 */
export global RI_MOUSE_BUTTON_1_UP := 2

/**
 * @type {Integer (UInt32)}
 */
export global RI_MOUSE_BUTTON_2_DOWN := 4

/**
 * @type {Integer (UInt32)}
 */
export global RI_MOUSE_BUTTON_2_UP := 8

/**
 * @type {Integer (UInt32)}
 */
export global RI_MOUSE_BUTTON_3_DOWN := 16

/**
 * @type {Integer (UInt32)}
 */
export global RI_MOUSE_BUTTON_3_UP := 32

/**
 * @type {Integer (UInt32)}
 */
export global RI_MOUSE_BUTTON_4_DOWN := 64

/**
 * @type {Integer (UInt32)}
 */
export global RI_MOUSE_BUTTON_4_UP := 128

/**
 * @type {Integer (UInt32)}
 */
export global RI_MOUSE_BUTTON_5_DOWN := 256

/**
 * @type {Integer (UInt32)}
 */
export global RI_MOUSE_BUTTON_5_UP := 512

/**
 * @type {Integer (UInt32)}
 */
export global RI_MOUSE_WHEEL := 1024

/**
 * @type {Integer (UInt32)}
 */
export global RI_MOUSE_HWHEEL := 2048

/**
 * @type {Integer (UInt32)}
 */
export global RI_KEY_MAKE := 0

/**
 * @type {Integer (UInt32)}
 */
export global RI_KEY_BREAK := 1

/**
 * @type {Integer (UInt32)}
 */
export global RI_KEY_E0 := 2

/**
 * @type {Integer (UInt32)}
 */
export global RI_KEY_E1 := 4

/**
 * @type {Integer (UInt32)}
 */
export global RI_KEY_TERMSRV_SET_LED := 8

/**
 * @type {Integer (UInt32)}
 */
export global RI_KEY_TERMSRV_SHADOW := 16

/**
 * @type {Integer (UInt32)}
 */
export global RIDEV_EXMODEMASK := 240

/**
 * @type {Integer (UInt32)}
 */
export global GIDC_ARRIVAL := 1

/**
 * @type {Integer (UInt32)}
 */
export global GIDC_REMOVAL := 2

/**
 * @type {Integer (UInt32)}
 */
export global POINTER_DEVICE_PRODUCT_STRING_MAX := 520

/**
 * @type {Integer (UInt32)}
 */
export global PDC_ARRIVAL := 1

/**
 * @type {Integer (UInt32)}
 */
export global PDC_REMOVAL := 2

/**
 * @type {Integer (UInt32)}
 */
export global PDC_ORIENTATION_0 := 4

/**
 * @type {Integer (UInt32)}
 */
export global PDC_ORIENTATION_90 := 8

/**
 * @type {Integer (UInt32)}
 */
export global PDC_ORIENTATION_180 := 16

/**
 * @type {Integer (UInt32)}
 */
export global PDC_ORIENTATION_270 := 32

/**
 * @type {Integer (UInt32)}
 */
export global PDC_MODE_DEFAULT := 64

/**
 * @type {Integer (UInt32)}
 */
export global PDC_MODE_CENTERED := 128

/**
 * @type {Integer (UInt32)}
 */
export global PDC_MAPPING_CHANGE := 256

/**
 * @type {Integer (UInt32)}
 */
export global PDC_RESOLUTION := 512

/**
 * @type {Integer (UInt32)}
 */
export global PDC_ORIGIN := 1024

/**
 * @type {Integer (UInt32)}
 */
export global PDC_MODE_ASPECTRATIOPRESERVED := 2048

/**
 * @type {Integer (UInt32)}
 */
export global TOUCHPAD_PARAMETERS_VERSION_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global TOUCHPAD_PARAMETERS_VERSION_2 := 2

/**
 * @type {Integer (UInt32)}
 */
export global GF_BEGIN := 1

/**
 * @type {Integer (UInt32)}
 */
export global GF_INERTIA := 2

/**
 * @type {Integer (UInt32)}
 */
export global GF_END := 4

/**
 * @type {Integer (UInt32)}
 */
export global GESTURECONFIGMAXCOUNT := 256

/**
 * @type {Integer (UInt32)}
 */
export global GCF_INCLUDE_ANCESTORS := 1

/**
 * @type {Integer (UInt32)}
 */
export global NID_INTEGRATED_TOUCH := 1

/**
 * @type {Integer (UInt32)}
 */
export global NID_EXTERNAL_TOUCH := 2

/**
 * @type {Integer (UInt32)}
 */
export global NID_INTEGRATED_PEN := 4

/**
 * @type {Integer (UInt32)}
 */
export global NID_EXTERNAL_PEN := 8

/**
 * @type {Integer (UInt32)}
 */
export global NID_MULTI_INPUT := 64

/**
 * @type {Integer (UInt32)}
 */
export global NID_READY := 128

/**
 * @type {Integer (UInt32)}
 */
export global MAX_STR_BLOCKREASON := 256

/**
 * @type {Integer (UInt32)}
 */
export global WM_INTERCEPTED_WINDOW_ACTION := 838

/**
 * @type {Integer (UInt32)}
 */
export global WM_TOOLTIPDISMISS := 837

/**
 * @type {Integer (UInt32)}
 */
export global INVALID_MONITOR_TOPOLOGY_ID := 0

/**
 * @type {Integer (UInt32)}
 */
export global WM_CLOAKED_STATE_CHANGED := 839

/**
 * @type {HBITMAP}
 */
export global HBMMENU_CALLBACK := HBITMAP(-1)

/**
 * @type {HBITMAP}
 */
export global HBMMENU_SYSTEM := HBITMAP(1)

/**
 * @type {HBITMAP}
 */
export global HBMMENU_MBAR_RESTORE := HBITMAP(2)

/**
 * @type {HBITMAP}
 */
export global HBMMENU_MBAR_MINIMIZE := HBITMAP(3)

/**
 * @type {HBITMAP}
 */
export global HBMMENU_MBAR_CLOSE := HBITMAP(5)

/**
 * @type {HBITMAP}
 */
export global HBMMENU_MBAR_CLOSE_D := HBITMAP(6)

/**
 * @type {HBITMAP}
 */
export global HBMMENU_MBAR_MINIMIZE_D := HBITMAP(7)

/**
 * @type {HBITMAP}
 */
export global HBMMENU_POPUP_CLOSE := HBITMAP(8)

/**
 * @type {HBITMAP}
 */
export global HBMMENU_POPUP_RESTORE := HBITMAP(9)

/**
 * @type {HBITMAP}
 */
export global HBMMENU_POPUP_MAXIMIZE := HBITMAP(10)

/**
 * @type {HBITMAP}
 */
export global HBMMENU_POPUP_MINIMIZE := HBITMAP(11)

/**
 * @type {Integer (Int32)}
 */
export global CW_USEDEFAULT := -2147483648

/**
 * @type {Integer (Int32)}
 */
export global LBS_STANDARD := 10485763

/**
 * @type {Integer (Int32)}
 */
export global WINSTA_ALL_ACCESS := 895

/**
 * @type {Integer (UInt32)}
 */
export global WVR_REDRAW := 768

/**
 * @type {Integer (UInt16)}
 */
export global RT_GROUP_CURSOR := 12

/**
 * @type {Integer (UInt16)}
 */
export global RT_GROUP_ICON := 14

/**
 * @type {Integer (UInt16)}
 */
export global RT_MANIFEST := 24

/**
 * @type {Integer (Int32)}
 */
export global IDC_STATIC := -1
;@endregion Constants
