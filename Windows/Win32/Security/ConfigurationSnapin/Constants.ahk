#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Security.ConfigurationSnapin
 */

;@region Constants

/**
 * @type {Guid}
 */
export global cNodetypeSceTemplateServices := Guid("{24a7f717-1f0c-11d1-affb-00c04fb984f9}")

/**
 * @type {Guid}
 */
export global cNodetypeSceAnalysisServices := Guid("{678050c7-1ff8-11d1-affb-00c04fb984f9}")

/**
 * @type {Guid}
 */
export global cNodetypeSceEventLog := Guid("{2ce06698-4bf3-11d1-8c30-00c04fb984f9}")

/**
 * @type {Integer (Int32)}
 */
export global SCESTATUS_SUCCESS := 0

/**
 * @type {Integer (Int32)}
 */
export global SCESTATUS_INVALID_PARAMETER := 1

/**
 * @type {Integer (Int32)}
 */
export global SCESTATUS_RECORD_NOT_FOUND := 2

/**
 * @type {Integer (Int32)}
 */
export global SCESTATUS_INVALID_DATA := 3

/**
 * @type {Integer (Int32)}
 */
export global SCESTATUS_OBJECT_EXIST := 4

/**
 * @type {Integer (Int32)}
 */
export global SCESTATUS_BUFFER_TOO_SMALL := 5

/**
 * @type {Integer (Int32)}
 */
export global SCESTATUS_PROFILE_NOT_FOUND := 6

/**
 * @type {Integer (Int32)}
 */
export global SCESTATUS_BAD_FORMAT := 7

/**
 * @type {Integer (Int32)}
 */
export global SCESTATUS_NOT_ENOUGH_RESOURCE := 8

/**
 * @type {Integer (Int32)}
 */
export global SCESTATUS_ACCESS_DENIED := 9

/**
 * @type {Integer (Int32)}
 */
export global SCESTATUS_CANT_DELETE := 10

/**
 * @type {Integer (Int32)}
 */
export global SCESTATUS_PREFIX_OVERFLOW := 11

/**
 * @type {Integer (Int32)}
 */
export global SCESTATUS_OTHER_ERROR := 12

/**
 * @type {Integer (Int32)}
 */
export global SCESTATUS_ALREADY_RUNNING := 13

/**
 * @type {Integer (Int32)}
 */
export global SCESTATUS_SERVICE_NOT_SUPPORT := 14

/**
 * @type {Integer (Int32)}
 */
export global SCESTATUS_MOD_NOT_FOUND := 15

/**
 * @type {Integer (Int32)}
 */
export global SCESTATUS_EXCEPTION_IN_SERVER := 16

/**
 * @type {Integer (Int32)}
 */
export global SCESTATUS_NO_TEMPLATE_GIVEN := 17

/**
 * @type {Integer (Int32)}
 */
export global SCESTATUS_NO_MAPPING := 18

/**
 * @type {Integer (Int32)}
 */
export global SCESTATUS_TRUST_FAIL := 19

/**
 * @type {String}
 */
export global SCE_ROOT_PATH := "Software\Microsoft\Windows NT\CurrentVersion\SeCEdit"

/**
 * @type {Integer (Int32)}
 */
export global SCESVC_ENUMERATION_MAX := 100

/**
 * @type {String}
 */
export global struuidNodetypeSceTemplateServices := "{24a7f717-1f0c-11d1-affb-00c04fb984f9}"

/**
 * @type {String}
 */
export global lstruuidNodetypeSceTemplateServices := "{24a7f717-1f0c-11d1-affb-00c04fb984f9}"

/**
 * @type {String}
 */
export global struuidNodetypeSceAnalysisServices := "{678050c7-1ff8-11d1-affb-00c04fb984f9}"

/**
 * @type {String}
 */
export global lstruuidNodetypeSceAnalysisServices := "{678050c7-1ff8-11d1-affb-00c04fb984f9}"

/**
 * @type {String}
 */
export global struuidNodetypeSceEventLog := "{2ce06698-4bf3-11d1-8c30-00c04fb984f9}"

/**
 * @type {String}
 */
export global lstruuidNodetypeSceEventLog := "{2ce06698-4bf3-11d1-8c30-00c04fb984f9}"

/**
 * @type {String}
 */
export global CCF_SCESVC_ATTACHMENT := "CCF_SCESVC_ATTACHMENT"

/**
 * @type {String}
 */
export global CCF_SCESVC_ATTACHMENT_DATA := "CCF_SCESVC_ATTACHMENT_DATA"
;@endregion Constants
