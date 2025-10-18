#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk

/**
 * @namespace Windows.Win32.Security.ConfigurationSnapin
 * @version v4.0.30319
 */
class ConfigurationSnapin {

;@region Constants

    /**
     * @type {String}
     */
    static cNodetypeSceTemplateServices => "{24a7f717-1f0c-11d1-affb-00c04fb984f9}"

    /**
     * @type {String}
     */
    static cNodetypeSceAnalysisServices => "{678050c7-1ff8-11d1-affb-00c04fb984f9}"

    /**
     * @type {String}
     */
    static cNodetypeSceEventLog => "{2ce06698-4bf3-11d1-8c30-00c04fb984f9}"

    /**
     * @type {Integer (Int32)}
     */
    static SCESTATUS_SUCCESS => 0

    /**
     * @type {Integer (Int32)}
     */
    static SCESTATUS_INVALID_PARAMETER => 1

    /**
     * @type {Integer (Int32)}
     */
    static SCESTATUS_RECORD_NOT_FOUND => 2

    /**
     * @type {Integer (Int32)}
     */
    static SCESTATUS_INVALID_DATA => 3

    /**
     * @type {Integer (Int32)}
     */
    static SCESTATUS_OBJECT_EXIST => 4

    /**
     * @type {Integer (Int32)}
     */
    static SCESTATUS_BUFFER_TOO_SMALL => 5

    /**
     * @type {Integer (Int32)}
     */
    static SCESTATUS_PROFILE_NOT_FOUND => 6

    /**
     * @type {Integer (Int32)}
     */
    static SCESTATUS_BAD_FORMAT => 7

    /**
     * @type {Integer (Int32)}
     */
    static SCESTATUS_NOT_ENOUGH_RESOURCE => 8

    /**
     * @type {Integer (Int32)}
     */
    static SCESTATUS_ACCESS_DENIED => 9

    /**
     * @type {Integer (Int32)}
     */
    static SCESTATUS_CANT_DELETE => 10

    /**
     * @type {Integer (Int32)}
     */
    static SCESTATUS_PREFIX_OVERFLOW => 11

    /**
     * @type {Integer (Int32)}
     */
    static SCESTATUS_OTHER_ERROR => 12

    /**
     * @type {Integer (Int32)}
     */
    static SCESTATUS_ALREADY_RUNNING => 13

    /**
     * @type {Integer (Int32)}
     */
    static SCESTATUS_SERVICE_NOT_SUPPORT => 14

    /**
     * @type {Integer (Int32)}
     */
    static SCESTATUS_MOD_NOT_FOUND => 15

    /**
     * @type {Integer (Int32)}
     */
    static SCESTATUS_EXCEPTION_IN_SERVER => 16

    /**
     * @type {Integer (Int32)}
     */
    static SCESTATUS_NO_TEMPLATE_GIVEN => 17

    /**
     * @type {Integer (Int32)}
     */
    static SCESTATUS_NO_MAPPING => 18

    /**
     * @type {Integer (Int32)}
     */
    static SCESTATUS_TRUST_FAIL => 19

    /**
     * @type {String}
     */
    static SCE_ROOT_PATH => "Software\Microsoft\Windows NT\CurrentVersion\SeCEdit"

    /**
     * @type {Integer (Int32)}
     */
    static SCESVC_ENUMERATION_MAX => 100

    /**
     * @type {String}
     */
    static struuidNodetypeSceTemplateServices => "{24a7f717-1f0c-11d1-affb-00c04fb984f9}"

    /**
     * @type {String}
     */
    static lstruuidNodetypeSceTemplateServices => "{24a7f717-1f0c-11d1-affb-00c04fb984f9}"

    /**
     * @type {String}
     */
    static struuidNodetypeSceAnalysisServices => "{678050c7-1ff8-11d1-affb-00c04fb984f9}"

    /**
     * @type {String}
     */
    static lstruuidNodetypeSceAnalysisServices => "{678050c7-1ff8-11d1-affb-00c04fb984f9}"

    /**
     * @type {String}
     */
    static struuidNodetypeSceEventLog => "{2ce06698-4bf3-11d1-8c30-00c04fb984f9}"

    /**
     * @type {String}
     */
    static lstruuidNodetypeSceEventLog => "{2ce06698-4bf3-11d1-8c30-00c04fb984f9}"

    /**
     * @type {String}
     */
    static CCF_SCESVC_ATTACHMENT => "CCF_SCESVC_ATTACHMENT"

    /**
     * @type {String}
     */
    static CCF_SCESVC_ATTACHMENT_DATA => "CCF_SCESVC_ATTACHMENT_DATA"
;@endregion Constants

;@region Methods
;@endregion Methods
}
