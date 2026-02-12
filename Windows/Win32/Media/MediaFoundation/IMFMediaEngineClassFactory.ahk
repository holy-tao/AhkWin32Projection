#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMFMediaEngine.ahk
#Include .\IMFMediaTimeRange.ahk
#Include .\IMFMediaError.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Creates an instance of the Media Engine.
 * @remarks
 * Before using this interface, call <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-coinitializeex">CoInitializeEx</a> and <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfstartup">MFStartup</a>.
 * 
 * To get a pointer to this interface, call <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cocreateinstance">CoCreateInstance</a>. The class identifier is <b>CLSID_MFMediaEngineClassFactory</b>.
 * @see https://learn.microsoft.com/windows/win32/api//content/mfmediaengine/nn-mfmediaengine-imfmediaengineclassfactory
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFMediaEngineClassFactory extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFMediaEngineClassFactory
     * @type {Guid}
     */
    static IID => Guid("{4d645ace-26aa-4688-9be1-df3516990b93}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateInstance", "CreateTimeRange", "CreateError"]

    /**
     * Creates a new instance of the Media Engine.
     * @remarks
     * Before calling this method, call <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfstartup">MFStartup</a>.
     * 
     * The Media Engine supports three distinct modes:
     * 
     * <table>
     * <tr>
     * <th>Mode</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>Frame-server mode</td>
     * <td>
     * In this mode, the Media Engine delivers uncompressed video frames to the application. The application is responsible for displaying each frame, using Microsoft Direct3D or any other rendering technique. 
     * 
     * The Media Engine renders the audio; the application is not responsible for audio rendering.
     * 
     * Frame-server mode is the default mode. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>Rendering mode</td>
     * <td>
     * In this mode, the Media Engine renders both audio and video. The video is rendered to a window or Microsoft DirectComposition visual provided by the application.
     * 
     * To enable rendering mode, set either the <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-media-engine-playback-hwnd">MF_MEDIA_ENGINE_PLAYBACK_HWND</a> attribute or the  <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-media-engine-playback-visual">MF_MEDIA_ENGINE_PLAYBACK_VISUAL</a> attribute.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>Audio  mode</td>
     * <td>
     * In this mode, the Media Engine renders audio only, with no video.
     * 
     * To enable audio mode, set the <b>MF_MEDIA_ENGINE_AUDIOONLY</b> flag in the <i>dwFlags</i> parameter.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <h3><a id="Intialization_Attributes"></a><a id="intialization_attributes"></a><a id="INTIALIZATION_ATTRIBUTES"></a>Initialization Attributes</h3>
     * The following attributes are defined for the <i>pAttr</i> parameter. Some are required, and some are optional, depending on the  mode you want. 
     * 
     * <table>
     * <tr>
     * <th>Feature</th>
     * <th>Attributes</th>
     * <th>Frame Server Mode</th>
     * <th>Rendering Mode</th>
     * <th>Audio Mode</th>
     * </tr>
     * <tr>
     * <td>Event callback</td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-media-engine-callback">MF_MEDIA_ENGINE_CALLBACK</a>
     * </td>
     * <td>Required.</td>
     * <td>Required.</td>
     * <td>Required.</td>
     * </tr>
     * <tr>
     * <td>Render target</td>
     * <td>
     * One of the following:
     * 
     * <dl>
     * <dd>
     * <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-media-engine-playback-hwnd">MF_MEDIA_ENGINE_PLAYBACK_HWND</a>
     * </dd>
     * <dd>
     * <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-media-engine-playback-visual">MF_MEDIA_ENGINE_PLAYBACK_VISUAL</a>
     * </dd>
     * </dl>
     * These attributes are mutually exclusive. Setting either of these attributes puts the Media Engine into rendering mode.
     * 
     * </td>
     * <td>Do not set.</td>
     * <td>Required. </td>
     * <td>Do not set.</td>
     * </tr>
     * <tr>
     * <td>Direct3D format</td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-media-engine-video-output-format">MF_MEDIA_ENGINE_VIDEO_OUTPUT_FORMAT</a>
     * </td>
     * <td>Required.</td>
     * <td>Optional.</td>
     * <td>Do not set.</td>
     * </tr>
     * <tr>
     * <td>Microsoft DirectX Graphics Infrastructure (DXGI) device  manager</td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-media-engine-dxgi-manager">MF_MEDIA_ENGINE_DXGI_MANAGER</a>
     * </td>
     * <td>Optional.</td>
     * <td>Optional.</td>
     * <td>Do not set.</td>
     * </tr>
     * <tr>
     * <td>Media Engine extensions</td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-media-engine-extension">MF_MEDIA_ENGINE_EXTENSION</a>
     * </td>
     * <td>Optional.</td>
     * <td>Optional.</td>
     * <td>Optional.</td>
     * </tr>
     * <tr>
     * <td>Content protection</td>
     * <td>
     * Any of the following:
     * 
     * <dl>
     * <dd>
     * <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-media-engine-opm-hwnd">MF_MEDIA_ENGINE_OPM_HWND</a>
     * </dd>
     * <dd>
     * <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-media-engine-content-protection-flags">MF_MEDIA_ENGINE_CONTENT_PROTECTION_FLAGS</a>
     * </dd>
     * <dd>
     * <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-media-engine-content-protection-manager">MF_MEDIA_ENGINE_CONTENT_PROTECTION_MANAGER</a>
     * </dd>
     * </dl>
     * </td>
     * <td>Optional.</td>
     * <td>Optional.</td>
     * <td>Optional.</td>
     * </tr>
     * <tr>
     * <td>Audio playback</td>
     * <td>
     * Any of the following:
     * 
     * <dl>
     * <dd>
     * <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-media-engine-audio-category">MF_MEDIA_ENGINE_AUDIO_CATEGORY</a>
     * </dd>
     * <dd>
     * <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-media-engine-audio-endpoint-role">MF_MEDIA_ENGINE_AUDIO_ENDPOINT_ROLE</a>
     * </dd>
     * </dl>
     * </td>
     * <td>Optional.</td>
     * <td>Optional.</td>
     * <td>Optional.</td>
     * </tr>
     * </table>
     *  
     * 
     * <h3><a id="Windows_Phone_8"></a><a id="windows_phone_8"></a><a id="WINDOWS_PHONE_8"></a>Windows Phone 8</h3>
     *  This API is supported.
     * 
     * On the phone, the Media Engine only supports frame-server mode. Attempting to initialize the interface in either rendering mode or audio mode will fail.
     * @param {Integer} dwFlags A bitwise <b>OR</b> of zero or more flags from the <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/ne-mfmediaengine-mf_media_engine_createflags">MF_MEDIA_ENGINE_CREATEFLAGS</a> enumeration.
     * @param {IMFAttributes} pAttr A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfattributes">IMFAttributes</a> interface of an attribute store. 
     * 
     * This parameter  specifies configuration attributes for the Media Engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfcreateattributes">MFCreateAttributes</a> to create the attribute store. Then, set one or more attributes from the list of <a href="https://docs.microsoft.com/windows/desktop/medfound/media-engine-attributes">Media Engine Attributes</a>. For details, see Remarks.
     * @returns {IMFMediaEngine} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/nn-mfmediaengine-imfmediaengine">IMFMediaEngine</a> interface. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api//content/mfmediaengine/nf-mfmediaengine-imfmediaengineclassfactory-createinstance
     */
    CreateInstance(dwFlags, pAttr) {
        result := ComCall(3, this, "uint", dwFlags, "ptr", pAttr, "ptr*", &ppPlayer := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IMFMediaEngine(ppPlayer)
    }

    /**
     * Creates a time range object.
     * @returns {IMFMediaTimeRange} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/nn-mfmediaengine-imfmediatimerange">IMFMediaTimeRange</a> interface. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api//content/mfmediaengine/nf-mfmediaengine-imfmediaengineclassfactory-createtimerange
     */
    CreateTimeRange() {
        result := ComCall(4, this, "ptr*", &ppTimeRange := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IMFMediaTimeRange(ppTimeRange)
    }

    /**
     * Creates a media error object.
     * @returns {IMFMediaError} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/nn-mfmediaengine-imfmediaerror">IMFMediaError</a> interface. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api//content/mfmediaengine/nf-mfmediaengine-imfmediaengineclassfactory-createerror
     */
    CreateError() {
        result := ComCall(5, this, "ptr*", &ppError := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IMFMediaError(ppError)
    }
}
