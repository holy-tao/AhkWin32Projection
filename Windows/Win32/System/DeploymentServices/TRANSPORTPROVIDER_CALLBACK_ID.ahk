#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * This structure is used by the WdsTransportServerRegisterCallback function.
 * @see https://learn.microsoft.com/windows/win32/api/wdstpdi/ne-wdstpdi-transportprovider_callback_id
 * @namespace Windows.Win32.System.DeploymentServices
 * @version v4.0.30319
 */
class TRANSPORTPROVIDER_CALLBACK_ID extends Win32Enum{

    /**
     * Identifies the <a href="https://docs.microsoft.com/windows/desktop/api/wdstpdi/nf-wdstpdi-wdstransportprovidercreateinstance">WdsTransportProviderCreateInstance</a> callback.
     * @type {Integer (Int32)}
     */
    static WDS_TRANSPORTPROVIDER_CREATE_INSTANCE => 0

    /**
     * Identifies the <a href="https://docs.microsoft.com/windows/desktop/api/wdstpdi/nf-wdstpdi-wdstransportprovidercomparecontent">WdsTransportProviderCompareContent</a> callback.
     * @type {Integer (Int32)}
     */
    static WDS_TRANSPORTPROVIDER_COMPARE_CONTENT => 1

    /**
     * Identifies the <a href="https://docs.microsoft.com/windows/desktop/api/wdstpdi/nf-wdstpdi-wdstransportprovideropencontent">WdsTransportProviderOpenContent</a> callback.
     * @type {Integer (Int32)}
     */
    static WDS_TRANSPORTPROVIDER_OPEN_CONTENT => 2

    /**
     * Identifies the <a href="https://docs.microsoft.com/windows/desktop/api/wdstpdi/nf-wdstpdi-wdstransportprovideruseraccesscheck">WdsTransportProviderUserAccessCheck</a> callback.
     * @type {Integer (Int32)}
     */
    static WDS_TRANSPORTPROVIDER_USER_ACCESS_CHECK => 3

    /**
     * Identifies the <a href="https://docs.microsoft.com/windows/desktop/api/wdstpdi/nf-wdstpdi-wdstransportprovidergetcontentsize">WdsTransportProviderGetContentSize</a> callback.
     * @type {Integer (Int32)}
     */
    static WDS_TRANSPORTPROVIDER_GET_CONTENT_SIZE => 4

    /**
     * Identifies the <a href="https://docs.microsoft.com/windows/desktop/api/wdstpdi/nf-wdstpdi-wdstransportproviderreadcontent">WdsTransportProviderReadContent</a> callback.
     * @type {Integer (Int32)}
     */
    static WDS_TRANSPORTPROVIDER_READ_CONTENT => 5

    /**
     * Identifies the <a href="https://docs.microsoft.com/windows/desktop/api/wdstpdi/nf-wdstpdi-wdstransportproviderclosecontent">WdsTransportProviderCloseContent</a> callback.
     * @type {Integer (Int32)}
     */
    static WDS_TRANSPORTPROVIDER_CLOSE_CONTENT => 6

    /**
     * Identifies the <a href="https://docs.microsoft.com/windows/desktop/api/wdstpdi/nf-wdstpdi-wdstransportprovidercloseinstance">WdsTransportProviderCloseInstance</a> callback.
     * @type {Integer (Int32)}
     */
    static WDS_TRANSPORTPROVIDER_CLOSE_INSTANCE => 7

    /**
     * Identifies the <a href="https://docs.microsoft.com/windows/desktop/api/wdstpdi/nf-wdstpdi-wdstransportprovidershutdown">WdsTransportProviderShutdown</a> callback.
     * @type {Integer (Int32)}
     */
    static WDS_TRANSPORTPROVIDER_SHUTDOWN => 8

    /**
     * Identifies the <a href="https://docs.microsoft.com/windows/desktop/api/wdstpdi/nf-wdstpdi-wdstransportproviderdumpstate">WdsTransportProviderDumpState</a> callback.
     * @type {Integer (Int32)}
     */
    static WDS_TRANSPORTPROVIDER_DUMP_STATE => 9

    /**
     * Identifies the <a href="https://docs.microsoft.com/windows/desktop/api/wdstpdi/nf-wdstpdi-wdstransportproviderrefreshsettings">WdsTransportProviderRefreshSettings</a> callback.
     * @type {Integer (Int32)}
     */
    static WDS_TRANSPORTPROVIDER_REFRESH_SETTINGS => 10

    /**
     * Identifies the <a href="https://docs.microsoft.com/windows/desktop/api/wdstpdi/nf-wdstpdi-wdstransportprovidergetcontentmetadata">WdsTransportProviderGetContentMetadata</a> callback.
     * @type {Integer (Int32)}
     */
    static WDS_TRANSPORTPROVIDER_GET_CONTENT_METADATA => 11

    /**
     * Used for validation checking.
     * @type {Integer (Int32)}
     */
    static WDS_TRANSPORTPROVIDER_MAX_CALLBACKS => 12
}
