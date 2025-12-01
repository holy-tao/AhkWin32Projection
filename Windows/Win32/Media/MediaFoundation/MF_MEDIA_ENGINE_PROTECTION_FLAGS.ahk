#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Contains flags that specify whether the Media Engine will play protected content, and whether the Media Engine will use the Protected Media Path (PMP).
 * @remarks
 * These flags are used with the <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-media-engine-content-protection-flags">MF_MEDIA_ENGINE_CONTENT_PROTECTION_FLAGS</a> attribute.
 * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/ne-mfmediaengine-mf_media_engine_protection_flags
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MF_MEDIA_ENGINE_PROTECTION_FLAGS extends Win32Enum{

    /**
     * Enable playback of protected content. The Media Engine will not play DRM-protected content unless this flag is set. If you set this flag, also set the <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-media-engine-content-protection-manager">MF_MEDIA_ENGINE_CONTENT_PROTECTION_MANAGER</a> attribute.
     * @type {Integer (Int32)}
     */
    static MF_MEDIA_ENGINE_ENABLE_PROTECTED_CONTENT => 1

    /**
     * Use the <a href="https://docs.microsoft.com/windows/desktop/medfound/protected-media-path">Protected Media Path</a> (PMP) for all playback, including clear (non-protected) content.
     * @type {Integer (Int32)}
     */
    static MF_MEDIA_ENGINE_USE_PMP_FOR_ALL_CONTENT => 2

    /**
     * Create the PMP inside an unprotected process. You can use this option to play clear content, but not to play protected content.
     * @type {Integer (Int32)}
     */
    static MF_MEDIA_ENGINE_USE_UNPROTECTED_PMP => 4
}
