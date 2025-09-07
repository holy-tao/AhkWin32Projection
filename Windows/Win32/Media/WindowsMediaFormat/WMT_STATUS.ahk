#Requires AutoHotkey v2.0.0 64-bit

/**
 * The WMT_STATUS enumeration type defines a range of file status information.
 * @remarks
 * For more information on how this enumeration type is used, see the Remarks section for the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmstatuscallback-onstatus">IWMStatusCallback::OnStatus</a> method.
 * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/ne-wmsdkidl-wmt_status
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class WMT_STATUS{

    /**
     * An error occurred.
     * @type {Integer (Int32)}
     */
    static WMT_ERROR => 0

    /**
     * A file was opened.
     * @type {Integer (Int32)}
     */
    static WMT_OPENED => 1

    /**
     * The reader object is beginning to buffer content.
     * @type {Integer (Int32)}
     */
    static WMT_BUFFERING_START => 2

    /**
     * The reader object has finished buffering content.
     * @type {Integer (Int32)}
     */
    static WMT_BUFFERING_STOP => 3

    /**
     * The end of the file has been reached. Both this member and the next one, <b>WMT_END_OF_FILE</b>, have the value 4.
     * @type {Integer (Int32)}
     */
    static WMT_EOF => 4

    /**
     * The end of the file has been reached. Both this member and the previous one, <b>WMT_EOF</b>, have the value 4.
     * @type {Integer (Int32)}
     */
    static WMT_END_OF_FILE => 4

    /**
     * The end of a segment has been encountered.
     * @type {Integer (Int32)}
     */
    static WMT_END_OF_SEGMENT => 5

    /**
     * The end of a server-side playlist has been reached.
     * @type {Integer (Int32)}
     */
    static WMT_END_OF_STREAMING => 6

    /**
     * The reader object is locating requested data.
     * @type {Integer (Int32)}
     */
    static WMT_LOCATING => 7

    /**
     * A reporting object is connecting to server.
     * @type {Integer (Int32)}
     */
    static WMT_CONNECTING => 8

    /**
     * There is no <a href="https://docs.microsoft.com/windows/desktop/wmformat/wmformat-glossary">license</a> and the content is protected by version 1 digital rights management.
     * @type {Integer (Int32)}
     */
    static WMT_NO_RIGHTS => 9

    /**
     * The file loaded in the reader object contains compressed data for which no codec could be found. The <i>pValue</i> parameter in <b>OnStatus</b> contains a GUID. The first DWORD of this GUID contains the FOURCC or the format tag of the missing codec. The remaining bytes of the GUID can be ignored.
 * 
 * The <i>hr</i> parameter in <b>OnStatus</b> may equal S_OK, although a missing codec would normally be considered an error. Also, this event may be followed by WMT_STARTED with <i>hr</i> equal to S_OK, even if codecs are missing for every stream in the file. In that case, however, the application will not receive any decoded samples, and should stop the reader object.
     * @type {Integer (Int32)}
     */
    static WMT_MISSING_CODEC => 10

    /**
     * A reporting object has begun operations.
     * @type {Integer (Int32)}
     */
    static WMT_STARTED => 11

    /**
     * A reporting object has ceased operations.
     * @type {Integer (Int32)}
     */
    static WMT_STOPPED => 12

    /**
     * A file was closed.
     * @type {Integer (Int32)}
     */
    static WMT_CLOSED => 13

    /**
     * The reader object is playing content at above normal speed, or in reverse.
     * @type {Integer (Int32)}
     */
    static WMT_STRIDING => 14

    /**
     * Timer event.
     * @type {Integer (Int32)}
     */
    static WMT_TIMER => 15

    /**
     * Progress update from the indexer object.
     * @type {Integer (Int32)}
     */
    static WMT_INDEX_PROGRESS => 16

    /**
     * The reader object has begun saving a file from a server.
     * @type {Integer (Int32)}
     */
    static WMT_SAVEAS_START => 17

    /**
     * The reader has stopped saving a file from a server.
     * @type {Integer (Int32)}
     */
    static WMT_SAVEAS_STOP => 18

    /**
     * The current file's header object contains certain attributes that are different from those of the previous file. This event is sent when playing a server-side playlist. Use the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nn-wmsdkidl-iwmheaderinfo">IWMHeaderInfo</a> interface to query for any of the following attributes in a new file: <a href="https://docs.microsoft.com/windows/desktop/wmformat/stridable">Stridable</a>, <a href="https://docs.microsoft.com/windows/desktop/wmformat/broadcast">Broadcast</a>, <a href="https://docs.microsoft.com/windows/desktop/wmformat/seekable">Seekable</a>, and <a href="https://docs.microsoft.com/windows/desktop/wmformat/hasimage">HasImage</a>.
     * @type {Integer (Int32)}
     */
    static WMT_NEW_SOURCEFLAGS => 19

    /**
     * The current file's header object contains metadata attributes that are different from those of the previous file. This event is sent when playing a server-side playlist. Use the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nn-wmsdkidl-iwmheaderinfo">IWMHeaderInfo</a> interface to query for any metadata attribute you are interested in.
     * @type {Integer (Int32)}
     */
    static WMT_NEW_METADATA => 20

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/wmformat/wmformat-glossary">license</a> backup or restore has started.
     * @type {Integer (Int32)}
     */
    static WMT_BACKUPRESTORE_BEGIN => 21

    /**
     * The next source in the playlist was opened.
     * @type {Integer (Int32)}
     */
    static WMT_SOURCE_SWITCH => 22

    /**
     * The <a href="https://docs.microsoft.com/windows/desktop/wmformat/wmformat-glossary">license acquisition</a> process has completed. The <i>pValue</i> parameter in <b>OnStatus</b> contains a <a href="https://docs.microsoft.com/windows/desktop/wmformat/wm-get-license-data">WM_GET_LICENSE_DATA</a> structure. The <b>hr</b> member of this structure indicates whether the license was successfully acquired.
     * @type {Integer (Int32)}
     */
    static WMT_ACQUIRE_LICENSE => 23

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/wmformat/wmformat-glossary">Individualization</a> status message.
     * @type {Integer (Int32)}
     */
    static WMT_INDIVIDUALIZE => 24

    /**
     * The file loaded in the reader object cannot be played without a security update.
     * @type {Integer (Int32)}
     */
    static WMT_NEEDS_INDIVIDUALIZATION => 25

    /**
     * There is no <a href="https://docs.microsoft.com/windows/desktop/wmformat/wmformat-glossary">license</a> and the content is protected by version 7 digital rights management.
     * @type {Integer (Int32)}
     */
    static WMT_NO_RIGHTS_EX => 26

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/wmformat/wmformat-glossary">license</a> backup or restore has finished.
     * @type {Integer (Int32)}
     */
    static WMT_BACKUPRESTORE_END => 27

    /**
     * The backup restorer object is connecting to a server.
     * @type {Integer (Int32)}
     */
    static WMT_BACKUPRESTORE_CONNECTING => 28

    /**
     * The backup restorer object is disconnecting from a server.
     * @type {Integer (Int32)}
     */
    static WMT_BACKUPRESTORE_DISCONNECTING => 29

    /**
     * Error relating to the URL.
     * @type {Integer (Int32)}
     */
    static WMT_ERROR_WITHURL => 30

    /**
     * The backup restorer object cannot back up one or more <a href="https://docs.microsoft.com/windows/desktop/wmformat/wmformat-glossary">licenses</a> because the right has been disallowed by the content owner.
     * @type {Integer (Int32)}
     */
    static WMT_RESTRICTED_LICENSE => 31

    /**
     * Sent when a client (a playing application or server) connects to a writer network sink object. The <i>pValue</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmstatuscallback-onstatus">IWMStatusCallback::OnStatus</a> callback is set to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wmsdkidl/ns-wmsdkidl-wm_client_properties">WM_CLIENT_PROPERTIES</a> structure. New applications should wait for <b>WMT_CLIENT_CONNECT_EX</b> instead.
     * @type {Integer (Int32)}
     */
    static WMT_CLIENT_CONNECT => 32

    /**
     * Sent when a client (a playing application or server) disconnects from a writer network sink object. The <i>pValue</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmstatuscallback-onstatus">IWMStatusCallback::OnStatus</a> callback is set to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wmsdkidl/ns-wmsdkidl-wm_client_properties">WM_CLIENT_PROPERTIES</a> structure. The values in this structure are identical to those sent on connection. New applications should wait for <b>WMT_CLIENT_DISCONNECT_EX</b> instead.
     * @type {Integer (Int32)}
     */
    static WMT_CLIENT_DISCONNECT => 33

    /**
     * Change in output properties.
     * @type {Integer (Int32)}
     */
    static WMT_NATIVE_OUTPUT_PROPS_CHANGED => 34

    /**
     * Start of automatic reconnection to a server.
     * @type {Integer (Int32)}
     */
    static WMT_RECONNECT_START => 35

    /**
     * End of automatic reconnection to a server.
     * @type {Integer (Int32)}
     */
    static WMT_RECONNECT_END => 36

    /**
     * Sent when a client (a playing application or server) connects to a writer network sink object. The <i>pValue</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmstatuscallback-onstatus">IWMStatusCallback::OnStatus</a> callback is set to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wmsdkidl/ns-wmsdkidl-wm_client_propertiesex">WM_CLIENT_PROPERTIES_EX</a> structure.
     * @type {Integer (Int32)}
     */
    static WMT_CLIENT_CONNECT_EX => 37

    /**
     * Sent when a client (a playing application or server) disconnects from a writer network sink object. The <i>pValue</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmstatuscallback-onstatus">IWMStatusCallback::OnStatus</a> callback is set to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wmsdkidl/ns-wmsdkidl-wm_client_propertiesex">WM_CLIENT_PROPERTIES_EX</a> structure. The client properties are identical to those sent on connection except for the <b>pwszDNSName</b> member, which may have changed.
     * @type {Integer (Int32)}
     */
    static WMT_CLIENT_DISCONNECT_EX => 38

    /**
     * Change to the forward error correction span.
     * @type {Integer (Int32)}
     */
    static WMT_SET_FEC_SPAN => 39

    /**
     * The reader is ready to begin buffering content.
     * @type {Integer (Int32)}
     */
    static WMT_PREROLL_READY => 40

    /**
     * The reader is finished buffering.
     * @type {Integer (Int32)}
     */
    static WMT_PREROLL_COMPLETE => 41

    /**
     * Sent by a writer network sink when one or more properties of a connected client changes. The <i>pValue</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmstatuscallback-onstatus">IWMStatusCallback::OnStatus</a> callback is set to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wmsdkidl/ns-wmsdkidl-wm_client_propertiesex">WM_CLIENT_PROPERTIES_EX</a> structure. This usually means that a DNS name is present for a client for which none was available at connection.
     * @type {Integer (Int32)}
     */
    static WMT_CLIENT_PROPERTIES => 42

    /**
     * Sent before a <b>WMT_NO_RIGHTS</b> or <b>WMT_NO_RIGHTS_EX</b> status message. The <i>pValue</i> parameter is set to one of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wmsdkidl/ne-wmsdkidl-wmt_drmla_trust">WMT_DRMLA_TRUST</a> constants indicating whether the <a href="https://docs.microsoft.com/windows/desktop/wmformat/wmformat-glossary">license acquisition</a> URL is completely trusted.
     * @type {Integer (Int32)}
     */
    static WMT_LICENSEURL_SIGNATURE_STATE => 43

    /**
     * Sent when the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmreaderplaylistburn-initplaylistburn">IWMReaderPlaylistBurn::InitPlaylistBurn</a> method returns.
     * @type {Integer (Int32)}
     */
    static WMT_INIT_PLAYLIST_BURN => 44

    /**
     * Sent when the DRM transcryptor object is initialized with a file.
     * @type {Integer (Int32)}
     */
    static WMT_TRANSCRYPTOR_INIT => 45

    /**
     * Sent when the DRM transcryptor object seeks to a point in a file.
     * @type {Integer (Int32)}
     */
    static WMT_TRANSCRYPTOR_SEEKED => 46

    /**
     * Sent when the DRM transcryptor object delivers Windows Media DRM 10 for Network Devices data from a DRM-protected file.
     * @type {Integer (Int32)}
     */
    static WMT_TRANSCRYPTOR_READ => 47

    /**
     * Sent when the DRM transcryptor object is closed. After receiving this message, you can release the interface.
     * @type {Integer (Int32)}
     */
    static WMT_TRANSCRYPTOR_CLOSED => 48

    /**
     * Sent when the proximity detection protocol has finished.
     * @type {Integer (Int32)}
     */
    static WMT_PROXIMITY_RESULT => 49

    /**
     * Sent when proximity detection thread has stopped running. The application must not release the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nn-wmsdkidl-iwmproximitydetection">IWMProximityDetection</a> interface until this message is received. Once launched, the thread runs for two minutes; there is no way to terminate the thread before two minutes have elapsed.
     * @type {Integer (Int32)}
     */
    static WMT_PROXIMITY_COMPLETED => 50

    /**
     * Sent when a content enabler is required.
     * @type {Integer (Int32)}
     */
    static WMT_CONTENT_ENABLER => 51
}
